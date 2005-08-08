using System;
using System.Text;
using System.Collections;
using TetramCorp.Utilities;
using TetramCorp.Database;

namespace BD.Common.Records
{
	public class S�rie: BaseRecord
	{
		[SQLDataField] [IsReference] public int RefS�rie;
		[SQLDataField] public FormatedTitle TitreS�rie = new FormatedTitle(string.Empty);
		[SQLDataClass] public Editeur EditeurS�rie = new Editeur();
		[SQLDataClass] public Collection CollectionS�rie = new Collection();
		
		public override string ToString()
		{
			return ToString(false);
		}

		public string ToString(bool simple)
		{
			try
			{
				StringBuilder result = new StringBuilder();
				if (simple)
					result.Append(TitreS�rie.RawTitle);
				else
					result.Append(TitreS�rie.ToString());

				StringBuilder dummy = new StringBuilder();
				StringUtils.AjoutString(dummy, EditeurS�rie.NomEditeur.ToString(), " ");
				StringUtils.AjoutString(dummy, CollectionS�rie.NomCollection.ToString(), " - ");
				StringUtils.AjoutString(result, dummy, " ", "(", ")");
				return result.ToString();
			}
			catch (Exception Ex)
			{
				return string.Format("Erreur dans {0}.ToString(): {1}", Ex.GetType().Name, Ex.Message);
			}
		}
	}

	[ClassFactory(typeof(S�rieComplet))]
	public class S�rieCompletFactory : RecordCompletFactory
	{
		public S�rieComplet NewInstance(int refS�rie, int refAuteur)
		{
			S�rieComplet result = Activator.CreateInstance(Classe) as S�rieComplet;
			result.FIdAuteur = refAuteur;
			Fill(result, refS�rie);
			return result;
		}	
	}

	public class S�rieComplet : BaseRecordComplet
	{
		[SQLDataField] public int RefS�rie;
		[SQLDataField("TITRESERIE")] public FormatedTitle Titre = new FormatedTitle();
		[SQLDataField] public int Termin�e;
		public ArrayList Albums = new ArrayList();
		public GenreCollection Genres = new GenreCollection();
		[SQLDataField("SUJETSERIE")] public string Sujet;
		[SQLDataField("REMARQUESSERIE")] public string Notes;
		[SQLDataClass] public EditeurComplet Editeur = new EditeurComplet();
		[SQLDataClass] public Collection Collection = new Collection();
		[SQLDataField] public string SiteWeb;
		public ArrayList Sc�naristes = new ArrayList();
		public ArrayList Dessinateurs = new ArrayList();
		public ArrayList Coloristes = new ArrayList();

		public int FIdAuteur = -1;

		public override string ToString()
		{
			return Titre.ToString ();
		}
	}

}
