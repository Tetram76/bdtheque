unit Form_EditAchatAlbum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBEditLabeled, VirtualTrees, ComCtrls, VDTButton, JvUIB,
  ExtCtrls, Buttons, Fram_Boutons, VirtualTree, TypeRec,
  Frame_RechercheRapide;

type
  TFrmEditAchatAlbum = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Bevel3: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    edAnneeParution: TEditLabeled;
    edTitre: TEditLabeled;
    vtSeries: TVirtualStringTree;
    cbIntegrale: TCheckBoxLabeled;
    edTome: TEditLabeled;
    cbHorsSerie: TCheckBoxLabeled;
    edTomeDebut: TEditLabeled;
    edTomeFin: TEditLabeled;
    Label20: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    vstAlbums: TVirtualStringTree;
    Label4: TLabel;
    Frame11: TFrame1;
    btScenariste: TVDTButton;
    btDessinateur: TVDTButton;
    Label19: TLabel;
    btColoriste: TVDTButton;
    lvScenaristes: TVDTListViewLabeled;
    lvDessinateurs: TVDTListViewLabeled;
    vtPersonnes: TVirtualStringTree;
    lvColoristes: TVDTListViewLabeled;
    edMoisParution: TEditLabeled;
    remarques: TMemoLabeled;
    Label7: TLabel;
    histoire: TMemoLabeled;
    Label6: TLabel;
    FrameRechercheRapidePersonnes: TFrameRechercheRapide;
    FrameRechercheRapideSerie: TFrameRechercheRapide;
    FrameRechercheRapideAlbums: TFrameRechercheRapide;
    procedure FormCreate(Sender: TObject);
    procedure cbIntegraleClick(Sender: TObject);
    procedure Frame11btnOKClick(Sender: TObject);
    procedure vtPersonnesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtPersonnesDblClick(Sender: TObject);
    procedure btScenaristeClick(Sender: TObject);
    procedure lvColoristesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure vtSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtSeriesDblClick(Sender: TObject);
  private
    FID_Album: TGUID;
    FCreation: Boolean;
    FScenaristesSelected, FDessinateursSelected, FColoristesSelected: Boolean;
    procedure SetID_Album(const Value: TGUID);
    procedure AjouteAuteur(List: TVDTListViewLabeled; Auteur: TPersonnage; var FlagAuteur: Boolean);
    procedure AjouteAuteur2(List: TVDTListViewLabeled; Auteur: TPersonnage);
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    property ID_Album: TGUID read FID_Album write SetID_Album;
  end;

implementation

uses Math, CommonConst, Proc_Gestions, DM_Princ, Commun, Procedures,
  Textes, Divers, LoadComplet, jvuiblib;

{$R *.dfm}

procedure TFrmEditAchatAlbum.AjouteAuteur2(List: TVDTListViewLabeled; Auteur: TPersonnage);
var
  dummy: Boolean;
begin
  AjouteAuteur(List, Auteur, dummy);
end;

procedure TFrmEditAchatAlbum.AjouteAuteur(List: TVDTListViewLabeled; Auteur: TPersonnage; var FlagAuteur: Boolean);
var
  PA: TAuteur;
begin
  PA := TAuteur.Create;
  PA.Fill(Auteur, ID_Album, GUID_NULL, 0);
  with List.Items.Add do begin
    Data := PA;
    Caption := PA.ChaineAffichage;
  end;
  FlagAuteur := True;
end;

procedure TFrmEditAchatAlbum.FormCreate(Sender: TObject);
begin
  PrepareLV(Self);
  FID_Album := GUID_NULL;
  FCreation := True;

  FrameRechercheRapidePersonnes.VirtualTreeView := vtPersonnes;
  FrameRechercheRapideSerie.VirtualTreeView := vtSeries;
  FrameRechercheRapideAlbums.VirtualTreeView := vstAlbums;
  FrameRechercheRapideAlbums.ShowNewButton := False;
  if Mode_en_cours = mdConsult then begin
    Frame11.Align := alBottom;
    Frame11.btnOK.Caption := 'Ok';
  end
  else begin
    Frame11.Align := alTop;
    Frame11.btnOK.Caption := 'Enregistrer';
  end;
  PageControl1.ActivePageIndex := 0;
  vtPersonnes.Mode := vmPersonnes;
  vtSeries.Mode := vmSeries;
  vstAlbums.Mode := vmAlbumsSerie;
  FScenaristesSelected := False;
  FDessinateursSelected := False;
  FColoristesSelected := False;
end;

procedure TFrmEditAchatAlbum.SetID_Album(const Value: TGUID);
var
  q: TJvUIBQuery;
  ID_Serie: TGUID;
begin
  FID_Album := Value;

  q := TJvUIBQuery.Create(nil);
  with q do try
    Transaction := GetTransaction(DMPrinc.UIBDataBase);

    FetchBlobs := True;
    SQL.Text := 'SELECT COMPLET, TITREALBUM, MOISPARUTION, ANNEEPARUTION, ID_Serie, TOME, TOMEDEBUT, TOMEFIN, HORSSERIE, INTEGRALE, SUJETALBUM, REMARQUESALBUM FROM ALBUMS WHERE ID_Album = ?';
    Params.AsString[0] := GUIDToString(FID_Album);
    Open;

    FCreation := Eof;
    TabSheet1.TabVisible := FCreation;
    TabSheet2.TabVisible := FCreation;
    if not FCreation then begin
      if Fields.AsInteger[0] = 1 then begin
        PageControl1.ActivePage := TabSheet2;
        vstAlbums.CurrentValue := FID_Album;
      end
      else begin
        PageControl1.ActivePage := TabSheet1;
        edTitre.Text := Fields.ByNameAsString['TITREALBUM'];
        edAnneeParution.Text := Fields.ByNameAsString['ANNEEPARUTION'];
        edMoisParution.Text := Fields.ByNameAsString['MOISPARUTION'];
        edTome.Text := Fields.ByNameAsString['TOME'];
        edTomeDebut.Text := Fields.ByNameAsString['TOMEDEBUT'];
        edTomeFin.Text := Fields.ByNameAsString['TOMEFIN'];
        cbIntegrale.Checked := Fields.ByNameAsBoolean['INTEGRALE'];
        cbHorsSerie.Checked := Fields.ByNameAsBoolean['HORSSERIE'];
        cbIntegraleClick(cbIntegrale);
        histoire.Lines.Text := Fields.ByNameAsString['SUJETALBUM'];
        remarques.Lines.Text := Fields.ByNameAsString['REMARQUESALBUM'];
        ID_Serie := StringToGUID(Fields.ByNameAsString['ID_Serie']);

        lvScenaristes.Items.BeginUpdate;
        lvDessinateurs.Items.BeginUpdate;
        lvColoristes.Items.BeginUpdate;
        SQL.Text := 'SELECT * FROM PROC_AUTEURS(?, NULL, NULL)';
        Params.AsString[0] := GUIDToString(FID_Album);
        Open;
        while not Eof do begin
          case Fields.ByNameAsInteger['Metier'] of
            0: begin
                with LVScenaristes.Items.Add do begin
                  Data := TAuteur.Make(q);
                  Caption := TAuteur(Data).ChaineAffichage;
                end;
                FScenaristesSelected := True;
              end;
            1: begin
                with LVDessinateurs.Items.Add do begin
                  Data := TAuteur.Make(q);
                  Caption := TAuteur(Data).ChaineAffichage;
                end;
                FDessinateursSelected := True;
              end;
            2: begin
                with LVColoristes.Items.Add do begin
                  Data := TAuteur.Make(q);
                  Caption := TAuteur(Data).ChaineAffichage;
                end;
                FColoristesSelected := True;
              end;
          end;
          Next;
        end;

        vtSeries.CurrentValue := ID_Serie;
      end;
    end;
  finally
    Transaction.Free;
    Free;
  end;
end;

procedure TFrmEditAchatAlbum.cbIntegraleClick(Sender: TObject);
var
  cl: TColor;
begin
  edTomeDebut.Enabled := cbIntegrale.Checked;
  edTomeFin.Enabled := cbIntegrale.Checked;
  if cbIntegrale.Checked then
    cl := clWindowText
  else
    cl := clInactiveCaptionText;
  Label16.Font.Color := cl;
  Label17.Font.Color := cl;
end;

procedure TFrmEditAchatAlbum.Frame11btnOKClick(Sender: TObject);
var
  s: string;
  q: TJvUIBQuery;
  hg: IHourGlass;
begin
  if PageControl1.ActivePage = TabSheet1 then begin
    //    if Length(Trim(edTitre.Text)) = 0 then begin
    //      AffMessage(rsTitreObligatoire, mtInformation, [mbOk], True);
    //      edTitre.SetFocus;
    //      ModalResult := mrNone;
    //      Exit;
    //    end;
    if not (StrToIntDef(edMoisParution.Text, 1) in [1..12]) then begin
      AffMessage(rsMoisParutionIncorrect, mtInformation, [mbOk], True);
      edMoisParution.SetFocus;
      ModalResult := mrNone;
      Exit;
    end;
    if IsEqualGUID(vtSeries.CurrentValue, GUID_NULL) then begin
      AffMessage(rsSerieObligatoire, mtInformation, [mbOk], True);
      FrameRechercheRapideSerie.edSearch.SetFocus;
      ModalResult := mrNone;
      Exit;
    end;
  end
  else if IsEqualGUID(vstAlbums.CurrentValue, GUID_NULL) then begin
    AffMessage(rsAlbumObligatoire, mtInformation, [mbOk], True);
    FrameRechercheRapideAlbums.edSearch.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  hg := THourGlass.Create;
  q := TJvUIBQuery.Create(nil);
  with q do try
    Transaction := GetTransaction(DMPrinc.UIBDataBase);

    if PageControl1.ActivePage = TabSheet2 then begin
      if (not IsEqualGUID(vstAlbums.CurrentValue, FID_Album)) and (not IsEqualGUID(FID_Album, GUID_NULL)) then begin
        SQL.Text := 'UPDATE ALBUMS SET ACHAT = 0 WHERE ID_Album = ?';
        Params.AsString[0] := GUIDToString(FID_Album);
        Execute;
        FID_Album := GUID_NULL;
      end;
      SQL.Text := 'UPDATE ALBUMS SET ACHAT = 1 WHERE ID_Album = ?';
      Params.AsString[0] := GUIDToString(vstAlbums.CurrentValue);
      Execute;
      FID_Album := vstAlbums.CurrentValue;
    end
    else begin
      if FCreation then begin
        if IsEqualGUID(FID_Album, GUID_NULL) then begin
          SQL.Text := 'select udf_createguid() from rdb$database';
          Open;
          FID_Album := StringToGUID(Fields.AsString[0]);
        end;

        SQL.Text := 'INSERT INTO ALBUMS (ID_Album,  TITREALBUM,  MOISPARUTION,  ANNEEPARUTION,  ID_Serie,  TOME,  TOMEDEBUT,  TOMEFIN,  HORSSERIE,  INTEGRALE,  SUJETALBUM,  REMARQUESALBUM,  TITREINITIALESALBUM,  UPPERSUJETALBUM,  UPPERREMARQUESALBUM, ACHAT)';
        SQL.Add('VALUES');
        SQL.Add('(:ID_Album, :TITREALBUM, :MOISPARUTION, :ANNEEPARUTION, :ID_Serie, :TOME, :TOMEDEBUT, :TOMEFIN, :HORSSERIE, :INTEGRALE, :SUJETALBUM, :REMARQUESALBUM, :TITREINITIALESALBUM, :UPPERSUJETALBUM, :UPPERREMARQUESALBUM, 1)');
      end
      else begin
        SQL.Text := 'UPDATE ALBUMS SET';
        SQL.Add('TITREALBUM = :TITREALBUM, MOISPARUTION = :MOISPARUTION, ANNEEPARUTION = :ANNEEPARUTION, ID_Serie = :ID_Serie, TOME = :TOME, TOMEDEBUT = :TOMEDEBUT, TOMEFIN = :TOMEFIN,');
        SQL.Add('HORSSERIE = :HORSSERIE, INTEGRALE = :INTEGRALE,');
        SQL.Add('SUJETALBUM = :SUJETALBUM,');
        SQL.Add('REMARQUESALBUM = :REMARQUESALBUM,');
        SQL.Add('UPPERSUJETALBUM = :UPPERSUJETALBUM,');
        SQL.Add('UPPERREMARQUESALBUM = :UPPERREMARQUESALBUM,');
        SQL.Add('TITREINITIALESALBUM = :TITREINITIALESALBUM');
        SQL.Add('WHERE ID_Album = :ID_Album');
      end;

      Params.ByNameAsString['ID_Album'] := GUIDToString(FID_Album);
      s := Trim(edTitre.Text);
      Params.ByNameAsString['TITREALBUM'] := s;
      Params.ByNameAsString['TITREINITIALESALBUM'] := MakeInitiales(UpperCase(SansAccents(s)));
      if edAnneeParution.Text = '' then begin
        Params.ByNameIsNull['ANNEEPARUTION'] := True;
        Params.ByNameIsNull['MOISPARUTION'] := True;
      end
      else begin
        Params.ByNameAsString['ANNEEPARUTION'] := edAnneeParution.Text;
        if edMoisParution.Text = '' then
          Params.ByNameIsNull['MOISPARUTION'] := True
        else
          Params.ByNameAsString['MOISPARUTION'] := edMoisParution.Text;
      end;
      if edTome.Text = '' then
        Params.ByNameIsNull['TOME'] := True
      else
        Params.ByNameAsString['TOME'] := edTome.Text;
      if (not cbIntegrale.Checked) or (edTomeDebut.Text = '') then
        Params.ByNameIsNull['TOMEDEBUT'] := True
      else
        Params.ByNameAsString['TOMEDEBUT'] := edTomeDebut.Text;
      if (not cbIntegrale.Checked) or (edTomeFin.Text = '') then
        Params.ByNameIsNull['TOMEFIN'] := True
      else
        Params.ByNameAsString['TOMEFIN'] := edTomeFin.Text;
      Params.ByNameAsBoolean['INTEGRALE'] := cbIntegrale.Checked;
      Params.ByNameAsBoolean['HORSSERIE'] := cbHorsSerie.Checked;
      Params.ByNameAsString['ID_Serie'] := GUIDToString(vtSeries.CurrentValue);
      s := histoire.Lines.Text;
      if s <> '' then begin
        ParamsSetBlob('SUJETALBUM', s);
        s := UpperCase(SansAccents(s));
        ParamsSetBlob('UPPERSUJETALBUM', s);
      end
      else begin
        Params.ByNameIsNull['SUJETALBUM'] := True;
        Params.ByNameIsNull['UPPERSUJETALBUM'] := True;
      end;
      s := remarques.Lines.Text;
      if s <> '' then begin
        ParamsSetBlob('REMARQUESALBUM', s);
        s := UpperCase(SansAccents(s));
        ParamsSetBlob('UPPERREMARQUESALBUM', s);
      end
      else begin
        Params.ByNameIsNull['REMARQUESALBUM'] := True;
        Params.ByNameIsNull['UPPERREMARQUESALBUM'] := True;
      end;
      ExecSQL;
      Transaction.Commit;
    end;
  finally
    Transaction.Free;
    Free;
  end;
  ModalResult := mrOk;
end;

procedure TFrmEditAchatAlbum.vtPersonnesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  IdPersonne: TGUID;

  function NotIn(LV: TListView): Boolean;
  var
    i: Integer;
  begin
    // PRealisateur peut �tre utilis� pour transtyper un PActeur
    i := 0;
    Result := True;
    while Result and (i <= Pred(LV.Items.Count)) do begin
      Result := not IsEqualGUID(TAuteur(LV.Items[i].Data).Personne.ID, IdPersonne);
      Inc(i);
    end;
  end;

begin
  IdPersonne := vtPersonnes.CurrentValue;
  btScenariste.Enabled := (not IsEqualGUID(IdPersonne, GUID_NULL)) and NotIn(LVScenaristes);
  btDessinateur.Enabled := (not IsEqualGUID(IdPersonne, GUID_NULL)) and NotIn(LVDessinateurs);
  btColoriste.Enabled := (not IsEqualGUID(IdPersonne, GUID_NULL)) and NotIn(LVColoristes);
end;

procedure TFrmEditAchatAlbum.vtPersonnesDblClick(Sender: TObject);
var
  i: Integer;
  iCurrentAuteur: TGUID;
  Auteur: TAuteur;
  CurrentAuteur: TPersonnage;
begin
  iCurrentAuteur := vtPersonnes.CurrentValue;
  if ModifierAuteurs(vtPersonnes) then begin
    CurrentAuteur := vtPersonnes.GetFocusedNodeData;
    for i := 0 to Pred(lvScenaristes.Items.Count) do begin
      Auteur := lvScenaristes.Items[i].Data;
      if IsEqualGUID(Auteur.Personne.ID, iCurrentAuteur) then begin
        Auteur.Personne.Assign(CurrentAuteur);
        lvScenaristes.Items[i].Caption := Auteur.ChaineAffichage;
      end;
    end;
    lvScenaristes.Invalidate;
    for i := 0 to Pred(lvDessinateurs.Items.Count) do begin
      Auteur := lvDessinateurs.Items[i].Data;
      if IsEqualGUID(Auteur.Personne.ID, iCurrentAuteur) then begin
        Auteur.Personne.Assign(CurrentAuteur);
        lvDessinateurs.Items[i].Caption := Auteur.ChaineAffichage;
      end;
    end;
    lvDessinateurs.Invalidate;
    for i := 0 to Pred(lvColoristes.Items.Count) do begin
      Auteur := lvColoristes.Items[i].Data;
      if IsEqualGUID(Auteur.Personne.ID, iCurrentAuteur) then begin
        Auteur.Personne.Assign(CurrentAuteur);
        lvColoristes.Items[i].Caption := Auteur.ChaineAffichage;
      end;
    end;
    lvColoristes.Invalidate;
  end;
end;

procedure TFrmEditAchatAlbum.btScenaristeClick(Sender: TObject);
begin
  if IsEqualGUID(vtPersonnes.CurrentValue, GUID_NULL) then Exit;
  case TSpeedButton(Sender).Tag of
    1: AjouteAuteur(lvScenaristes, vtPersonnes.GetFocusedNodeData, FScenaristesSelected);
    2: AjouteAuteur(lvDessinateurs, vtPersonnes.GetFocusedNodeData, FDessinateursSelected);
    3: AjouteAuteur(lvColoristes, vtPersonnes.GetFocusedNodeData, FColoristesSelected);
  end;
  vtPersonnesChange(vtPersonnes, vtPersonnes.FocusedNode);
end;

procedure TFrmEditAchatAlbum.lvColoristesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  src: TListView;
  PA: TAuteur;
begin
  if Key <> VK_DELETE then Exit;
  src := TListView(Sender);
  PA := src.Selected.Data;
  PA.Free;
  src.Selected.Delete;
  vtPersonnesChange(vtPersonnes, vtPersonnes.FocusedNode);
end;

procedure TFrmEditAchatAlbum.vtSeriesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  PS: TSerie;
  SC: TSerieComplete;
  i: Integer;
begin
  PS := vtSeries.GetFocusedNodeData;
  if Assigned(PS) then begin
    if not (FScenaristesSelected and FDessinateursSelected and FColoristesSelected) then begin
      SC := TSerieComplete.Create(PS.ID);
      try
        if not FScenaristesSelected then begin
          TAuteur.VideListe(lvScenaristes);
          for i := 0 to Pred(SC.Scenaristes.Count) do
            AjouteAuteur2(lvScenaristes, TAuteur(SC.Scenaristes[i]).Personne);
        end;
        if not FDessinateursSelected then begin
          TAuteur.VideListe(lvDessinateurs);
          for i := 0 to Pred(SC.Dessinateurs.Count) do
            AjouteAuteur2(lvDessinateurs, TAuteur(SC.Dessinateurs[i]).Personne);
        end;
        if not FColoristesSelected then begin
          TAuteur.VideListe(lvColoristes);
          for i := 0 to Pred(SC.Coloristes.Count) do
            AjouteAuteur2(lvColoristes, TAuteur(SC.Coloristes[i]).Personne);
        end;
      finally
        SC.Free;
      end;
    end;
  end;
end;

procedure TFrmEditAchatAlbum.vtSeriesDblClick(Sender: TObject);
begin
  if (vtSeries.GetFirstSelected <> nil) then begin
    ModifierSeries(vtSeries);
    vtSeriesChange(vtSeries, vtSeries.GetFirstSelected);
  end;
end;

end.

