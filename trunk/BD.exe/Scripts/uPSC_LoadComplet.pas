unit uPSC_LoadComplet;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface

uses
  SysUtils, Classes, uPSCompiler;

{ compile-time registration functions }
procedure SIRegister_TAlbumComplet(CL: TPSPascalCompiler);
procedure SIRegister_TEditionsComplet(CL: TPSPascalCompiler);
procedure SIRegister_TListOfTEditionComplete(CL: TPSPascalCompiler);
procedure SIRegister_TEditionComplete(CL: TPSPascalCompiler);
procedure SIRegister_TAuteurComplet(CL: TPSPascalCompiler);
procedure SIRegister_TListOfTSerieComplete(CL: TPSPascalCompiler);
procedure SIRegister_TSerieComplete(CL: TPSPascalCompiler);
procedure SIRegister_TCollectionComplete(CL: TPSPascalCompiler);
procedure SIRegister_TEditeurComplet(CL: TPSPascalCompiler);
procedure SIRegister_TListComplet(CL: TPSPascalCompiler);
procedure SIRegister_TInfoComplet(CL: TPSPascalCompiler);
procedure SIRegister_TObjetComplet(CL: TPSPascalCompiler);
procedure SIRegister_TBaseComplet(CL: TPSPascalCompiler);

procedure SIRegister_LoadComplet(CL: TPSPascalCompiler);

implementation

uses
  Windows, Dialogs, TypeRec, Commun, CommonConst, DM_Princ, DateUtils, ListOfTypeRec, Contnrs, LoadComplet;

(* === compile-time registration functions === *)

procedure SIRegister_TAlbumComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjetComplet', 'TAlbumComplet') do
  with CL.AddClassN(CL.FindClass('TObjetComplet'), 'TAlbumComplet') do
  begin
    RegisterProperty('MoisParution', 'Integer', iptrw);
    RegisterProperty('AnneeParution', 'Integer', iptrw);
    RegisterProperty('Tome', 'Integer', iptrw);
    RegisterProperty('TomeDebut', 'Integer', iptrw);
    RegisterProperty('TomeFin', 'Integer', iptrw);
    RegisterProperty('Titre', 'string', iptrw);
    RegisterProperty('HorsSerie', 'Boolean', iptrw);
    RegisterProperty('Integrale', 'Boolean', iptrw);
    RegisterProperty('Scenaristes', 'TListOfTAuteur', iptrw);
    RegisterProperty('Dessinateurs', 'TListOfTAuteur', iptrw);
    RegisterProperty('Coloristes', 'TListOfTAuteur', iptrw);
    RegisterProperty('Sujet', 'TStringList', iptrw);
    RegisterProperty('Notes', 'TStringList', iptrw);
    RegisterProperty('Serie', 'TSerieComplete', iptrw);
    RegisterProperty('Editions', 'TEditionsComplet', iptrw);
  end;
end;

procedure SIRegister_TEditionsComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TListComplet', 'TEditionsComplet') do
  with CL.AddClassN(CL.FindClass('TListComplet'), 'TEditionsComplet') do
  begin
    RegisterProperty('Editions', 'TListOfTEditionComplete', iptrw);
  end;
end;

procedure SIRegister_TListOfTEditionComplete(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjectList', 'TListOfTEditionComplete') do
  with CL.AddClassN(CL.FindClass('TObjectList'), 'TListOfTEditionComplete') do
  begin
    RegisterMethod('Function Add( AObject : TEditionComplete) : Integer');
    RegisterMethod('Procedure Insert( Index : Integer; AObject : TEditionComplete)');
    RegisterProperty('Items', 'TEditionComplete Integer', iptr);
    SetDefaultPropery('Items');
  end;
end;

procedure SIRegister_TEditionComplete(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjetComplet', 'TEditionComplete') do
  with CL.AddClassN(CL.FindClass('TObjetComplet'), 'TEditionComplete') do
  begin
    RegisterProperty('Editeur', 'TEditeurComplet', iptrw);
    RegisterProperty('Collection', 'TCollection', iptrw);
    RegisterProperty('TypeEdition', 'Integer', iptrw);
    RegisterProperty('AnneeEdition', 'Integer', iptrw);
    RegisterProperty('Etat', 'Integer', iptrw);
    RegisterProperty('Reliure', 'Integer', iptrw);
    RegisterProperty('NombreDePages', 'Integer', iptrw);
    RegisterProperty('FormatEdition', 'Integer', iptrw);
    RegisterProperty('Orientation', 'Integer', iptrw);
    RegisterProperty('AnneeCote', 'Integer', iptrw);
    RegisterProperty('Prix', 'Currency', iptrw);
    RegisterProperty('PrixCote', 'Currency', iptrw);
    RegisterProperty('Couleur', 'Boolean', iptrw);
    RegisterProperty('VO', 'Boolean', iptrw);
    RegisterProperty('Dedicace', 'Boolean', iptrw);
    RegisterProperty('Stock', 'Boolean', iptrw);
    RegisterProperty('Prete', 'Boolean', iptrw);
    RegisterProperty('Offert', 'Boolean', iptrw);
    RegisterProperty('Gratuit', 'Boolean', iptrw);
    RegisterProperty('ISBN', 'string', iptrw);
    RegisterProperty('sEtat', 'string', iptrw);
    RegisterProperty('sReliure', 'string', iptrw);
    RegisterProperty('sTypeEdition', 'string', iptrw);
    RegisterProperty('sFormatEdition', 'string', iptrw);
    RegisterProperty('sOrientation', 'string', iptrw);
    RegisterProperty('DateAchat', 'TDateTime', iptrw);
    RegisterProperty('Notes', 'TStringList', iptrw);
    RegisterProperty('Emprunts', 'TEmpruntsComplet', iptrw);
    RegisterProperty('Couvertures', 'TListOfTCouverture', iptrw);
    RegisterProperty('NumeroPerso', 'string', iptrw);
    RegisterProperty('SensLecture', 'Integer', iptrw);
    RegisterProperty('sSensLecture', 'string', iptrw);
  end;
end;

procedure SIRegister_TAuteurComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjetComplet', 'TAuteurComplet') do
  with CL.AddClassN(CL.FindClass('TObjetComplet'), 'TAuteurComplet') do
  begin
    RegisterProperty('NomAuteur', 'string', iptrw);
    RegisterProperty('SiteWeb', 'string', iptrw);
    RegisterProperty('Biographie', 'TStringList', iptrw);
    RegisterProperty('Series', 'TListOfTSerieComplete', iptrw);
  end;
end;

procedure SIRegister_TListOfTSerieComplete(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjectList', 'TListOfTSerieComplete') do
  with CL.AddClassN(CL.FindClass('TObjectList'), 'TListOfTSerieComplete') do
  begin
    RegisterMethod('Function Add( AObject : TSerieComplete) : Integer');
    RegisterMethod('Procedure Insert( Index : Integer; AObject : TSerieComplete)');
    RegisterProperty('Items', 'TSerieComplete Integer', iptr);
    SetDefaultPropery('Items');
  end;
end;

procedure SIRegister_TSerieComplete(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjetComplet', 'TSerieComplete') do
  with CL.AddClassN(CL.FindClass('TObjetComplet'), 'TSerieComplete') do
  begin
    RegisterProperty('Titre', 'string', iptrw);
    RegisterProperty('Terminee', 'Integer', iptrw);
    RegisterProperty('Complete', 'Boolean', iptrw);
    RegisterProperty('SuivreManquants', 'Boolean', iptrw);
    RegisterProperty('SuivreSorties', 'Boolean', iptrw);
    RegisterProperty('NbAlbums', 'Integer', iptrw);
    RegisterProperty('Albums', 'TListOfTAlbum', iptrw);
    RegisterProperty('ParaBD', 'TListOfTParaBD', iptrw);
    RegisterProperty('Genres', 'TStringList', iptrw);
    RegisterProperty('Sujet', 'TStringList', iptrw);
    RegisterProperty('Notes', 'TStringList', iptrw);
    RegisterProperty('Editeur', 'TEditeurComplet', iptrw);
    RegisterProperty('Collection', 'TCollection', iptrw);
    RegisterProperty('SiteWeb', 'string', iptrw);
    RegisterProperty('Scenaristes', 'TListOfTAuteur', iptrw);
    RegisterProperty('Dessinateurs', 'TListOfTAuteur', iptrw);
    RegisterProperty('Coloristes', 'TListOfTAuteur', iptrw);
    RegisterProperty('TypeEdition', 'Integer', iptrw);
    RegisterProperty('Etat', 'Integer', iptrw);
    RegisterProperty('Reliure', 'Integer', iptrw);
    RegisterProperty('FormatEdition', 'Integer', iptrw);
    RegisterProperty('Orientation', 'Integer', iptrw);
    RegisterProperty('sEtat', 'string', iptrw);
    RegisterProperty('sReliure', 'string', iptrw);
    RegisterProperty('sTypeEdition', 'string', iptrw);
    RegisterProperty('sFormatEdition', 'string', iptrw);
    RegisterProperty('sOrientation', 'string', iptrw);
    RegisterProperty('SensLecture', 'Integer', iptrw);
    RegisterProperty('sSensLecture', 'string', iptrw);
    RegisterProperty('VO', 'Integer', iptrw);
    RegisterProperty('Couleur', 'Integer', iptrw);
  end;
end;

procedure SIRegister_TCollectionComplete(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjetComplet', 'TCollectionComplete') do
  with CL.AddClassN(CL.FindClass('TObjetComplet'), 'TCollectionComplete') do
  begin
    RegisterProperty('NomCollection', 'string', iptrw);
    RegisterProperty('Editeur', 'TEditeur', iptrw);
  end;
end;

procedure SIRegister_TEditeurComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObjetComplet', 'TEditeurComplet') do
  with CL.AddClassN(CL.FindClass('TObjetComplet'), 'TEditeurComplet') do
  begin
    RegisterProperty('NomEditeur', 'string', iptrw);
    RegisterProperty('SiteWeb', 'string', iptrw);
  end;
end;

procedure SIRegister_TListComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TBaseComplet', 'TListComplet') do
  with CL.AddClassN(CL.FindClass('TBaseComplet'), 'TListComplet') do
  begin
  end;
end;

procedure SIRegister_TInfoComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TBaseComplet', 'TInfoComplet') do
  with CL.AddClassN(CL.FindClass('TBaseComplet'), 'TInfoComplet') do
  begin
  end;
end;

procedure SIRegister_TObjetComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TBaseComplet', 'TObjetComplet') do
  with CL.AddClassN(CL.FindClass('TBaseComplet'), 'TObjetComplet') do
  begin
  end;
end;

procedure SIRegister_TBaseComplet(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TBaseComplet') do
  with CL.AddClassN(CL.FindClass('TObject'), 'TBaseComplet') do
  begin
  end;
end;

procedure SIRegister_LoadComplet(CL: TPSPascalCompiler);
begin
  SIRegister_TBaseComplet(CL);
  SIRegister_TObjetComplet(CL);
  SIRegister_TInfoComplet(CL);
  SIRegister_TListComplet(CL);
  SIRegister_TEditeurComplet(CL);
  SIRegister_TCollectionComplete(CL);
  SIRegister_TSerieComplete(CL);
  SIRegister_TListOfTSerieComplete(CL);
  SIRegister_TAuteurComplet(CL);
  SIRegister_TEditionComplete(CL);
  SIRegister_TListOfTEditionComplete(CL);
  SIRegister_TEditionsComplet(CL);
  SIRegister_TAlbumComplet(CL);
end;

end.

