unit UfrmEditEditeur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls, VDTButton,
  Buttons, EditLabeled, ShellAPI, LoadComplet, UBdtForms,
  PngSpeedButton, UframBoutons;

type
  TfrmEditEditeur = class(TbdtForm)
    ScrollBox1: TScrollBox;
    Label2: TLabel;
    edNom: TEditLabeled;
    Label1: TLabel;
    edSite: TEditLabeled;
    VDTButton13: TVDTButton;
    Bevel1: TBevel;
    Frame11: TframBoutons;
    procedure FormCreate(Sender: TObject);
    procedure Frame11btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VDTButton13Click(Sender: TObject);
    procedure edSiteChange(Sender: TObject);
  private
    { D�clarations priv�es }
    FEditeur: TEditeurComplet;
    procedure SetEditeur(Value: TEditeurComplet);
    function GetID_Editeur: TGUID;
  public
    { D�clarations publiques }
    property ID_Editeur: TGUID read GetID_Editeur;
    property Editeur: TEditeurComplet read FEditeur write SetEditeur;
  end;

implementation

uses
  Commun, Procedures, Textes;

{$R *.DFM}

procedure TfrmEditEditeur.FormCreate(Sender: TObject);
begin
  PrepareLV(Self);
  FEditeur := nil;
end;

procedure TfrmEditEditeur.SetEditeur(Value: TEditeurComplet);
var
  hg: IHourGlass;
begin
  hg := THourGlass.Create;
  FEditeur := Value;

  edNom.Text := FEditeur.NomEditeur;
  edSite.Text := FEditeur.SiteWeb;
end;

procedure TfrmEditEditeur.Frame11btnOKClick(Sender: TObject);
begin
  if Length(Trim(edNom.Text)) = 0 then begin
    AffMessage(rsNomObligatoire, mtInformation, [mbOk], True);
    edNom.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  FEditeur.NomEditeur := Trim(edNom.Text);
  FEditeur.SiteWeb := Trim(edSite.Text);
  FEditeur.SaveToDatabase;

  ModalResult := mrOk;
end;

procedure TfrmEditEditeur.FormShow(Sender: TObject);
begin
  edNom.SetFocus;
end;

procedure TfrmEditEditeur.VDTButton13Click(Sender: TObject);
begin
  ShellExecute(Application.DialogHandle, nil, PChar(edSite.Text), nil, nil, SW_NORMAL);
end;

procedure TfrmEditEditeur.edSiteChange(Sender: TObject);
begin
  VDTButton13.Enabled := CompareMem(PChar(LowerCase(Trim(edSite.Text))), PChar('http://'), 7);
end;

function TfrmEditEditeur.GetID_Editeur: TGUID;
begin
  Result := FEditeur.ID_Editeur;
end;

end.
