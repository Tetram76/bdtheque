unit Form_Gestion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DBCtrls, ComCtrls, Db, Menus,
  ExtCtrls, Buttons, Proc_Gestions, VDTButton, VirtualTrees, VirtualTree;

type
  TInfo_Gestion = record
    Mode: TVirtualMode;
    ListeHint, AjoutHint, ModifHint, SuppHint: string;
    ProcAjouter: TActionGestionAdd;
    ProcModifier: TActionGestionModif;
    ProcSupprimer: TActionGestionSupp;
    ProcAcheter: TActionGestionAchat;
    Filtre: string;
  end;

  TFrmGestions = class(TForm)
    Panel3: TPanel;
    VDTButton2: TVDTButton;
    Bevel4: TBevel;
    ajouter: TVDTButton;
    modifier: TVDTButton;
    supprimer: TVDTButton;
    Panel14: TPanel;
    btAlbums: TVDTButton;
    btEditeurs: TVDTButton;
    btAuteurs: TVDTButton;
    btGenre: TVDTButton;
    btCollections: TVDTButton;
    btSeries: TVDTButton;
    btEmprunteurs: TVDTButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    VirtualTreeView: TVirtualStringTree;
    ScanEdit: TEdit;
    VDTButton1: TVDTButton;
    Bevel2: TBevel;
    Bevel5: TBevel;
    btAchatsAlbums: TVDTButton;
    Bevel6: TBevel;
    Bevel7: TBevel;
    acheter: TVDTButton;
    Bevel8: TBevel;
    btParaBD: TVDTButton;
    btAchatsParaBD: TVDTButton;
    procedure FormCreate(Sender: TObject);
    function GestionCourante(SB: TSpeedButton = nil): TInfo_Gestion;
    procedure ajouterClick(Sender: TObject);
    procedure modifierClick(Sender: TObject);
    procedure supprimerClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure VDTButton2Click(Sender: TObject);
    procedure VDTButton1Click(Sender: TObject);
    procedure ScanEditKeyPress(Sender: TObject; var Key: Char);
    procedure acheterClick(Sender: TObject);
  protected
  private
    { D�clarations priv�es }
    GestionAchatAlbum, GestionAlbum, GestionAuteur, GestionGenre, GestionCollection,
      GestionEmprunteur, GestionEditeur, GestionSerie, GestionParaBD, GestionAchatParaBD: TInfo_Gestion;
    LastButton: TSpeedButton;
    procedure AssignIG(var IG: TInfo_Gestion; Ajouter: TActionGestionAdd; Modifier: TActionGestionModif; Supprimer: TActionGestionSupp; const Liste_Hint, Ajout_Hint, Modif_Hint, Supp_Hint: string; Mode: TVirtualMode; Filtre: string = ''; Acheter: TActionGestionAchat = nil);
  public
    { D�clarations publiques }
    SelString: string;
  end;

var
  FrmGestions: TFrmGestions;

implementation

uses Commun, CommonConst, Procedures;

const
  HintListeAlbums = 'Liste des albums';
  HintAjoutAlbum = 'Ajouter un album';
  HintModifAlbum = 'Modifier l''album s�lectionn�';
  HintSuppAlbum = 'Supprimer l''album s�lectionn�';
  HintListeAuteurs = 'Liste des auteurs';
  HintAjoutAuteur = 'Ajouter un auteur';
  HintModifAuteur = 'Modifier l''auteur s�lectionn�';
  HintSuppAuteur = 'Supprimer l''auteur s�lectionn�';
  HintListeEmprunteurs = 'Liste des emprunteurs';
  HintAjoutEmprunteur = 'Ajouter un emprunteur';
  HintModifEmprunteur = 'Modifier l''emprunteur s�lectionn�';
  HintSuppEmprunteur = 'Supprimer l''emprunteur s�lectionn�';
  HintListeSeries = 'Liste des s�ries';
  HintAjoutSerie = 'Ajouter une s�rie';
  HintModifSerie = 'Modifier la s�rie s�lectionn�e';
  HintSuppSerie = 'Supprimer la s�rie s�lectionn�e';
  HintListeGenres = 'Liste des genres';
  HintAjoutGenre = 'Ajouter un genre';
  HintModifGenre = 'Modifier le genre s�lectionn�';
  HintSuppGenre = 'Supprimer le genre s�lectionn�';
  HintListeEditeurs = 'Liste des �diteurs';
  HintAjoutEditeur = 'Ajouter un �diteur';
  HintModifEditeur = 'Modifier l''�diteur s�lectionn�';
  HintSuppEditeur = 'Supprimer l''�diteur s�lectionn�';
  HintListeCollections = 'Liste des collections';
  HintAjoutCollection = 'Ajouter une collection';
  HintModifCollection = 'Modifier la collection s�lectionn�e';
  HintSuppCollection = 'Supprimer la collection s�lectionn�e';
  HintListeParaBD = 'Liste des objets para-BD';
  HintAjoutParaBD = 'Ajouter un objet para-BD';
  HintModifParaBD = 'Modifier l''objet s�lectionn�';
  HintSuppParaBD = 'Supprimer l''objet s�lectionn�';

  NoSuppression = 'Impossible de supprimer un �l�ment pendant l''�dition d''un autre';

const
  First: Boolean = True;

{$R *.DFM}

procedure TFrmGestions.AssignIG(var IG: TInfo_Gestion; Ajouter: TActionGestionAdd; Modifier: TActionGestionModif; Supprimer: TActionGestionSupp; const Liste_Hint, Ajout_Hint, Modif_Hint, Supp_Hint: string; Mode: TVirtualMode; Filtre: string = ''; Acheter: TActionGestionAchat = nil);
begin
  IG.ProcAjouter := Ajouter;
  IG.ProcModifier := Modifier;
  IG.ProcSupprimer := Supprimer;
  IG.ListeHint := Liste_Hint;
  IG.AjoutHint := Ajout_Hint;
  IG.ModifHint := Modif_Hint;
  IG.SuppHint := Supp_Hint;
  IG.Mode := Mode;
  IG.Filtre := Filtre;
  IG.ProcAcheter := Acheter;
end;

function TFrmGestions.GestionCourante(SB: TSpeedButton = nil): TInfo_Gestion;

  function test(var ig: TInfo_Gestion; Bouton1, Bouton2: TSpeedButton; Retour: TInfo_Gestion): Boolean;
  begin
    Result := False;
    if (Bouton1 = Bouton2) or Bouton1.Down then begin
      ig := Retour;
      Result := True;
    end;
  end;

begin
  if test(Result, btAchatsAlbums, SB, GestionAchatAlbum) then Exit;
  if test(Result, btAlbums, SB, GestionAlbum) then Exit;
  if test(Result, btSeries, SB, GestionSerie) then Exit;
  if test(Result, btAuteurs, SB, GestionAuteur) then Exit;
  if test(Result, btEmprunteurs, SB, GestionEmprunteur) then Exit;
  if test(Result, btEditeurs, SB, GestionEditeur) then Exit;
  if test(Result, btCollections, SB, GestionCollection) then Exit;
  if test(Result, btGenre, SB, GestionGenre) then Exit;
  if test(Result, btParaBD, SB, GestionParaBD) then Exit;
  if test(Result, btAchatsParaBD, SB, GestionAchatParaBD) then Exit;
  Result := GestionAlbum;
end;

procedure TFrmGestions.FormCreate(Sender: TObject);
begin
  Mode_en_cours := mdEdit;

  AssignIG(GestionAlbum, AjouterAlbums, ModifierAlbums, SupprimerAlbums,
    HintListeAlbums, HintAjoutAlbum, HintModifAlbum, HintSuppAlbum,
    vmAlbumsSerie);
  AssignIG(GestionAchatAlbum, AjouterAchatsAlbum, ModifierAchatsAlbum, SupprimerAchatsAlbum,
    HintListeAlbums, HintAjoutAlbum, HintModifAlbum, HintSuppAlbum,
    vmAlbumsSerie, 'Achat = 1', AcheterAlbums);
  AssignIG(GestionAuteur, AjouterAuteurs2, ModifierAuteurs, SupprimerAuteurs,
    HintListeAuteurs, HintAjoutAuteur, HintModifAuteur, HintSuppAuteur,
    vmPersonnes);
  AssignIG(GestionGenre, AjouterGenres, ModifierGenres, SupprimerGenres,
    HintListeGenres, HintAjoutGenre, HintModifGenre, HintSuppGenre,
    vmGenres);
  AssignIG(GestionEmprunteur, AjouterEmprunteurs, ModifierEmprunteurs, SupprimerEmprunteurs,
    HintListeEmprunteurs, HintAjoutEmprunteur, HintModifEmprunteur, HintSuppEmprunteur,
    vmEmprunteurs);
  AssignIG(GestionSerie, AjouterSeries, ModifierSeries, SupprimerSeries,
    HintListeSeries, HintAjoutSerie, HintModifSerie, HintSuppSerie,
    vmSeries);
  AssignIG(GestionEditeur, AjouterEditeurs, ModifierEditeurs, SupprimerEditeurs,
    HintListeEditeurs, HintAjoutEditeur, HintModifEditeur, HintSuppEditeur,
    vmEditeurs);
  AssignIG(GestionCollection, AjouterCollections, ModifierCollections, SupprimerCollections,
    HintListeCollections, HintAjoutCollection, HintModifCollection, HintSuppCollection,
    vmCollections);
  AssignIG(GestionParaBD, AjouterCollections, ModifierCollections, SupprimerCollections,
    HintListeParaBD, HintAjoutParaBD, HintModifParaBD, HintSuppParaBD,
    vmParaBDSerie);
  AssignIG(GestionAchatParaBD, AjouterAchatsParaBD, ModifierAchatsParaBD, SupprimerAchatsParaBD,
    HintListeParaBD, HintAjoutParaBD, HintModifParaBD, HintSuppParaBD,
    vmParaBDSerie, 'Achat = 1', AcheterParaBD);
  LastButton := nil;
  VirtualTreeView.ShowAchat := False;
  SpeedButton1Click(btAlbums);
end;

procedure TFrmGestions.ajouterClick(Sender: TObject);
begin
  with GestionCourante do
    ProcAjouter(VirtualTreeView, ScanEdit.Text);
end;

procedure TFrmGestions.modifierClick(Sender: TObject);
begin
  with GestionCourante do
    ProcModifier(VirtualTreeView);
end;

procedure TFrmGestions.supprimerClick(Sender: TObject);
begin
  with GestionCourante do
    ProcSupprimer(VirtualTreeView);
end;

procedure TFrmGestions.SpeedButton1Click(Sender: TObject);
var
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  if Sender = LastButton then Exit;
  LastButton := TSpeedButton(Sender);
  LastButton.Down := True;
  with GestionCourante do begin
    ajouter.Hint := AjoutHint;
    supprimer.Hint := SuppHint;
    modifier.Hint := ModifHint;
    VirtualTreeView.Mode := vmNone;
    VirtualTreeView.UseFiltre := Filtre <> '';
    VirtualTreeView.Filtre := Filtre;
    VirtualTreeView.Mode := Mode;
    VirtualTreeView.Header.Columns.Clear;
    acheter.Visible := Assigned(ProcAcheter);
    Bevel7.Visible := acheter.Visible;
  end;
  PrepareLV(Self);
end;

procedure TFrmGestions.VDTButton2Click(Sender: TObject);
begin
  VirtualTreeView.InitializeRep;
end;

procedure TFrmGestions.VDTButton1Click(Sender: TObject);
begin
  VirtualTreeView.Find(ScanEdit.Text, Sender = VDTButton1);
end;

procedure TFrmGestions.ScanEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    VirtualTreeView.OnDblClick(VirtualTreeView);
  end;
end;

procedure TFrmGestions.acheterClick(Sender: TObject);
begin
  with GestionCourante do
    ProcAcheter(VirtualTreeView);
end;

end.

