using System;
using System.Text;
using TetramCorp.Database;
using TetramCorp.Utilities;

namespace BD.Common.Records
{
	/// <summary>
	/// 
	/// </summary>
	public class Album: BaseRecord
	{
		[SQLDataField] [IsReference] public int RefAlbum;
		[SQLDataField] public int Tome;
		[SQLDataField] public int TomeDebut;
		[SQLDataField] public int TomeFin;
		[SQLDataField("TitreAlbum")] public FormatedTitle Titre = new FormatedTitle(string.Empty);
		[SQLDataField("RefSerie")] public int RefS�rie;
		[SQLDataField("TitreSerie")] public FormatedTitle S�rie = new FormatedTitle(string.Empty);
		[SQLDataField] public int RefEditeur;
		[SQLDataField] public FormatedTitle Editeur = new FormatedTitle(string.Empty);
		[SQLDataField("AnneeEdition")] public int Ann�eEdition;
		[SQLDataField] public bool Stock;
		[SQLDataField] public bool Integrale;
		[SQLDataField("HorsSerie")] public bool HorsS�rie;
		[SQLDataField] public bool Achat;
		[SQLDataField] public bool Complet;

		public override string ToString()
		{
			return ToString(false);
		}

		public string ToString(bool simple)
		{
			StringBuilder result = new StringBuilder();
			if (simple)
				result.Append(Titre.RawTitle);
			else
				result.Append(Titre.ToString());

			StringBuilder dummy = new StringBuilder();
			StringUtils.AjoutString(dummy, S�rie.ToString(), " - ");
			if (Integrale)
			{
				StringBuilder dummy2 = new StringBuilder(StringUtils.NotZero(TomeDebut.ToString()));
				StringUtils.AjoutString(dummy2, StringUtils.NotZero(TomeFin.ToString()), " � ");
				StringUtils.AjoutString(dummy, "INT.", " - ", string.Empty, (" " + StringUtils.NotZero(Tome.ToString())).Trim());
				StringUtils.AjoutString(dummy, dummy2, " ", "[", "]");
			} 
			else if (HorsS�rie)
				StringUtils.AjoutString(dummy, "HS", " - ", String.Empty, (" " + StringUtils.NotZero(Tome.ToString())).Trim());
			else
				StringUtils.AjoutString(dummy, StringUtils.NotZero(Tome.ToString()), " - ", "T. ");
			StringUtils.AjoutString(result, dummy, " ", "(", ")");
			return result.ToString();
		}
	}

	public abstract class AlbumComplet : BaseRecordComplet
	{

	}

}
