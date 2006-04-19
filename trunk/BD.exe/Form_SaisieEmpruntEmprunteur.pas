unit Form_SaisieEmpruntEmprunteur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, DBCtrls, ComCtrls, ExtCtrls,
  ToolWin, Buttons, Fram_Boutons, ScanEdit, VDTButton, Menus, Commun, DBEditLabeled, VirtualTrees, VirtualTree,
  ComboCheck, Frame_RechercheRapide, LoadComplet, CRFurtif;

type
  TFrmSaisie_EmpruntEmprunteur = class(TForm)
    Panel4: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    ListView1: TVDTListView;
    Panel5: TPanel;
    Frame11: TFrame1;
    Panel9: TPanel;
    VDTButton2: TCRFurtifLight;
    VDTButton3: TCRFurtifLight;
    Panel1: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    pret: TCheckBoxLabeled;
    date_pret: TDateTimePickerLabeled;
    lccEditions: TLightComboCheck;
    Panel6: TPanel;
    vtAlbums: TVirtualStringTree;
    FrameRechercheRapide1: TFrameRechercheRapide;
    procedure FormCreate(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure pretClick(Sender: TObject);
    procedure date_pretChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnOkExecute(Sender: TObject);
    procedure vtAlbumsDblClick(Sender: TObject);
    procedure lccEditionsChange(Sender: TObject);
  private
    { D�clarations priv�es }
    FID_Emprunteur: TGUID;
    FEditions: TEditionsComplet;
    procedure SetID_Emprunteur(Value: TGUID);
  public
    { D�clarations publiques }
    property ID_Emprunteur: TGUID read FID_Emprunteur write SetID_Emprunteur;
    procedure AjouteAlbum(ID_Album, ID_Edition: TGUID);
  end;

var
  FrmSaisie_EmpruntEmprunteur: TFrmSaisie_EmpruntEmprunteur;

implementation

uses DM_Princ, TypeRec, Main, CommonConst, CommonList, Procedures;

{$R *.DFM}

const
  v: array[False..True] of string = ('Retour', 'Pr�t');
  GUID_EditionPasSelectionnee: TGUID = '{888B7D84-401B-4DC2-803A-D38B63ED4BD3}';

const
  TitreListeEmprunts = 'Liste des emprunts';
  NoEmprunts = 'Pas d''emprunts.';
  NotThisEntryHere = 'Impossible d''ajouter ce mouvement dans cette fen�tre';

procedure TFrmSaisie_EmpruntEmprunteur.SetID_Emprunteur(Value: TGUID);
begin
  if IsEqualGUID(Value, FID_Emprunteur) then Exit;
  FID_Emprunteur := Value;
  with TEmprunteur.Create do try
    Fill(Value);
    Label2.Caption := ChaineAffichage;
  finally
    Free;
  end;
end;

procedure TFrmSaisie_EmpruntEmprunteur.FormCreate(Sender: TObject);
begin
  PrepareLV(Self);
  FrameRechercheRapide1.VirtualTreeView := vtAlbums;
  FrameRechercheRapide1.ShowNewButton := False;
  vtAlbums.Mode := vmAlbumsSerie;
  ChargeImage(vtAlbums.Background, 'FONDVT');
  FEditions := TEditionsComplet.Create;
  date_pret.Date := Date;
end;

procedure TFrmSaisie_EmpruntEmprunteur.ListView1SelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  i: Integer;
  PEd: TEdition;
  PA: TAlbum;
  ID_Edition: Integer;
begin
  date_pret.Enabled := Selected;
  pret.Enabled := Selected;
  lccEditions.Enabled := Selected;

  if Selected then begin
    PA := Item.Data;
    date_pret.Date := StrToDateTime(Item.SubItems[0]);
    pret.Checked := Item.SubItems[1] = v[True];
    lccEditions.Items.Clear;
    FEditions.Fill(PA.ID);
    for i := 0 to Pred(FEditions.Editions.Count) do begin
      PEd := FEditions.Editions[i];
      with lccEditions.Items.Add do begin
        Caption := PEd.ChaineAffichage;
        Valeur := i;
      end;
    end;
    lccEditions.DefaultValueChecked := 0;
    ID_Edition := StrToIntDef(Item.SubItems[2], -1);
    if not lccEditions.ValidValue(ID_Edition) then ID_Edition := lccEditions.DefaultValueChecked;
    lccEditions.Value := ID_Edition;
  end;
end;

procedure TFrmSaisie_EmpruntEmprunteur.pretClick(Sender: TObject);
begin
  ListView1.Selected.SubItems[1] := v[pret.Checked];
end;

procedure TFrmSaisie_EmpruntEmprunteur.date_pretChange(Sender: TObject);
begin
  ListView1.Selected.SubItems[0] := FormatDateTime(ShortDateFormat, date_pret.Date);
end;

procedure TFrmSaisie_EmpruntEmprunteur.ToolButton1Click(Sender: TObject);
begin
  MoveListItem(ListView1, -1);
end;

procedure TFrmSaisie_EmpruntEmprunteur.ToolButton4Click(Sender: TObject);
begin
  MoveListItem(ListView1, 1);
end;

procedure TFrmSaisie_EmpruntEmprunteur.AjouteAlbum(ID_Album, ID_Edition: TGUID);
var
  PA: TAlbum;
begin
  try
    if IsEqualGUID(ID_Album, GUID_NULL) or IsEqualGUID(ID_Edition, GUID_NULL) then Exit;
    with ListView1.Items.Add do begin
      PA := TAlbum.Create;
      PA.Fill(ID_Album, GUIDToString(ID_Edition));
      Data := PA;
      Caption := PA.ChaineAffichage;
      SubItems.Add(FormatDateTime(ShortDateFormat, Date));
      SubItems.Add(v[PA.Stock]);
      SubItems.Add(GUIDToString(ID_Edition));
    end;
  except
    AffMessage(Exception(ExceptObject).Message, mtError, [mbOk], True);
  end;
  Frame11.btnOK.Enabled := Bool(ListView1.Items.Count);
end;

procedure TFrmSaisie_EmpruntEmprunteur.ListView1DblClick(Sender: TObject);
var
  PA: TAlbum;
begin
  if Assigned(ListView1.Selected) then begin
    PA := ListView1.Selected.Data;
    PA.Free;
    ListView1.Selected.Delete;
  end;
  Frame11.btnOK.Enabled := Bool(ListView1.Items.Count);
end;

procedure TFrmSaisie_EmpruntEmprunteur.FormDestroy(Sender: TObject);
begin
  TAlbum.VideListe(ListView1);
  FEditions.Free;
end;

procedure TFrmSaisie_EmpruntEmprunteur.BtnOkExecute(Sender: TObject);
var
  i: Integer;
  Edition: TEditionComplete;
begin
  for i := 0 to ListView1.Items.Count - 1 do
    if ListView1.Items[i].SubItems[2] = GUIDToString(GUID_EditionPasSelectionnee) then begin
      ShowMessage('Vous n''avez pas s�lectionn� l''�dition emprunt�e pour '#13#10 + ListView1.Items[i].Caption);
      ModalResult := mrNone;
      Exit;
    end
    else if Utilisateur.Options.AvertirPret and (ListView1.Items[i].SubItems[1] = v[True]) then begin
      Edition := TEditionComplete.Create(StringToGUID(ListView1.Items[i].SubItems[2]));
      try
        if (Edition.Prete) and (MessageDlg(ListView1.Items[i].Caption + #13#13'Cette �dition est d�j� pr�t�e.'#13#10'Continuer?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then begin
          ModalResult := mrNone;
          Exit;
        end;
      finally
        Edition.Free;
      end;
    end;

  for i := 0 to ListView1.Items.Count - 1 do
    AjoutMvt(ID_Emprunteur, StringToGUID(ListView1.Items[i].SubItems[2]), StrToDate(ListView1.Items[i].SubItems[0]), ListView1.Items[i].SubItems[1] = v[True]);
end;

procedure TFrmSaisie_EmpruntEmprunteur.vtAlbumsDblClick(Sender: TObject);
begin
  AjouteAlbum(vtAlbums.CurrentValue, GUID_EditionPasSelectionnee);
end;

procedure TFrmSaisie_EmpruntEmprunteur.lccEditionsChange(Sender: TObject);
begin
  if Assigned(ListView1.Selected) then begin
    ListView1.Selected.SubItems[2] := IntToStr(lccEditions.Value);
  end;
end;

end.

