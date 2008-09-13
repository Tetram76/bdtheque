unit uPSR_LoadComplet;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface

uses
  SysUtils, Classes, uPSRuntime;

{ run-time registration functions }
procedure RIRegister_TAlbumComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEditionsComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TListOfTEditionComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEditionComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TAuteurComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TListOfTSerieComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TSerieComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TCollectionComplete(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEditeurComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TListComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TInfoComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TObjetComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_TBaseComplet(CL: TPSRuntimeClassImporter);
procedure RIRegister_LoadComplet(CL: TPSRuntimeClassImporter);

implementation

uses
  Windows, Dialogs, TypeRec, Commun, CommonConst, DM_Princ, DateUtils, ListOfTypeRec, Contnrs, LoadComplet;

(* === run-time registration functions === *)

procedure TAlbumCompletEditions_W(Self: TAlbumComplet; const T: TEditionsComplet);
begin
  Self.Editions := T;
end;

procedure TAlbumCompletEditions_R(Self: TAlbumComplet; var T: TEditionsComplet);
begin
  T := Self.Editions;
end;

procedure TAlbumCompletSerie_W(Self: TAlbumComplet; const T: TSerieComplete);
begin
  Self.Serie := T;
end;

procedure TAlbumCompletSerie_R(Self: TAlbumComplet; var T: TSerieComplete);
begin
  T := Self.Serie;
end;

procedure TAlbumCompletNotes_W(Self: TAlbumComplet; const T: TStringList);
begin
  Self.Notes := T;
end;

procedure TAlbumCompletNotes_R(Self: TAlbumComplet; var T: TStringList);
begin
  T := Self.Notes;
end;

procedure TAlbumCompletSujet_W(Self: TAlbumComplet; const T: TStringList);
begin
  Self.Sujet := T;
end;

procedure TAlbumCompletSujet_R(Self: TAlbumComplet; var T: TStringList);
begin
  T := Self.Sujet;
end;

procedure TAlbumCompletColoristes_W(Self: TAlbumComplet; const T: TListOfTAuteur);
begin
  Self.Coloristes := T;
end;

procedure TAlbumCompletColoristes_R(Self: TAlbumComplet; var T: TListOfTAuteur);
begin
  T := Self.Coloristes;
end;

procedure TAlbumCompletDessinateurs_W(Self: TAlbumComplet; const T: TListOfTAuteur);
begin
  Self.Dessinateurs := T;
end;

procedure TAlbumCompletDessinateurs_R(Self: TAlbumComplet; var T: TListOfTAuteur);
begin
  T := Self.Dessinateurs;
end;

procedure TAlbumCompletScenaristes_W(Self: TAlbumComplet; const T: TListOfTAuteur);
begin
  Self.Scenaristes := T;
end;

procedure TAlbumCompletScenaristes_R(Self: TAlbumComplet; var T: TListOfTAuteur);
begin
  T := Self.Scenaristes;
end;

procedure TAlbumCompletIntegrale_W(Self: TAlbumComplet; const T: Boolean);
begin
  Self.Integrale := T;
end;

procedure TAlbumCompletIntegrale_R(Self: TAlbumComplet; var T: Boolean);
begin
  T := Self.Integrale;
end;

procedure TAlbumCompletHorsSerie_W(Self: TAlbumComplet; const T: Boolean);
begin
  Self.HorsSerie := T;
end;

procedure TAlbumCompletHorsSerie_R(Self: TAlbumComplet; var T: Boolean);
begin
  T := Self.HorsSerie;
end;

procedure TAlbumCompletTitre_W(Self: TAlbumComplet; const T: string);
begin
  Self.Titre := T;
end;

procedure TAlbumCompletTitre_R(Self: TAlbumComplet; var T: string);
begin
  T := Self.Titre;
end;

procedure TAlbumCompletTomeFin_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.TomeFin := T;
end;

procedure TAlbumCompletTomeFin_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.TomeFin;
end;

procedure TAlbumCompletTomeDebut_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.TomeDebut := T;
end;

procedure TAlbumCompletTomeDebut_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.TomeDebut;
end;

procedure TAlbumCompletTome_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.Tome := T;
end;

procedure TAlbumCompletTome_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.Tome;
end;

procedure TAlbumCompletAnneeParution_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.AnneeParution := T;
end;

procedure TAlbumCompletAnneeParution_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.AnneeParution;
end;

procedure TAlbumCompletMoisParution_W(Self: TAlbumComplet; const T: Integer);
begin
  Self.MoisParution := T;
end;

procedure TAlbumCompletMoisParution_R(Self: TAlbumComplet; var T: Integer);
begin
  T := Self.MoisParution;
end;

procedure TEditionsCompletEditions_W(Self: TEditionsComplet; const T: TListOfTEditionComplete);
begin
  Self.Editions := T;
end;

procedure TEditionsCompletEditions_R(Self: TEditionsComplet; var T: TListOfTEditionComplete);
begin
  T := Self.Editions;
end;

procedure TListOfTEditionCompleteItems_R(Self: TListOfTEditionComplete; var T: TEditionComplete; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TEditionCompleteCouvertures_W(Self: TEditionComplete; const T: TListOfTCouverture);
begin
  Self.Couvertures := T;
end;

procedure TEditionCompleteCouvertures_R(Self: TEditionComplete; var T: TListOfTCouverture);
begin
  T := Self.Couvertures;
end;

procedure TEditionCompleteEmprunts_W(Self: TEditionComplete; const T: TEmpruntsComplet);
begin
  Self.Emprunts := T;
end;

procedure TEditionCompleteEmprunts_R(Self: TEditionComplete; var T: TEmpruntsComplet);
begin
  T := Self.Emprunts;
end;

procedure TEditionCompleteNotes_W(Self: TEditionComplete; const T: TStringList);
begin
  Self.Notes := T;
end;

procedure TEditionCompleteNotes_R(Self: TEditionComplete; var T: TStringList);
begin
  T := Self.Notes;
end;

procedure TEditionCompleteDateAchat_W(Self: TEditionComplete; const T: TDateTime);
begin
  Self.DateAchat := T;
end;

procedure TEditionCompleteDateAchat_R(Self: TEditionComplete; var T: TDateTime);
begin
  T := Self.DateAchat;
end;

procedure TEditionCompletesOrientation_W(Self: TEditionComplete; const T: string);
begin
  Self.sOrientation := T;
end;

procedure TEditionCompletesOrientation_R(Self: TEditionComplete; var T: string);
begin
  T := Self.sOrientation;
end;

procedure TEditionCompletesFormatEdition_W(Self: TEditionComplete; const T: string);
begin
  Self.sFormatEdition := T;
end;

procedure TEditionCompletesFormatEdition_R(Self: TEditionComplete; var T: string);
begin
  T := Self.sFormatEdition;
end;

procedure TEditionCompletesTypeEdition_W(Self: TEditionComplete; const T: string);
begin
  Self.sTypeEdition := T;
end;

procedure TEditionCompletesTypeEdition_R(Self: TEditionComplete; var T: string);
begin
  T := Self.sTypeEdition;
end;

procedure TEditionCompletesReliure_W(Self: TEditionComplete; const T: string);
begin
  Self.sReliure := T;
end;

procedure TEditionCompletesReliure_R(Self: TEditionComplete; var T: string);
begin
  T := Self.sReliure;
end;

procedure TEditionCompletesSensLecture_W(Self: TEditionComplete; const T: string);
begin
  Self.sSensLecture := T;
end;

procedure TEditionCompletesSensLecture_R(Self: TEditionComplete; var T: string);
begin
  T := Self.sSensLecture;
end;

procedure TEditionCompletesEtat_W(Self: TEditionComplete; const T: string);
begin
  Self.sEtat := T;
end;

procedure TEditionCompletesEtat_R(Self: TEditionComplete; var T: string);
begin
  T := Self.sEtat;
end;

procedure TEditionCompleteISBN_W(Self: TEditionComplete; const T: string);
begin
  Self.ISBN := T;
end;

procedure TEditionCompleteISBN_R(Self: TEditionComplete; var T: string);
begin
  T := Self.ISBN;
end;

procedure TEditionCompleteGratuit_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Gratuit := T;
end;

procedure TEditionCompleteGratuit_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Gratuit;
end;

procedure TEditionCompleteOffert_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Offert := T;
end;

procedure TEditionCompleteOffert_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Offert;
end;

procedure TEditionCompletePrete_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Prete := T;
end;

procedure TEditionCompletePrete_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Prete;
end;

procedure TEditionCompleteStock_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Stock := T;
end;

procedure TEditionCompleteStock_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Stock;
end;

procedure TEditionCompleteDedicace_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Dedicace := T;
end;

procedure TEditionCompleteDedicace_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Dedicace;
end;

procedure TEditionCompleteVO_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.VO := T;
end;

procedure TEditionCompleteVO_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.VO;
end;

procedure TEditionCompleteCouleur_W(Self: TEditionComplete; const T: Boolean);
begin
  Self.Couleur := T;
end;

procedure TEditionCompleteCouleur_R(Self: TEditionComplete; var T: Boolean);
begin
  T := Self.Couleur;
end;

procedure TEditionCompletePrixCote_W(Self: TEditionComplete; const T: Currency);
begin
  Self.PrixCote := T;
end;

procedure TEditionCompletePrixCote_R(Self: TEditionComplete; var T: Currency);
begin
  T := Self.PrixCote;
end;

procedure TEditionCompletePrix_W(Self: TEditionComplete; const T: Currency);
begin
  Self.Prix := T;
end;

procedure TEditionCompletePrix_R(Self: TEditionComplete; var T: Currency);
begin
  T := Self.Prix;
end;

procedure TEditionCompleteAnneeCote_W(Self: TEditionComplete; const T: Integer);
begin
  Self.AnneeCote := T;
end;

procedure TEditionCompleteAnneeCote_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.AnneeCote;
end;

procedure TEditionCompleteOrientation_W(Self: TEditionComplete; const T: Integer);
begin
  Self.Orientation := T;
end;

procedure TEditionCompleteOrientation_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.Orientation;
end;

procedure TEditionCompleteFormatEdition_W(Self: TEditionComplete; const T: Integer);
begin
  Self.FormatEdition := T;
end;

procedure TEditionCompleteFormatEdition_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.FormatEdition;
end;

procedure TEditionCompleteNombreDePages_W(Self: TEditionComplete; const T: Integer);
begin
  Self.NombreDePages := T;
end;

procedure TEditionCompleteNombreDePages_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.NombreDePages;
end;

procedure TEditionCompleteReliure_W(Self: TEditionComplete; const T: Integer);
begin
  Self.Reliure := T;
end;

procedure TEditionCompleteReliure_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.Reliure;
end;

procedure TEditionCompleteSensLecture_W(Self: TEditionComplete; const T: Integer);
begin
  Self.SensLecture := T;
end;

procedure TEditionCompleteSensLecture_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.SensLecture;
end;

procedure TEditionCompleteEtat_W(Self: TEditionComplete; const T: Integer);
begin
  Self.Etat := T;
end;

procedure TEditionCompleteEtat_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.Etat;
end;

procedure TEditionCompleteAnneeEdition_W(Self: TEditionComplete; const T: Integer);
begin
  Self.AnneeEdition := T;
end;

procedure TEditionCompleteAnneeEdition_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.AnneeEdition;
end;

procedure TEditionCompleteTypeEdition_W(Self: TEditionComplete; const T: Integer);
begin
  Self.TypeEdition := T;
end;

procedure TEditionCompleteTypeEdition_R(Self: TEditionComplete; var T: Integer);
begin
  T := Self.TypeEdition;
end;

procedure TEditionCompleteCollection_W(Self: TEditionComplete; const T: TCollection);
begin
  Self.Collection := T;
end;

procedure TEditionCompleteCollection_R(Self: TEditionComplete; var T: TCollection);
begin
  T := Self.Collection;
end;

procedure TEditionCompleteEditeur_W(Self: TEditionComplete; const T: TEditeurComplet);
begin
  Self.Editeur := T;
end;

procedure TEditionCompleteEditeur_R(Self: TEditionComplete; var T: TEditeurComplet);
begin
  T := Self.Editeur;
end;

procedure TEditionCompleteNumPerso_W(Self: TEditionComplete; const T: string);
begin
  Self.NumeroPerso := T
end;

procedure TEditionCompleteNumPerso_R(Self: TEditionComplete; var T: string);
begin
  T := Self.NumeroPerso;
end;

procedure TAuteurCompletSeries_W(Self: TAuteurComplet; const T: TListOfTSerieComplete);
begin
  Self.Series := T;
end;

procedure TAuteurCompletSeries_R(Self: TAuteurComplet; var T: TListOfTSerieComplete);
begin
  T := Self.Series;
end;

procedure TAuteurCompletBiographie_W(Self: TAuteurComplet; const T: TStringList);
begin
  Self.Biographie := T;
end;

procedure TAuteurCompletBiographie_R(Self: TAuteurComplet; var T: TStringList);
begin
  T := Self.Biographie;
end;

procedure TAuteurCompletSiteWeb_W(Self: TAuteurComplet; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TAuteurCompletSiteWeb_R(Self: TAuteurComplet; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TAuteurCompletNomAuteur_W(Self: TAuteurComplet; const T: string);
begin
  Self.NomAuteur := T;
end;

procedure TAuteurCompletNomAuteur_R(Self: TAuteurComplet; var T: string);
begin
  T := Self.NomAuteur;
end;

procedure TListOfTSerieCompleteItems_R(Self: TListOfTSerieComplete; var T: TSerieComplete; const t1: Integer);
begin
  T := Self.Items[t1];
end;

procedure TSerieCompleteColoristes_W(Self: TSerieComplete; const T: TListOfTAuteur);
begin
  Self.Coloristes := T;
end;

procedure TSerieCompleteColoristes_R(Self: TSerieComplete; var T: TListOfTAuteur);
begin
  T := Self.Coloristes;
end;

procedure TSerieCompleteDessinateurs_W(Self: TSerieComplete; const T: TListOfTAuteur);
begin
  Self.Dessinateurs := T;
end;

procedure TSerieCompleteDessinateurs_R(Self: TSerieComplete; var T: TListOfTAuteur);
begin
  T := Self.Dessinateurs;
end;

procedure TSerieCompleteScenaristes_W(Self: TSerieComplete; const T: TListOfTAuteur);
begin
  Self.Scenaristes := T;
end;

procedure TSerieCompleteScenaristes_R(Self: TSerieComplete; var T: TListOfTAuteur);
begin
  T := Self.Scenaristes;
end;

procedure TSerieCompleteSiteWeb_W(Self: TSerieComplete; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TSerieCompleteSiteWeb_R(Self: TSerieComplete; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TSerieCompleteCollection_W(Self: TSerieComplete; const T: TCollection);
begin
  Self.Collection := T;
end;

procedure TSerieCompleteCollection_R(Self: TSerieComplete; var T: TCollection);
begin
  T := Self.Collection;
end;

procedure TSerieCompleteEditeur_W(Self: TSerieComplete; const T: TEditeurComplet);
begin
  Self.Editeur := T;
end;

procedure TSerieCompleteEditeur_R(Self: TSerieComplete; var T: TEditeurComplet);
begin
  T := Self.Editeur;
end;

procedure TSerieCompleteNotes_W(Self: TSerieComplete; const T: TStringList);
begin
  Self.Notes := T;
end;

procedure TSerieCompleteNotes_R(Self: TSerieComplete; var T: TStringList);
begin
  T := Self.Notes;
end;

procedure TSerieCompleteSujet_W(Self: TSerieComplete; const T: TStringList);
begin
  Self.Sujet := T;
end;

procedure TSerieCompleteSujet_R(Self: TSerieComplete; var T: TStringList);
begin
  T := Self.Sujet;
end;

procedure TSerieCompleteGenres_W(Self: TSerieComplete; const T: TStringList);
begin
  Self.Genres := T;
end;

procedure TSerieCompleteGenres_R(Self: TSerieComplete; var T: TStringList);
begin
  T := Self.Genres;
end;

procedure TSerieCompleteParaBD_W(Self: TSerieComplete; const T: TListOfTParaBD);
begin
  Self.ParaBD := T;
end;

procedure TSerieCompleteParaBD_R(Self: TSerieComplete; var T: TListOfTParaBD);
begin
  T := Self.ParaBD;
end;

procedure TSerieCompleteAlbums_W(Self: TSerieComplete; const T: TListOfTAlbum);
begin
  Self.Albums := T;
end;

procedure TSerieCompleteAlbums_R(Self: TSerieComplete; var T: TListOfTAlbum);
begin
  T := Self.Albums;
end;

procedure TSerieCompleteNbAlbums_W(Self: TSerieComplete; const T: Integer);
begin
  Self.NbAlbums := T;
end;

procedure TSerieCompleteNbAlbums_R(Self: TSerieComplete; var T: Integer);
begin
  T := Self.NbAlbums;
end;

procedure TSerieCompleteSuivreSorties_W(Self: TSerieComplete; const T: Boolean);
begin
  Self.SuivreSorties := T;
end;

procedure TSerieCompleteSuivreSorties_R(Self: TSerieComplete; var T: Boolean);
begin
  T := Self.SuivreSorties;
end;

procedure TSerieCompleteSuivreManquants_W(Self: TSerieComplete; const T: Boolean);
begin
  Self.SuivreManquants := T;
end;

procedure TSerieCompleteSuivreManquants_R(Self: TSerieComplete; var T: Boolean);
begin
  T := Self.SuivreManquants;
end;

procedure TSerieCompleteComplete_W(Self: TSerieComplete; const T: Boolean);
begin
  Self.Complete := T;
end;

procedure TSerieCompleteComplete_R(Self: TSerieComplete; var T: Boolean);
begin
  T := Self.Complete;
end;

procedure TSerieCompleteTerminee_W(Self: TSerieComplete; const T: Integer);
begin
  Self.Terminee := T;
end;

procedure TSerieCompleteTerminee_R(Self: TSerieComplete; var T: Integer);
begin
  T := Self.Terminee;
end;

procedure TSerieCompleteTitre_W(Self: TSerieComplete; const T: string);
begin
  Self.Titre := T;
end;

procedure TSerieCompleteTitre_R(Self: TSerieComplete; var T: string);
begin
  T := Self.Titre;
end;

procedure TCollectionCompleteEditeur_W(Self: TCollectionComplete; const T: TEditeur);
begin
  Self.Editeur := T;
end;

procedure TCollectionCompleteEditeur_R(Self: TCollectionComplete; var T: TEditeur);
begin
  T := Self.Editeur;
end;

procedure TCollectionCompleteNomCollection_W(Self: TCollectionComplete; const T: string);
begin
  Self.NomCollection := T;
end;

procedure TCollectionCompleteNomCollection_R(Self: TCollectionComplete; var T: string);
begin
  T := Self.NomCollection;
end;

procedure TEditeurCompletSiteWeb_W(Self: TEditeurComplet; const T: string);
begin
  Self.SiteWeb := T;
end;

procedure TEditeurCompletSiteWeb_R(Self: TEditeurComplet; var T: string);
begin
  T := Self.SiteWeb;
end;

procedure TEditeurCompletNomEditeur_W(Self: TEditeurComplet; const T: string);
begin
  Self.NomEditeur := T;
end;

procedure TEditeurCompletNomEditeur_R(Self: TEditeurComplet; var T: string);
begin
  T := Self.NomEditeur;
end;

procedure RIRegister_TAlbumComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TAlbumComplet) do
  begin
    RegisterPropertyHelper(@TAlbumCompletMoisParution_R, @TAlbumCompletMoisParution_W, 'MoisParution');
    RegisterPropertyHelper(@TAlbumCompletAnneeParution_R, @TAlbumCompletAnneeParution_W, 'AnneeParution');
    RegisterPropertyHelper(@TAlbumCompletTome_R, @TAlbumCompletTome_W, 'Tome');
    RegisterPropertyHelper(@TAlbumCompletTomeDebut_R, @TAlbumCompletTomeDebut_W, 'TomeDebut');
    RegisterPropertyHelper(@TAlbumCompletTomeFin_R, @TAlbumCompletTomeFin_W, 'TomeFin');
    RegisterPropertyHelper(@TAlbumCompletTitre_R, @TAlbumCompletTitre_W, 'Titre');
    RegisterPropertyHelper(@TAlbumCompletHorsSerie_R, @TAlbumCompletHorsSerie_W, 'HorsSerie');
    RegisterPropertyHelper(@TAlbumCompletIntegrale_R, @TAlbumCompletIntegrale_W, 'Integrale');
    RegisterPropertyHelper(@TAlbumCompletScenaristes_R, @TAlbumCompletScenaristes_W, 'Scenaristes');
    RegisterPropertyHelper(@TAlbumCompletDessinateurs_R, @TAlbumCompletDessinateurs_W, 'Dessinateurs');
    RegisterPropertyHelper(@TAlbumCompletColoristes_R, @TAlbumCompletColoristes_W, 'Coloristes');
    RegisterPropertyHelper(@TAlbumCompletSujet_R, @TAlbumCompletSujet_W, 'Sujet');
    RegisterPropertyHelper(@TAlbumCompletNotes_R, @TAlbumCompletNotes_W, 'Notes');
    RegisterPropertyHelper(@TAlbumCompletSerie_R, @TAlbumCompletSerie_W, 'Serie');
    RegisterPropertyHelper(@TAlbumCompletEditions_R, @TAlbumCompletEditions_W, 'Editions');
  end;
end;

procedure RIRegister_TEditionsComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditionsComplet) do
  begin
    RegisterPropertyHelper(@TEditionsCompletEditions_R, @TEditionsCompletEditions_W, 'Editions');
  end;
end;

procedure RIRegister_TListOfTEditionComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TListOfTEditionComplete) do
  begin
    RegisterMethod(@TListOfTEditionComplete.Add, 'Add');
    RegisterMethod(@TListOfTEditionComplete.Insert, 'Insert');
    RegisterPropertyHelper(@TListOfTEditionCompleteItems_R, nil, 'Items');
  end;
end;

procedure RIRegister_TEditionComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditionComplete) do
  begin
    RegisterPropertyHelper(@TEditionCompleteEditeur_R, @TEditionCompleteEditeur_W, 'Editeur');
    RegisterPropertyHelper(@TEditionCompleteCollection_R, @TEditionCompleteCollection_W, 'Collection');
    RegisterPropertyHelper(@TEditionCompleteTypeEdition_R, @TEditionCompleteTypeEdition_W, 'TypeEdition');
    RegisterPropertyHelper(@TEditionCompleteAnneeEdition_R, @TEditionCompleteAnneeEdition_W, 'AnneeEdition');
    RegisterPropertyHelper(@TEditionCompleteEtat_R, @TEditionCompleteEtat_W, 'Etat');
    RegisterPropertyHelper(@TEditionCompleteReliure_R, @TEditionCompleteReliure_W, 'Reliure');
    RegisterPropertyHelper(@TEditionCompleteSensLecture_R, @TEditionCompleteSensLecture_W, 'SensLecture');
    RegisterPropertyHelper(@TEditionCompleteNombreDePages_R, @TEditionCompleteNombreDePages_W, 'NombreDePages');
    RegisterPropertyHelper(@TEditionCompleteFormatEdition_R, @TEditionCompleteFormatEdition_W, 'FormatEdition');
    RegisterPropertyHelper(@TEditionCompleteOrientation_R, @TEditionCompleteOrientation_W, 'Orientation');
    RegisterPropertyHelper(@TEditionCompleteAnneeCote_R, @TEditionCompleteAnneeCote_W, 'AnneeCote');
    RegisterPropertyHelper(@TEditionCompletePrix_R, @TEditionCompletePrix_W, 'Prix');
    RegisterPropertyHelper(@TEditionCompletePrixCote_R, @TEditionCompletePrixCote_W, 'PrixCote');
    RegisterPropertyHelper(@TEditionCompleteCouleur_R, @TEditionCompleteCouleur_W, 'Couleur');
    RegisterPropertyHelper(@TEditionCompleteVO_R, @TEditionCompleteVO_W, 'VO');
    RegisterPropertyHelper(@TEditionCompleteDedicace_R, @TEditionCompleteDedicace_W, 'Dedicace');
    RegisterPropertyHelper(@TEditionCompleteStock_R, @TEditionCompleteStock_W, 'Stock');
    RegisterPropertyHelper(@TEditionCompletePrete_R, @TEditionCompletePrete_W, 'Prete');
    RegisterPropertyHelper(@TEditionCompleteOffert_R, @TEditionCompleteOffert_W, 'Offert');
    RegisterPropertyHelper(@TEditionCompleteGratuit_R, @TEditionCompleteGratuit_W, 'Gratuit');
    RegisterPropertyHelper(@TEditionCompleteISBN_R, @TEditionCompleteISBN_W, 'ISBN');
    RegisterPropertyHelper(@TEditionCompletesEtat_R, @TEditionCompletesEtat_W, 'sEtat');
    RegisterPropertyHelper(@TEditionCompletesReliure_R, @TEditionCompletesReliure_W, 'sReliure');
    RegisterPropertyHelper(@TEditionCompletesSensLecture_R, @TEditionCompletesSensLecture_W, 'sSensLecture');
    RegisterPropertyHelper(@TEditionCompletesTypeEdition_R, @TEditionCompletesTypeEdition_W, 'sTypeEdition');
    RegisterPropertyHelper(@TEditionCompletesFormatEdition_R, @TEditionCompletesFormatEdition_W, 'sFormatEdition');
    RegisterPropertyHelper(@TEditionCompletesOrientation_R, @TEditionCompletesOrientation_W, 'sOrientation');
    RegisterPropertyHelper(@TEditionCompleteDateAchat_R, @TEditionCompleteDateAchat_W, 'DateAchat');
    RegisterPropertyHelper(@TEditionCompleteNotes_R, @TEditionCompleteNotes_W, 'Notes');
    RegisterPropertyHelper(@TEditionCompleteEmprunts_R, @TEditionCompleteEmprunts_W, 'Emprunts');
    RegisterPropertyHelper(@TEditionCompleteCouvertures_R, @TEditionCompleteCouvertures_W, 'Couvertures');
    RegisterPropertyHelper(@TEditionCompleteNumPerso_R, @TEditionCompleteNumPerso_W, 'NumeroPerso');
  end;
end;

procedure RIRegister_TAuteurComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TAuteurComplet) do
  begin
    RegisterPropertyHelper(@TAuteurCompletNomAuteur_R, @TAuteurCompletNomAuteur_W, 'NomAuteur');
    RegisterPropertyHelper(@TAuteurCompletSiteWeb_R, @TAuteurCompletSiteWeb_W, 'SiteWeb');
    RegisterPropertyHelper(@TAuteurCompletBiographie_R, @TAuteurCompletBiographie_W, 'Biographie');
    RegisterPropertyHelper(@TAuteurCompletSeries_R, @TAuteurCompletSeries_W, 'Series');
  end;
end;

procedure RIRegister_TListOfTSerieComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TListOfTSerieComplete) do
  begin
    RegisterMethod(@TListOfTSerieComplete.Add, 'Add');
    RegisterMethod(@TListOfTSerieComplete.Insert, 'Insert');
    RegisterPropertyHelper(@TListOfTSerieCompleteItems_R, nil, 'Items');
  end;
end;

procedure RIRegister_TSerieComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TSerieComplete) do
  begin
    RegisterPropertyHelper(@TSerieCompleteTitre_R, @TSerieCompleteTitre_W, 'Titre');
    RegisterPropertyHelper(@TSerieCompleteTerminee_R, @TSerieCompleteTerminee_W, 'Terminee');
    RegisterPropertyHelper(@TSerieCompleteComplete_R, @TSerieCompleteComplete_W, 'Complete');
    RegisterPropertyHelper(@TSerieCompleteSuivreManquants_R, @TSerieCompleteSuivreManquants_W, 'SuivreManquants');
    RegisterPropertyHelper(@TSerieCompleteSuivreSorties_R, @TSerieCompleteSuivreSorties_W, 'SuivreSorties');
    RegisterPropertyHelper(@TSerieCompleteNbAlbums_R, @TSerieCompleteNbAlbums_W, 'NbAlbums');
    RegisterPropertyHelper(@TSerieCompleteAlbums_R, @TSerieCompleteAlbums_W, 'Albums');
    RegisterPropertyHelper(@TSerieCompleteParaBD_R, @TSerieCompleteParaBD_W, 'ParaBD');
    RegisterPropertyHelper(@TSerieCompleteGenres_R, @TSerieCompleteGenres_W, 'Genres');
    RegisterPropertyHelper(@TSerieCompleteSujet_R, @TSerieCompleteSujet_W, 'Sujet');
    RegisterPropertyHelper(@TSerieCompleteNotes_R, @TSerieCompleteNotes_W, 'Notes');
    RegisterPropertyHelper(@TSerieCompleteEditeur_R, @TSerieCompleteEditeur_W, 'Editeur');
    RegisterPropertyHelper(@TSerieCompleteCollection_R, @TSerieCompleteCollection_W, 'Collection');
    RegisterPropertyHelper(@TSerieCompleteSiteWeb_R, @TSerieCompleteSiteWeb_W, 'SiteWeb');
    RegisterPropertyHelper(@TSerieCompleteScenaristes_R, @TSerieCompleteScenaristes_W, 'Scenaristes');
    RegisterPropertyHelper(@TSerieCompleteDessinateurs_R, @TSerieCompleteDessinateurs_W, 'Dessinateurs');
    RegisterPropertyHelper(@TSerieCompleteColoristes_R, @TSerieCompleteColoristes_W, 'Coloristes');
  end;
end;

procedure RIRegister_TCollectionComplete(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TCollectionComplete) do
  begin
    RegisterPropertyHelper(@TCollectionCompleteNomCollection_R, @TCollectionCompleteNomCollection_W, 'NomCollection');
    RegisterPropertyHelper(@TCollectionCompleteEditeur_R, @TCollectionCompleteEditeur_W, 'Editeur');
  end;
end;

procedure RIRegister_TEditeurComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEditeurComplet) do
  begin
    RegisterPropertyHelper(@TEditeurCompletNomEditeur_R, @TEditeurCompletNomEditeur_W, 'NomEditeur');
    RegisterPropertyHelper(@TEditeurCompletSiteWeb_R, @TEditeurCompletSiteWeb_W, 'SiteWeb');
  end;
end;

procedure RIRegister_TListComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TListComplet) do
  begin
  end;
end;

procedure RIRegister_TInfoComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TInfoComplet) do
  begin
  end;
end;

procedure RIRegister_TObjetComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TObjetComplet) do
  begin
  end;
end;

procedure RIRegister_TBaseComplet(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TBaseComplet) do
  begin
  end;
end;

procedure RIRegister_LoadComplet(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TBaseComplet(CL);
  RIRegister_TObjetComplet(CL);
  RIRegister_TInfoComplet(CL);
  RIRegister_TListComplet(CL);
  RIRegister_TEditeurComplet(CL);
  RIRegister_TCollectionComplete(CL);
  RIRegister_TSerieComplete(CL);
  RIRegister_TListOfTSerieComplete(CL);
  RIRegister_TAuteurComplet(CL);
  RIRegister_TEditionComplete(CL);
  RIRegister_TListOfTEditionComplete(CL);
  RIRegister_TEditionsComplet(CL);
  RIRegister_TAlbumComplet(CL);
end;

end.

