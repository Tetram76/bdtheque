﻿using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.DirectX.Direct3D;
using Microsoft.DirectX;

namespace DXEngine
{
    public class D3DMesh : Object3D, IRenderable
    {
        Mesh mesh = null; // Our mesh object in sysmem
        ProgressiveMesh pmesh = null; // Our mesh object in sysmem
        Material[] meshMaterials; // Materials for our mesh
        Texture[] meshTextures; // Textures for our mesh
        public string fichier;
        public int useProgessive = -1;

        public D3DMesh(Engine Engine, string Name) : base(Engine, Name) { }

        public int lod
        {
            get { return useProgessive; }
            set
            {
                useProgessive = value;
                pmesh.NumberVertices = (int)(pmesh.MaxVertices * 10 * value / 100);
                pmesh.NumberFaces = (int)(pmesh.MaxFaces * 10 * value / 100);
            }
        }
        internal void DoRender(Device device, int i)
        {
            // set the device material and texture
            device.Material = meshMaterials[i];
            device.SetTexture(0, meshTextures[i]);
            if (useProgessive >= 0 && useProgessive < 10)
                pmesh.DrawSubset(i);
            else
                mesh.DrawSubset(i);
        }

        internal void Render(Device device, bool canDrawOpaque, bool canDrawAlpha)
        {
            device.RenderState.CullMode = Cull.None;
            device.Transform.World = this.World;

            if (canDrawOpaque)
            {
                for (int i = 0; i < meshMaterials.Length; i++)
                    if (meshMaterials[i].DiffuseColor.Alpha == 1.0f)
                        DoRender(device, i);
            }

            if (canDrawAlpha)
            {
                device.RenderState.AlphaBlendEnable = true;
                device.RenderState.SourceBlend = Blend.SourceAlpha;
                device.RenderState.DestinationBlend = Blend.InvSourceAlpha;

                for (int i = 0; i < meshMaterials.Length; i++)
                    if (meshMaterials[i].DiffuseColor.Alpha < 1.0f)
                        DoRender(device, i);
                device.RenderState.AlphaBlendEnable = false;
            }
        }

        public void Render(Device device, DeviceInfo deviceInfo) { Render(device, true, true); }

        public void InitDevice(Device device, bool isReset)
        {
            ExtendedMaterial[] materials = null;
            GraphicsStream adjacency;
            mesh = Mesh.FromFile(fichier, MeshFlags.SystemMemory, device, out adjacency, out materials);

            //using (Mesh tmpMesh = Mesh.Clean(CleanType.Simplification | CleanType.Optimization, mesh, adjacency, adjacency))
            //{
            //    pmesh = new ProgressiveMesh(tmpMesh, adjacency, null, 1, MeshFlags.SimplifyFace);

            //    pmesh.NumberFaces = pmesh.MaxFaces;
            //    pmesh.NumberVertices = pmesh.MaxVertices;
            //    useProgessive = 10;
            //};

            //            using (adjacency)
            //                mesh.OptimizeInPlace(MeshFlags.OptimizeVertexCache | MeshFlags.OptimizeCompact | MeshFlags.OptimizeAttributeSort, adjacency);

            if (meshTextures == null)
            {
                meshTextures = new Texture[materials.Length];
                meshMaterials = new Material[materials.Length];
                for (int i = 0; i < materials.Length; i++)
                {
                    meshMaterials[i] = materials[i].Material3D;
                    // Set the ambient color for the material (D3DX does not do this)
                    meshMaterials[i].Ambient = meshMaterials[i].Diffuse;

                    if (!string.IsNullOrEmpty(materials[i].TextureFilename))
                    {
                        string textureFile = System.IO.Path.Combine(System.IO.Path.GetDirectoryName(fichier), materials[i].TextureFilename);
                        meshTextures[i] = TextureLoader.FromFile(device, textureFile);
                    }
                }
            }

        }

        public void LostDevice(Device device) { }

        public float ComputeBoundingSphere(out Vector3 center)
        {
            if (mesh == null)
                throw new InvalidOperationException("There is no system memory mesh.  Nothing to do here.");

            GraphicsStream data = null;
            try
            {
                data = mesh.LockVertexBuffer(LockFlags.ReadOnly);
                return Geometry.ComputeBoundingSphere(data, mesh.NumberVertices, mesh.VertexFormat, out center);
            }
            finally
            {
                if (data != null) mesh.UnlockVertexBuffer();
            }
        }

        public void ComputeBoundingBox(out Vector3 min, out Vector3 max)
        {
            if (mesh == null)
                throw new InvalidOperationException("There is no system memory mesh.  Nothing to do here.");

            GraphicsStream data = null;
            try
            {
                data = mesh.LockVertexBuffer(LockFlags.ReadOnly);
                Geometry.ComputeBoundingBox(data, mesh.NumberVertices, mesh.VertexFormat, out min, out max);
                return;
            }
            finally
            {
                if (data != null) mesh.UnlockVertexBuffer();
            }
        }
    }
}
