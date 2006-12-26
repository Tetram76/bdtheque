unit Form_EditCritere;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Fram_Boutons, StdCtrls, DBCtrls, Form_Recherche,
  ActnList, DBEditLabeled, ComboCheck, ComCtrls, LoadComplet;

type
  TFrmEditCritere = class(TForm)
    champs: TLightComboCheck;
    signes: TLightComboCheck;
    valeur: TEditLabeled;
    Frame11: TFrame1;
    Critere2: TLightComboCheck;
    ActionList1: TActionList;
    ActOk: TAction;
    procedure FormCreate(Sender: TObject);
    procedure champsChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActOkExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { D�clarations priv�es }
    wMin, WMax: Integer;
    FRecherche: TFrmRecherche;
    FChampValeurs: TStringList;
    FCritere: TCritere;
    procedure SetCritere(Value: TCritere);
    function GetCritere: TCritere;
  public
    { D�clarations publiques }
    property Critere: TCritere read GetCritere write SetCritere;
  end;

implementation

uses JvUIB, DM_Commun, Commun, DM_Princ, JvUIBLib, Divers;

{$R *.DFM}

type
  TChampSpecial = (csNone, csTitre, csGenre, csAffiche, csEtat, csReliure, csOrientation, csFormatEdition, csTypeEdition);

  TChamp = class
    NomChamp: string;
    NomTable: string;
    TypeData: TUIBFieldType;
    Booleen: Boolean;
    Special: TChampSpecial;
  end;

function TFrmEditCritere.GetCritere: TCritere;
var
  Champ: TChamp;
  critereTexte: string;
begin
  Result := FCritere;

  Champ := TChamp(champs.LastItemData);

  Result.iChamp := champs.Value;
  Result.iCritere2 := Critere2.Value;
  Result.iSignes := signes.Value;
  Result.valeurText := valeur.Text;
  if Champ.Special = csGenre then
    Result.valeurText := FChampValeurs[Result.iCritere2];
  Result.NomTable := Champ.NomTable;
  Result.TestSQL := Champ.NomTable + '.' + Champ.NomChamp;
  critereTexte := UpperCase(SansAccents(valeur.Text));
  case Champ.Special of
    csGenre:
      case Result.iSignes of
        0: // Indiff�rent
          Result.TestSQL := Result.TestSQL + ' IS NOT NULL';
        1: // est
          Result.TestSQL := Result.TestSQL + '=' + QuotedStr(critereTexte);
        2: // n'est pas
          Result.TestSQL := Result.TestSQL + '<>' + QuotedStr(critereTexte);
      end;
    csEtat, csReliure, csOrientation, csFormatEdition, csTypeEdition:
      case Result.iSignes of
        0: // Indiff�rent
          Result.TestSQL := Result.TestSQL + ' IS NOT NULL';
        1: // est
          Result.TestSQL := Result.TestSQL + '=' + IntToStr(Result.iCritere2);
        2: // n'est pas
          Result.TestSQL := Result.TestSQL + '<>' + IntToStr(Result.iCritere2);
      end;
    csAffiche:
      case Result.iSignes of
        1: // Oui
          Result.TestSQL := Result.TestSQL + ' IS NOT NULL';
        2: // Non
          Result.TestSQL := Result.TestSQL + ' IS NULL';
        3: // Valide
          Result.TestSQL := 'UDF_AFFICHEVALIDE(' + Result.TestSQL + ')';
        4: // (renseign�e mais) Non valide
          Result.TestSQL := 'NOT UDF_AFFICHEVALIDE(' + Result.TestSQL + ')';
      end;
    csTitre:
      case Result.iSignes of
        1: // Vide ou contient
          Result.TestSQL := Format('(%s IS NULL OR %s CONTAINING %s)', [Champ.NomTable + '.UPPER' + Champ.NomChamp, Champ.NomTable + '.UPPER' + Champ.NomChamp, QuotedStr(critereTexte)]);
        2: // Contient
          Result.TestSQL := Format('%s CONTAINING %s', [Champ.NomTable + '.UPPER' + Champ.NomChamp, QuotedStr(critereTexte)]);
        3: // Ne contient pas
          Result.TestSQL := Format('NOT (%s CONTAINING %s)', [Champ.NomTable + '.UPPER' + Champ.NomChamp, QuotedStr(critereTexte)]);
        4: // Ressemble
          Result.TestSQL := Format('%s CONTAINING UDF_SOUNDEX(%s, %d)', [Champ.NomTable + '.SOUNDEX' + Champ.NomChamp, QuotedStr(critereTexte), Integer(Result.iCritere2)]);
        5: // Ne ressemble pas
          Result.TestSQL := Format('NOT (%s CONTAINING UDF_SOUNDEX(%s, %d))', [Champ.NomTable + '.SOUNDEX' + Champ.NomChamp, QuotedStr(critereTexte), Integer(Result.iCritere2)]);
      end;
    else
      case Champ.TypeData of
        uftInteger, uftSmallInt, uftFloat, uftNumeric:
          if Champ.Booleen then
            case Result.iSignes of
              1: Result.TestSQL := Result.TestSQL + '=1';
              2: Result.TestSQL := Result.TestSQL + '=0';
              3: Result.TestSQL := Format('(%s=1 OR %s IS NULL)', [Result.TestSQL, Result.TestSQL]);
              4: Result.TestSQL := Format('(%s=0 OR %s IS NULL)', [Result.TestSQL, Result.TestSQL]);
              5: Result.TestSQL := Result.TestSQL + ' IS NULL';
            end
          else
            Result.TestSQL := Result.TestSQL + signes.Caption + StringReplace(valeur.Text, DecimalSeparator, '.', []);
        uftChar, uftVarchar, uftBlob:
          case Result.iSignes of
            1: // Vide ou contient
              Result.TestSQL := Format('(%s IS NULL OR %s CONTAINING %s)', [Result.TestSQL, Result.TestSQL, QuotedStr(critereTexte)]);
            2: // Contient
              Result.TestSQL := Format('%s CONTAINING %s', [Result.TestSQL, QuotedStr(critereTexte)]);
            3: // Ne contient pas
              Result.TestSQL := Format('NOT (%s CONTAINING %s)', [Result.TestSQL, QuotedStr(critereTexte)]);
          end;
        uftDate:
          Result.TestSQL := Result.TestSQL + signes.Caption + QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(valeur.Text)));
        else
          Result.TestSQL := '';
      end;
  end;
  Result.Champ := champs.Caption;
  Result.Test := signes.Caption;
  if Critere2.Visible and Critere2.Enabled then Result.Test := Result.Test + ' (' + Critere2.Caption + ')';
  if valeur.Visible then Result.Test := Result.Test + ' ' + valeur.Text;
end;

procedure TFrmEditCritere.SetCritere(Value: TCritere);
begin
  FCritere.Assign(Value);
  champs.Value := FCritere.iChamp;
  champsChange(champs);
  signes.Value := FCritere.iSignes;
  valeur.Text := FCritere.valeurText;
  if Critere2.Visible and Critere2.Enabled then Critere2.Value := FCritere.iCritere2;
end;

type
  TCrackWinControl = class(TWinControl)
  end;

procedure TFrmEditCritere.FormCreate(Sender: TObject);
const
  ListTables: array[0..2] of string = ('SERIES', 'ALBUMS', 'EDITIONS');
  NomTables: array[0..2] of string = ('S�rie', 'Album', 'Edition');
var
  i, j: Integer;
  t: string;
  pt: TPoint;
  Table1, Desc, LstChamps: TJvUIBQuery;
  p: TChamp;
  hg: IHourGlass;
  ParentItem: TSubItem;
begin
  hg := THourGlass.Create;
  FRecherche := TFrmRecherche(Owner);
  FChampValeurs := TStringList.Create;
  FCritere := TCritere.Create(nil);
  pt := FRecherche.ClientToScreen(Point((FRecherche.Width - Width) div 2, (FRecherche.Height - Height) div 2));
  SetBounds(pt.x, pt.y, Width, Height);
  wMin := signes.Width;
  wMax := Critere2.Left + Critere2.Width - signes.Left;
  Table1 := TJvUIBQuery.Create(Self);
  Desc := TJvUIBQuery.Create(Self);
  LstChamps := TJvUIBQuery.Create(Self);
  champs.Items.Clear;
  with Table1 do
  try
    Transaction := GetTransaction(DMPrinc.UIBDataBase);
    for j := Low(ListTables) to High(ListTables) do
    begin
      Close;
      SQL.Text := 'SELECT FIRST 0 SKIP 0 * FROM ' + ListTables[j];
      Open;
      ParentItem := champs.Items.Add(NomTables[j]);
      for i := 0 to Fields.FieldCount - 1 do
      begin
        t := FRecherche.TransChamps(Fields.SqlName[i]);
        if (t <> '') then
        begin
          p := TChamp.Create;
          p.NomChamp := UpperCase(Fields.SqlName[i]);
          p.NomTable := ListTables[j];
          p.TypeData := Fields.FieldType[i];
          p.Booleen := (p.TypeData = uftSmallInt) and FRecherche.IsValChampBoolean(FRecherche.ValChamps(t));
          case FRecherche.ValChamps(t) of
            1, 8: p.Special := csTitre;
            21: p.Special := csEtat;
            22: p.Special := csReliure;
            24: p.Special := csOrientation;
            25: p.Special := csFormatEdition;
            26: p.Special := csTypeEdition;
            else
              p.Special := csNone;
          end;
          with ParentItem.SubItems.Add(t) do
          begin
            Valeur := FRecherche.ValChamps(t);
            Data := TObject(p);
          end;
        end;
      end;
      case j of
        0:
          begin
            p := TChamp.Create;
            p.NomChamp := 'ID_Genre';
            p.NomTable := 'GENRESERIES';
            p.TypeData := uftChar;
            p.Special := csGenre;
            with ParentItem.SubItems.Add(FRecherche.TransChamps('genreserie')) do
            begin
              Valeur := FRecherche.ValChamps(Caption);
              Data := TObject(p);
            end;
          end;
      end;
    end;
  finally
    Transaction.Free;
    Free;
    LstChamps.Free;
    Desc.Free;
  end;
end;

procedure TFrmEditCritere.champsChange(Sender: TObject);

  procedure AssignItems(Items: TItems; Source: TJvUIBQuery; ChampValeurs: TStrings); overload;
  begin
    try
      Source.Transaction := GetTransaction(DMPrinc.UIBDataBase);
      Items.Clear;
      FChampValeurs.Clear;
      Source.Open;
      while not Source.Eof do
      begin
        with Items.Add do
        begin
          Caption := Source.Fields.AsString[1];
          Valeur := Index;
          ChampValeurs.Add(Source.Fields.AsString[0]);
        end;
        Source.Next;
      end;
      Source.Close;
    finally
      Source.Transaction.Free;
    end;
  end;

  procedure AssignItems(Items: TItems; Source: TJvUIBQuery); overload;
  begin
    try
      Source.Transaction := GetTransaction(DMPrinc.UIBDataBase);
      Items.Clear;
      FChampValeurs.Clear;
      Source.Open;
      while not Source.Eof do
      begin
        with Items.Add do
        begin
          Caption := Source.Fields.AsString[1];
          Valeur := Source.Fields.AsInteger[0];
        end;
        Source.Next;
      end;
      Source.Close;
    finally
      Source.Transaction.Free;
    end;
  end;

  procedure AssignItems(Items: TStrings; Source: TJvUIBQuery); overload;
  begin
    try
      Source.Transaction := GetTransaction(DMPrinc.UIBDataBase);
      Items.Clear;
      Source.Open;
      while not Source.Eof do
      begin
        Items.AddObject(Source.Fields.AsString[1], Pointer(Source.Fields.AsInteger[0]));
        Source.Next;
      end;
      Source.Close;
    finally
      Source.Transaction.Free;
    end;
  end;

begin
  valeur.Text := '';
  signes.Items.Clear;
  Critere2.Items.Clear;
  signes.Tag := 0;
  case TChamp(champs.LastItemData).Special of
    csTitre:
      begin
        AssignItems(signes.Items, DataCommun.TCritereTitre);
        AssignItems(Critere2.Items, DataCommun.TCritereLangueTitre);
        signes.Tag := 1;
        valeur.Visible := True;
      end;
    csGenre:
      begin
        AssignItems(signes.Items, DataCommun.TCritereListe);
        AssignItems(Critere2.Items, DataCommun.TGenre, FChampValeurs);
        valeur.Visible := False;
        signes.Tag := 2;
      end;
    csAffiche:
      begin
        AssignItems(signes.Items, DataCommun.TCritereAffiche);
        valeur.Visible := False;
      end;
    csEtat:
      begin
        AssignItems(signes.Items, DataCommun.TCritereListe);
        AssignItems(Critere2.Items, DataCommun.TCritereEtat);
        signes.Tag := 2;
        valeur.Visible := False;
      end;
    csReliure:
      begin
        AssignItems(signes.Items, DataCommun.TCritereListe);
        AssignItems(Critere2.Items, DataCommun.TCritereReliure);
        signes.Tag := 2;
        valeur.Visible := False;
      end;
    else
      case TChamp(champs.LastItemData).TypeData of
        uftChar, uftVarchar, uftBlob:
          begin
            AssignItems(signes.Items, DataCommun.TCritereString);
            valeur.Visible := True;
          end;
        uftSmallInt, uftInteger, uftFloat, uftNumeric:
          if TChamp(champs.LastItemData).Booleen then
          begin
            AssignItems(signes.Items, DataCommun.TCritereBoolean);
            valeur.Visible := False;
          end
          else
          begin
            AssignItems(signes.Items, DataCommun.TCritereNumeral);
            valeur.Visible := True;
          end;
        uftDate, uftTime, uftTimestamp:
          begin
            AssignItems(signes.Items, DataCommun.TCritereNumeral);
            valeur.Visible := True;
          end;
      end;
  end;
  if valeur.Visible then
    case TChamp(champs.LastItemData).TypeData of
      uftChar, uftVarchar, uftBlob: valeur.TypeDonnee := tdChaine;
      uftSmallInt, uftInteger: valeur.TypeDonnee := tdEntierSigne;
      uftFloat, uftNumeric: valeur.TypeDonnee := tdNumericSigne;
      uftDate: valeur.TypeDonnee := tdDate;
      uftTime: valeur.TypeDonnee := tdHeure;
      uftTimestamp: valeur.TypeDonnee := tdDateHeure;
    end;
  signes.Visible := Bool(signes.Items.Count);
  if signes.Visible then signes.Checked := False;
  Critere2.Visible := Bool(Critere2.Items.Count);
  if Critere2.Visible then Critere2.Checked := False;
  signes.Width := IIf(Critere2.Visible, wMin, wMax);
end;

procedure TFrmEditCritere.FormDestroy(Sender: TObject);
var
  i, j: Integer;
begin
  champs.Items.BeginUpdate;
  try
    for i := 0 to Pred(champs.Items.Count) do
      for j := 0 to Pred(champs.Items[i].SubItems.Count) do
        TChamp(champs.Items[i].SubItems[j].Data).Free;
  finally
    champs.Items.EndUpdate;
  end;
  FChampValeurs.Free;
  FCritere.Free;
end;

procedure TFrmEditCritere.ActOkExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmEditCritere.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
begin
  Critere2.Enabled := Critere2.Visible
    and (
    ((signes.Tag = 1 {DataCommun.TCritereTitre}) and (signes.Checked) and (signes.Value in [4..5]))
    or ((signes.Tag = 2 {DataCommun.TCritereListe}) and (signes.Checked) and (signes.Value >= 0))
    );
  ActOk.Enabled := (champs.Checked)
    and (signes.Checked)
    and (not valeur.Visible or (valeur.Text <> ''))
    and (not Critere2.Visible or (not Critere2.Enabled) or (Critere2.Checked));
end;

end.

