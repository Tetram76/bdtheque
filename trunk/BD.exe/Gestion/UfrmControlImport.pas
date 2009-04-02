unit UfrmControlImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UframBoutons, UbdtForms, StdCtrls, UframVTEdit, VirtualTree, LoadComplet;

type
  TfrmControlImport = class(TbdtForm)
    framBoutons1: TframBoutons;
    CheckBox1: TCheckBox;
    framVTEdit1: TframVTEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure framVTEdit1VTEditChange(Sender: TObject);
    procedure framVTEdit1btEditClick(Sender: TObject);
    procedure framVTEdit1btNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetMode: TVirtualMode;
    procedure SetMode(const Value: TVirtualMode);
  public
    ObjetImport: TObjetComplet;
    function ShowModalEx: TModalResult;
  published
    property Mode: TVirtualMode read GetMode write SetMode;
  end;

implementation

uses
  Commun, Proc_Gestions;

{$R *.dfm}

procedure TfrmControlImport.FormCreate(Sender: TObject);
begin
  ObjetImport:=nil;
end;

procedure TfrmControlImport.framVTEdit1btEditClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TfrmControlImport.framVTEdit1btNewClick(Sender: TObject);
begin
  ModalResult := mrRetry;
end;

procedure TfrmControlImport.framVTEdit1VTEditChange(Sender: TObject);
begin
  framBoutons1.btnOK.Enabled := not IsEqualGUID(framVTEdit1.CurrentValue, GUID_NULL);
end;

function TfrmControlImport.GetMode: TVirtualMode;
begin
  Result := framVTEdit1.Mode;
end;

procedure TfrmControlImport.SetMode(const Value: TVirtualMode);
begin
  framVTEdit1.Mode := Value;
  case Value of
    vmAlbums,
    vmAlbumsAnnee,
    vmAlbumsCollection,
    vmAlbumsEditeur,
    vmAlbumsGenre,
    vmAlbumsSerie:
      Label3.Caption := 'Album';
    vmCollections:
      Label3.Caption := 'Collection';
    vmEditeurs:
      Label3.Caption := 'Editeur';
    vmGenres:
      Label3.Caption := 'Genre';
    vmPersonnes:
      Label3.Caption := 'Auteur';
    vmSeries:
      Label3.Caption := 'S�rie';
    else
      Label3.Caption := '';
  end;
end;

function TfrmControlImport.ShowModalEx: TModalResult;

  procedure DoEdit(EditProc: TActionGestionModif);
  begin
    if EditProc(framVTEdit1.VTEdit.PopupWindow.TreeView) then
    // on force l'�dit � avoir le nouvel intitul�
      framVTEdit1.CurrentValue := framVTEdit1.CurrentValue;
  end;

  procedure DoAppend(EditProc: TActionGestionAdd);
  begin
    framVTEdit1.CurrentValue := EditProc(framVTEdit1.VTEdit.PopupWindow.TreeView, Label2.Caption, ObjetImport);
  end;

begin
  repeat
    Result := ShowModal;
    case Result of
      mrAbort:
        case Mode of
          vmAlbums,
          vmAlbumsAnnee,
          vmAlbumsCollection,
          vmAlbumsEditeur,
          vmAlbumsGenre,
          vmAlbumsSerie:
            DoEdit(@ModifierAlbums);
          vmCollections:
            DoEdit(@ModifierCollections);
          vmEditeurs:
            DoEdit(@ModifierEditeurs);
          vmGenres:
            DoEdit(@ModifierGenres);
          vmPersonnes:
            DoEdit(@ModifierAuteurs);
          vmSeries:
            DoEdit(@ModifierSeries);
        end;
      mrRetry:
        case Mode of
          vmAlbums,
          vmAlbumsAnnee,
          vmAlbumsCollection,
          vmAlbumsEditeur,
          vmAlbumsGenre,
          vmAlbumsSerie:
            DoAppend(@AjouterAlbums);
          vmCollections:
            DoAppend(@AjouterCollections);
          vmEditeurs:
            DoAppend(@AjouterEditeurs);
          vmGenres:
            DoAppend(@AjouterGenres);
          vmPersonnes:
            DoAppend(@AjouterAuteurs);
          vmSeries:
            DoAppend(@AjouterSeries);
        end;
    end;
  until Result in [mrOk, mrCancel];
end;

end.