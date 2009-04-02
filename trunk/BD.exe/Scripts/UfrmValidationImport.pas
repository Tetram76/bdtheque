unit UfrmValidationImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LoadComplet, ExtCtrls, CheckLst, Menus, jpeg,
  UframBoutons, ComboCheck, EditLabeled, ComCtrls;

type
  TfrmValidationImport = class(TForm)
    CheckBox1: TCheckBoxLabeled;
    edTitreAlbum: TEditLabeled;
    CheckBox2: TCheckBoxLabeled;
    edTome: TEditLabeled;
    edMoisParution: TEditLabeled;
    CheckBox3: TCheckBoxLabeled;
    CheckBox4: TCheckBoxLabeled;
    edAnneeParution: TEditLabeled;
    CheckBox5: TCheckBoxLabeled;
    pnHorsSerie: TPanel;
    RadioButton1: TRadioButtonLabeled;
    RadioButton2: TRadioButtonLabeled;
    pnIntegrale: TPanel;
    RadioButton3: TRadioButtonLabeled;
    RadioButton4: TRadioButtonLabeled;
    CheckBox6: TCheckBoxLabeled;
    cklScenaristes: TCheckListBoxLabeled;
    CheckBox8: TCheckBoxLabeled;
    cklDessinateurs: TCheckListBoxLabeled;
    CheckBox9: TCheckBoxLabeled;
    cklColoristes: TCheckListBoxLabeled;
    CheckBox10: TCheckBoxLabeled;
    mmResumeAlbum: TMemoLabeled;
    mmNotesAlbum: TMemoLabeled;
    CheckBox11: TCheckBoxLabeled;
    CheckBox12: TCheckBoxLabeled;
    framBoutons1: TframBoutons;
    CheckBox13: TCheckBoxLabeled;
    edTitreSerie: TEditLabeled;
    pnTerminee: TPanel;
    RadioButton5: TRadioButtonLabeled;
    RadioButton6: TRadioButtonLabeled;
    CheckBox14: TCheckBoxLabeled;
    CheckBox15: TCheckBoxLabeled;
    cklGenres: TCheckListBoxLabeled;
    edSiteWebSerie: TEditLabeled;
    CheckBox16: TCheckBoxLabeled;
    mmResumeSerie: TMemoLabeled;
    CheckBox17: TCheckBoxLabeled;
    mmNotesSerie: TMemoLabeled;
    CheckBox18: TCheckBoxLabeled;
    CheckBox19: TCheckBoxLabeled;
    edNbAlbums: TEditLabeled;
    cbxEtat: TLightComboCheck;
    cbxEdition: TLightComboCheck;
    cbxReliure: TLightComboCheck;
    cbxOrientation: TLightComboCheck;
    cbxSensLecture: TLightComboCheck;
    cbxFormat: TLightComboCheck;
    CheckBox24: TCheckBoxLabeled;
    CheckBox23: TCheckBoxLabeled;
    CheckBox25: TCheckBoxLabeled;
    CheckBox26: TCheckBoxLabeled;
    CheckBox27: TCheckBoxLabeled;
    CheckBox28: TCheckBoxLabeled;
    Label9: TCheckBoxLabeled;
    edPrix: TEditLabeled;
    edISBN: TEditLabeled;
    Label11: TCheckBoxLabeled;
    Label24: TCheckBoxLabeled;
    edAnneeCote: TEditLabeled;
    Label25: TCheckBoxLabeled;
    edPrixCote: TEditLabeled;
    pnGratuit: TPanel;
    RadioButton7: TRadioButtonLabeled;
    RadioButton8: TRadioButtonLabeled;
    CheckBox30: TCheckBoxLabeled;
    pnCouleur: TPanel;
    RadioButton9: TRadioButtonLabeled;
    RadioButton10: TRadioButtonLabeled;
    CheckBox31: TCheckBoxLabeled;
    pnVO: TPanel;
    RadioButton11: TRadioButtonLabeled;
    RadioButton12: TRadioButtonLabeled;
    CheckBox7: TCheckBoxLabeled;
    edTomeDebut: TEditLabeled;
    Label17: TLabel;
    edTomeFin: TEditLabeled;
    CheckBox33: TCheckBoxLabeled;
    edNbPages: TEditLabeled;
    RadioButtonLabeled1: TRadioButtonLabeled;
    cklImages: TCheckListBoxLabeled;
    CheckBoxLabeled1: TCheckBoxLabeled;
    imgVisu: TImage;
    cklScenaristesSerie: TCheckListBoxLabeled;
    CheckBoxLabeled2: TCheckBoxLabeled;
    cklDessinateursSerie: TCheckListBoxLabeled;
    CheckBoxLabeled3: TCheckBoxLabeled;
    cklColoristesSerie: TCheckListBoxLabeled;
    CheckBoxLabeled4: TCheckBoxLabeled;
    CheckBoxLabeled5: TCheckBoxLabeled;
    edNomEditeurSerie: TEditLabeled;
    edSiteWebEditeurSerie: TEditLabeled;
    CheckBoxLabeled6: TCheckBoxLabeled;
    edCollectionSerie: TEditLabeled;
    CheckBoxLabeled7: TCheckBoxLabeled;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    edNomEditeur: TEditLabeled;
    CheckBox20: TCheckBoxLabeled;
    edSiteWebEditeur: TEditLabeled;
    CheckBox21: TCheckBoxLabeled;
    edCollection: TEditLabeled;
    CheckBox22: TCheckBoxLabeled;
    edAnneeEdition: TEditLabeled;
    CheckBox29: TCheckBoxLabeled;
    CheckBox32: TCheckBoxLabeled;
    procedure FormCreate(Sender: TObject);
    procedure framBoutons1btnOKClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbxEtatBeforeShowPop(Sender: TObject; Menu: TPopupMenu; var Continue: Boolean);
    procedure cklImagesClick(Sender: TObject);
    procedure imgVisuClick(Sender: TObject);
  private
    FAlbum: TAlbumComplet;
    DefaultValues: TAlbumComplet;
    DefaultEdition: TEditionComplete;
    procedure SetAlbum(Value: TAlbumComplet);
    procedure VisuClose(Sender: TObject);
  public
    property Album: TAlbumComplet read FAlbum write SetAlbum;
  end;

implementation

uses
  Commun, Procedures, CommonConst, Generics.Collections, TypeRec,
  UBdtForms;

{$R *.dfm}

procedure TfrmValidationImport.VisuClose(Sender: TObject);
begin
  TForm(TImage(Sender).Parent).ModalResult := mrCancel;
end;

procedure TfrmValidationImport.cbxEtatBeforeShowPop(Sender: TObject; Menu: TPopupMenu; var Continue: Boolean);
begin
  // on autorise pas l'ouverture du menu
  Continue := False;
end;

procedure TfrmValidationImport.cklImagesClick(Sender: TObject);
var
  PC: TCouverture;
  hg: IHourGlass;
  ms: TStream;
  jpg: TJPEGImage;
begin
  if cklImages.ItemIndex > -1 then
  begin
    PC := FAlbum.Editions.Editions[0].Couvertures[cklImages.ItemIndex];
    hg := THourGlass.Create;
    if IsEqualGUID(PC.ID, GUID_NULL) then
      ms := GetCouvertureStream(PC.NewNom, imgVisu.Height, imgVisu.Width, TGlobalVar.Utilisateur.Options.AntiAliasing)
    else
      ms := GetCouvertureStream(False, PC.ID, imgVisu.Height, imgVisu.Width, TGlobalVar.Utilisateur.Options.AntiAliasing);
    if Assigned(ms) then
      try
        jpg := TJPEGImage.Create;
        try
          jpg.LoadFromStream(ms);
          imgVisu.Picture.Assign(jpg);
        finally
          FreeAndNil(jpg);
        end;
      finally
        FreeAndNil(ms);
      end;
  end
  else
    imgVisu.Picture.Assign(nil);
end;

procedure TfrmValidationImport.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;

  DefaultValues := TAlbumComplet.Create(GUID_NULL);
  DefaultEdition := TEditionComplete.Create(GUID_NULL);
  DefaultValues.Editions.Editions.Add(DefaultEdition);

  LoadCombo(1 {Etat}, cbxEtat);
  LoadCombo(2 {Reliure}, cbxReliure);
  LoadCombo(3 {TypeEdition}, cbxEdition);
  LoadCombo(4 {Orientation}, cbxOrientation);
  LoadCombo(5 {Format}, cbxFormat);
  LoadCombo(8 {Sens de lecture}, cbxSensLecture);
end;

procedure TfrmValidationImport.FormDestroy(Sender: TObject);
begin
  DefaultValues.Free;
  // pas la peine de d�truire DefaultEdition, il est associ� � DefaultValues qui le supprimera
end;

procedure TfrmValidationImport.framBoutons1btnOKClick(Sender: TObject);

  function SetValue(Ctrl: TEdit; Chk: TCheckBox; const Defaut: string): string; overload;
  begin
    if Chk.Checked then
      Result := Ctrl.Text
    else
      Result := Defaut;
  end;

  function SetValue(Ctrl: TEdit; Chk: TCheckBox; Defaut: Integer): Integer; overload;
  begin
    if Chk.Checked then
      Result := StrToIntDef(Ctrl.Text, Defaut)
    else
      Result := Defaut;
  end;

  procedure SetValue(Value: TStrings; Ctrl: TMemo; Chk: TCheckBox); overload;
  begin
    if Chk.Checked then
      Value.Text := Ctrl.Lines.Text
    else
      Value.Clear;
  end;

  procedure SetValue(Value: TStrings; Ctrl: TCheckListBox; Chk: TCheckBox); overload;
  var
    i: Integer;
  begin
    Value.Clear;
    if Chk.Checked then
      for i := 0 to Pred(Ctrl.Items.Count) do
        if Ctrl.Checked[i] then
          Value.Add(Ctrl.Items[i]);
  end;

  procedure SetValue(Value: TObjectList<TAuteur>; Ctrl: TCheckListBox; Chk: TCheckBox); overload;
  var
    i: Integer;
  begin
    if Chk.Checked then
    begin
      for i := Pred(Value.Count) downto 0 do
        if not Ctrl.Checked[i] then
          Value.Delete(i);
    end
    else
      Value.Clear;
  end;

  procedure SetValue(Value: TObjectList<TCouverture>; Ctrl: TCheckListBox; Chk: TCheckBox); overload;
  var
    i: Integer;
  begin
    if Chk.Checked then
    begin
      for i := Pred(Value.Count) downto 0 do
        if not Ctrl.Checked[i] then
          Value.Delete(i);
    end
    else
      Value.Clear;
  end;

  function SetValue(Ctrl: TPanel; Chk: TCheckBox; Defaut: Boolean): Boolean; overload;
  begin
    if Chk.Checked then
      Result := TRadioButton(Ctrl.Controls[0]).Checked
    else
      Result := Defaut;
  end;

  function SetValue(Ctrl: TPanel; Chk: TCheckBox; Defaut: Integer): Integer; overload;
  begin
    if Chk.Checked then
    begin
      if TRadioButton(Ctrl.Controls[0]).Checked then
        Result := Integer(cbChecked)
      else if TRadioButton(Ctrl.Controls[1]).Checked then
        Result := Integer(cbUnchecked)
      else
        Result := -1;
    end
    else
      Result := Defaut;
  end;

  function SetValue(Ctrl: TLightComboCheck; Chk: TCheckBox): ROption; overload;
  begin
    if Chk.Checked then
      Result := MakeOption(Ctrl.Value, Ctrl.Caption)
    else
      Result := MakeOption(Ctrl.DefaultValueChecked, Ctrl.GetCaption(Ctrl.DefaultValueChecked));
  end;

begin
  //Album
  FAlbum.Titre := SetValue(edTitreAlbum, CheckBox1, DefaultValues.Titre);
  FAlbum.MoisParution := SetValue(edMoisParution, CheckBox3, DefaultValues.MoisParution);
  FAlbum.AnneeParution := SetValue(edAnneeParution, CheckBox4, DefaultValues.AnneeParution);
  FAlbum.Tome := SetValue(edTome, CheckBox2, DefaultValues.Tome);
  FAlbum.TomeDebut := SetValue(edTomeDebut, CheckBox7, DefaultValues.TomeDebut);
  FAlbum.TomeFin := SetValue(edTomeFin, CheckBox7, DefaultValues.TomeFin);
  FAlbum.HorsSerie := SetValue(pnHorsSerie, CheckBox5, DefaultValues.HorsSerie);
  FAlbum.Integrale := SetValue(pnIntegrale, CheckBox6, DefaultValues.Integrale);
  SetValue(FAlbum.Scenaristes, cklScenaristes, CheckBox8);
  SetValue(FAlbum.Dessinateurs, cklDessinateurs, CheckBox9);
  SetValue(FAlbum.Coloristes, cklColoristes, CheckBox10);
  SetValue(FAlbum.Sujet, mmResumeAlbum, CheckBox11);
  SetValue(FAlbum.Notes, mmNotesAlbum, CheckBox12);

  //S�rie
  FAlbum.Serie.Titre := SetValue(edTitreSerie, CheckBox13, DefaultValues.Serie.Titre);
  FAlbum.Serie.SiteWeb := SetValue(edSiteWebSerie, CheckBox16, DefaultValues.Serie.SiteWeb);
  FAlbum.Serie.NbAlbums := SetValue(edNbAlbums, CheckBox19, DefaultValues.Serie.NbAlbums);
  FAlbum.Serie.Terminee := SetValue(pnTerminee, CheckBox14, DefaultValues.Serie.Terminee);
  SetValue(FAlbum.Serie.Genres, cklGenres, CheckBox15);
  SetValue(FAlbum.Serie.Scenaristes, cklScenaristesSerie, CheckBoxLabeled2);
  SetValue(FAlbum.Serie.Dessinateurs, cklDessinateursSerie, CheckBoxLabeled3);
  SetValue(FAlbum.Serie.Coloristes, cklColoristesSerie, CheckBoxLabeled4);
  SetValue(FAlbum.Serie.Sujet, mmResumeSerie, CheckBox17);
  SetValue(FAlbum.Serie.Notes, mmNotesSerie, CheckBox18);
  FAlbum.Serie.Editeur.NomEditeur := SetValue(edNomEditeurSerie, CheckBoxLabeled5, DefaultValues.Serie.Editeur.NomEditeur);
  FAlbum.Serie.Editeur.SiteWeb := SetValue(edSiteWebEditeurSerie, CheckBoxLabeled6, DefaultValues.Serie.Editeur.SiteWeb);
  FAlbum.Serie.Collection.NomCollection := SetValue(edCollectionSerie, CheckBoxLabeled7, DefaultValues.Serie.Collection.NomCollection);

  //Edition
  if FAlbum.Editions.Editions.Count > 0 then
    with FAlbum.Editions.Editions[0] do
    begin
      Editeur.NomEditeur := SetValue(edNomEditeur, CheckBox20, DefaultEdition.Editeur.NomEditeur);
      Editeur.SiteWeb := SetValue(edSiteWebEditeur, CheckBox21, DefaultEdition.Editeur.SiteWeb);
      Collection.NomCollection := SetValue(edCollection, CheckBox22, DefaultEdition.Collection.NomCollection);
      AnneeEdition := SetValue(edAnneeEdition, CheckBox29, DefaultEdition.AnneeEdition);
      Prix := StrToCurrDef(SetValue(edPrix, Label9, FormatCurr(FormatMonnaie, DefaultEdition.Prix)), 0);
      Gratuit := SetValue(pnGratuit, CheckBox30, DefaultEdition.Gratuit);
      ISBN := SetValue(edISBN, Label11, DefaultEdition.ISBN);
      Etat := SetValue(cbxEtat, CheckBox23);
      TypeEdition := SetValue(cbxEdition, CheckBox24);
      Reliure := SetValue(cbxReliure, CheckBox25);
      Orientation := SetValue(cbxOrientation, CheckBox26);
      SensLecture := SetValue(cbxSensLecture, CheckBox27);
      FormatEdition := SetValue(cbxFormat, CheckBox28);
      AnneeCote := SetValue(edAnneeCote, Label24, DefaultEdition.AnneeCote);
      if PrixCote <> 0 then
        PrixCote := StrToCurrDef(SetValue(edPrixCote, Label25, FormatCurr(FormatMonnaie, DefaultEdition.PrixCote)), 0);
      Couleur := SetValue(pnCouleur, CheckBox31, DefaultEdition.Couleur);
      VO := SetValue(pnVO, CheckBox32, DefaultEdition.VO);
      NombreDePages := SetValue(edNbPages, CheckBox33, DefaultEdition.NombreDePages);
      SetValue(Couvertures, cklImages, CheckBoxLabeled1);
    end;

  framBoutons1.btnOKClick(Sender);
end;

procedure TfrmValidationImport.imgVisuClick(Sender: TObject);
var
  PC: TCouverture;
  hg: IHourGlass;
  ms: TStream;
  jpg: TJPEGImage;
  Couverture: TImage;
  Frm: TForm;
begin
  if cklImages.ItemIndex = -1 then
    Exit;
  PC := FAlbum.Editions.Editions[0].Couvertures[cklImages.ItemIndex];
  hg := THourGlass.Create;
  if IsEqualGUID(PC.ID, GUID_NULL) then
    ms := GetCouvertureStream(PC.NewNom, 400, 500, TGlobalVar.Utilisateur.Options.AntiAliasing)
  else
    ms := GetCouvertureStream(False, PC.ID, 400, 500, TGlobalVar.Utilisateur.Options.AntiAliasing);
  if Assigned(ms) then
    try
      jpg := TJPEGImage.Create;
      Frm := TbdtForm.Create(Self);
      Couverture := TImage.Create(Frm);
      try
        jpg.LoadFromStream(ms);
        Frm.BorderIcons := [];
        Frm.BorderStyle := bsToolWindow;
        Frm.Position := poOwnerFormCenter;
        Couverture.Parent := Frm;
        Couverture.Picture.Assign(jpg);
        Couverture.Cursor := crHandPoint;
        Couverture.OnClick := VisuClose;
        Couverture.AutoSize := True;
        Frm.AutoSize := True;
        Frm.ShowModal;
      finally
        FreeAndNil(jpg);
        FreeAndNil(Couverture);
        FreeAndNil(Frm);
      end;
    finally
      FreeAndNil(ms);
    end;
end;

procedure TfrmValidationImport.SetAlbum(Value: TAlbumComplet);

  procedure ChangeState(Chk: TCheckBox; Ctrl: TControl);
  begin
    Chk.Enabled := Chk.Checked;
    Ctrl.Enabled := Chk.Enabled and not (Ctrl is TPanel);
  end;

  procedure LoadValue(const Value: string; Ctrl: TEdit; Chk: TCheckBox; const Defaut: string); overload;
  begin
    Ctrl.Text := Value;
    Chk.Checked := Value <> Defaut;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: Integer; Ctrl: TEdit; Chk: TCheckBox; Defaut: Integer); overload;
  begin
    Ctrl.Text := NonZero(Value);
    Chk.Checked := Value <> Defaut;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: TStrings; Ctrl: TMemo; Chk: TCheckBox); overload;
  begin
    Ctrl.Lines.Text := Value.Text;
    Chk.Checked := Value.Text <> '';
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: TStrings; Ctrl: TCheckListBox; Chk: TCheckBox); overload;
  var
    i: Integer;
  begin
    Ctrl.Items.Assign(Value);
    for i := 0 to Pred(Ctrl.Items.Count) do
      Ctrl.Checked[i] := True;
    Chk.Checked := Ctrl.Items.Count > 0;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: TObjectList<TAuteur>; Ctrl: TCheckListBox; Chk: TCheckBox); overload;
  var
    i: Integer;
  begin
    Ctrl.Items.Clear;
    for i := 0 to Pred(Value.Count) do
    begin
      Ctrl.Items.Add(Value[i].Personne.Nom);
      Ctrl.Checked[i] := True;
    end;
    Chk.Checked := Ctrl.Items.Count > 0;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: TObjectList<TCouverture>; Ctrl: TCheckListBox; Chk: TCheckBox); overload;
  var
    i: Integer;
  begin
    Ctrl.Items.Clear;
    for i := 0 to Pred(Value.Count) do
    begin
      if Value[i].sCategorie <> '' then
        Ctrl.Items.Add(Value[i].sCategorie)
      else
        Ctrl.Items.Add(ExtractFileName(Value[i].NewNom));
      Ctrl.Checked[i] := True;
    end;
    Chk.Checked := Ctrl.Items.Count > 0;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: Boolean; Ctrl: TPanel; Chk: TCheckBox; Defaut: Boolean); overload;
  begin
    Chk.Checked := Defaut <> Value;
    TRadioButton(Ctrl.Controls[0]).Checked := Value;
    TRadioButton(Ctrl.Controls[1]).Checked := not Value;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: Integer; Ctrl: TPanel; Chk: TCheckBox; Defaut: Integer); overload;
  begin
    Chk.Checked := Defaut <> Value;
    TRadioButton(Ctrl.Controls[0]).Checked := TCheckBoxState(Value) = cbChecked;
    TRadioButton(Ctrl.Controls[1]).Checked := TCheckBoxState(Value) = cbUnchecked;
    TRadioButton(Ctrl.Controls[2]).Checked := Value = -1;
    ChangeState(Chk, Ctrl);
  end;

  procedure LoadValue(Value: ROption; Ctrl: TLightComboCheck; Chk: TCheckBox); overload;
  begin
    Ctrl.Value := Value.Value;
    Chk.Checked := Value.Value <> Ctrl.DefaultValueChecked;
    ChangeState(Chk, Ctrl);
  end;

begin
  FAlbum := Value;

  //Album
  LoadValue(FAlbum.Titre, edTitreAlbum, CheckBox1, DefaultValues.Titre);
  LoadValue(FAlbum.MoisParution, edMoisParution, CheckBox3, DefaultValues.MoisParution);
  LoadValue(FAlbum.AnneeParution, edAnneeParution, CheckBox4, DefaultValues.AnneeParution);
  LoadValue(FAlbum.Tome, edTome, CheckBox2, DefaultValues.Tome);

  LoadValue(FAlbum.TomeDebut, edTomeDebut, CheckBox7, DefaultValues.TomeDebut);
  LoadValue(FAlbum.TomeFin, edTomeFin, CheckBox7, DefaultValues.TomeFin);
  CheckBox7.Checked := (edTomeDebut.Text <> NonZero(DefaultValues.TomeDebut)) and (edTomeFin.Text <> NonZero(DefaultValues.TomeFin));
  ChangeState(CheckBox7, edTomeDebut);
  ChangeState(CheckBox7, edTomeFin);

  LoadValue(FAlbum.HorsSerie, pnHorsSerie, CheckBox5, DefaultValues.HorsSerie);
  LoadValue(FAlbum.Integrale, pnIntegrale, CheckBox6, DefaultValues.Integrale);
  LoadValue(FAlbum.Scenaristes, cklScenaristes, CheckBox8);
  LoadValue(FAlbum.Dessinateurs, cklDessinateurs, CheckBox9);
  LoadValue(FAlbum.Coloristes, cklColoristes, CheckBox10);
  LoadValue(FAlbum.Sujet, mmResumeAlbum, CheckBox11);
  LoadValue(FAlbum.Notes, mmNotesAlbum, CheckBox12);

  //S�rie
  LoadValue(FAlbum.Serie.Titre, edTitreSerie, CheckBox13, DefaultValues.Serie.Titre);
  LoadValue(FAlbum.Serie.SiteWeb, edSiteWebSerie, CheckBox16, DefaultValues.Serie.SiteWeb);
  LoadValue(FAlbum.Serie.NbAlbums, edNbAlbums, CheckBox19, DefaultValues.Serie.NbAlbums);
  LoadValue(FAlbum.Serie.Terminee, pnTerminee, CheckBox14, DefaultValues.Serie.Terminee);
  LoadValue(FAlbum.Serie.Genres, cklGenres, CheckBox15);
  LoadValue(FAlbum.Serie.Scenaristes, cklScenaristesSerie, CheckBoxLabeled2);
  LoadValue(FAlbum.Serie.Dessinateurs, cklDessinateursSerie, CheckBoxLabeled3);
  LoadValue(FAlbum.Serie.Coloristes, cklColoristesSerie, CheckBoxLabeled4);
  LoadValue(FAlbum.Serie.Sujet, mmResumeSerie, CheckBox17);
  LoadValue(FAlbum.Serie.Notes, mmNotesSerie, CheckBox18);
  LoadValue(FAlbum.Serie.Editeur.NomEditeur, edNomEditeurSerie, CheckBoxLabeled5, DefaultValues.Serie.Editeur.NomEditeur);
  LoadValue(FAlbum.Serie.Editeur.SiteWeb, edSiteWebEditeurSerie, CheckBoxLabeled6, DefaultValues.Serie.Editeur.SiteWeb);
  LoadValue(FAlbum.Serie.Collection.NomCollection, edCollectionSerie, CheckBoxLabeled7, DefaultValues.Serie.Collection.NomCollection);

  //Edition
  TabSheet3.TabVisible := FAlbum.Editions.Editions.Count > 0;
  if FAlbum.Editions.Editions.Count > 0 then
    with FAlbum.Editions.Editions[0] do
    begin
      LoadValue(Editeur.NomEditeur, edNomEditeur, CheckBox20, DefaultEdition.Editeur.NomEditeur);
      LoadValue(Editeur.SiteWeb, edSiteWebEditeur, CheckBox21, DefaultEdition.Editeur.SiteWeb);
      LoadValue(Collection.NomCollection, edCollection, CheckBox22, DefaultEdition.Collection.NomCollection);
      LoadValue(AnneeEdition, edAnneeEdition, CheckBox29, DefaultEdition.AnneeEdition);
      //if Prix <> 0 then
      LoadValue(FormatCurr(FormatMonnaie, Prix), edPrix, Label9, FormatCurr(FormatMonnaie, DefaultEdition.Prix));
      LoadValue(Gratuit, pnGratuit, CheckBox30, DefaultEdition.Gratuit);
      LoadValue(ISBN, edISBN, Label11, DefaultEdition.ISBN);
      LoadValue(Etat, cbxEtat, CheckBox23);
      LoadValue(TypeEdition, cbxEdition, CheckBox24);
      LoadValue(Reliure, cbxReliure, CheckBox25);
      LoadValue(Orientation, cbxOrientation, CheckBox26);
      LoadValue(SensLecture, cbxSensLecture, CheckBox27);
      LoadValue(FormatEdition, cbxFormat, CheckBox28);
      LoadValue(AnneeCote, edAnneeCote, Label24, DefaultEdition.AnneeCote);
      //if PrixCote <> 0 then
      LoadValue(FormatCurr(FormatMonnaie, PrixCote), edPrixCote, Label25, FormatCurr(FormatMonnaie, DefaultEdition.PrixCote));
      LoadValue(Couleur, pnCouleur, CheckBox31, DefaultEdition.Couleur);
      LoadValue(VO, pnVO, CheckBox32, DefaultEdition.VO);
      LoadValue(NombreDePages, edNbPages, CheckBox33, DefaultEdition.NombreDePages);
      LoadValue(Couvertures, cklImages, CheckBoxLabeled1);
    end;
end;

end.