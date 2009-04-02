unit UfrmScripts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditHighlighter, SynHighlighterPas, SynEdit, ImgList, StrUtils,
  uPSComponent, uPSDebugger, SynEditMiscClasses, SynEditSearch, StdActns, ActnList, uPSDisassembly,
  Menus, SynEditTypes, ComCtrls, uPSCompiler, UScriptUtils, uPSUtils,
  uPSRuntime, VirtualTrees, StdCtrls, ExtCtrls, uPSI_BdtkRegEx, LoadComplet,
  SynEditKeyCmds, uPSI_BdtkObjects, SynCompletionProposal, UBdtForms, IDHashMap, uPSComponent_COM,
  uPSComponent_Default, Generics.Collections;

type
  TSynDebugPlugin = class(TSynEditPlugin)
  private
    FDebug: TDebugInfos;
  protected
    procedure AfterPaint(ACanvas: TCanvas; const AClip: TRect; FirstLine, LastLine: Integer); override;
    procedure LinesInserted(FirstLine, Count: Integer); override;
    procedure LinesDeleted(FirstLine, Count: Integer); override;
  public
    constructor Create(AOwner: TCustomSynEdit; Debug: TDebugInfos); reintroduce;
  end;

  TInfoScript = class
  private
    FTabSheet: TTabSheet;
    FEditor: TSynEdit;
    FSB: TStatusBar;
    FFileName: string;
    FScriptName: AnsiString;
  end;

  TInfosScripts = class(TObjectList<TInfoScript>)
    function InfoScript(Index: Integer): TInfoScript; overload;
    function InfoScript(TabSheet: TTabSheet): TInfoScript; overload;
    function InfoScript(Editor: TSynEdit): TInfoScript; overload;
    function InfoScriptByScriptName(const Script: AnsiString): TInfoScript;

    function ScriptName(Index: Integer): AnsiString; overload;
    function ScriptName(TabSheet: TTabSheet): AnsiString; overload;
    function ScriptName(Editor: TSynEdit): AnsiString; overload;

    function ScriptFileName(Index: Integer): string; overload;
    function ScriptFileName(TabSheet: TTabSheet): string; overload;
    function ScriptFileName(Editor: TSynEdit): string; overload;

    function EditorByIndex(Index: Integer): TSynEdit;
    function EditorByScriptName(const Script: AnsiString): TSynEdit;
  end;

  TfrmScripts = class(TbdtForm)
    SynPasSyn1: TSynPasSyn;
    lstDebugImages: TImageList;
    PSScriptDebugger1: TPSScriptDebugger;
    SynEditSearch1: TSynEditSearch;
    ActionList1: TActionList;
    EditCut1: TAction;
    EditCopy1: TAction;
    EditPaste1: TAction;
    EditSelectAll1: TAction;
    EditUndo1: TAction;
    SearchFind1: TAction;
    SearchFindNext1: TAction;
    MainMenu1: TMainMenu;
    Edition1: TMenuItem;
    Remplacer1: TMenuItem;
    Chercher1: TMenuItem;
    N2: TMenuItem;
    Coller1: TMenuItem;
    Copier1: TMenuItem;
    Couper1: TMenuItem;
    N3: TMenuItem;
    Dfaire1: TMenuItem;
    Copier2: TMenuItem;
    outslectionner1: TMenuItem;
    SearchReplace1: TAction;
    EditRedo1: TAction;
    Refaire1: TMenuItem;
    Chercher2: TMenuItem;
    actRun: TAction;
    actCompile: TAction;
    actStepOver: TAction;
    actStepInto: TAction;
    actReset: TAction;
    actDecompile: TAction;
    a1: TMenuItem;
    actBreakpoint: TAction;
    N4: TMenuItem;
    Basculerpointdarrt1: TMenuItem;
    actAddSuivi: TAction;
    actAddSuivi1: TMenuItem;
    actRunToCursor: TAction;
    Jusquaucurseur1: TMenuItem;
    PSImport_DateUtils1: TPSImport_DateUtils;
    PSImport_Classes1: TPSImport_Classes;
    PSImport_ComObj1: TPSImport_ComObj;
    PSDllPlugin1: TPSDllPlugin;
    PopupMenu1: TPopupMenu;
    actFermer: TAction;
    actEnregistrer: TAction;
    actEnregistrerSous: TAction;
    Fermer1: TMenuItem;
    N6: TMenuItem;
    Enregistrer1: TMenuItem;
    Enregistrersous1: TMenuItem;
    PageControl2: TPageControl;
    tbEdition: TTabSheet;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    vstMessages: TVirtualStringTree;
    TabSheet2: TTabSheet;
    vstSuivis: TVirtualStringTree;
    TabSheet3: TTabSheet;
    vstBreakpoints: TVirtualStringTree;
    TabSheet6: TTabSheet;
    Output: TMemo;
    pcScripts: TPageControl;
    tbScripts: TTabSheet;
    ListView1: TListView;
    actRunWithoutDebug: TAction;
    Excutersansdbuguer1: TMenuItem;
    SynEditParamShow: TSynCompletionProposal;
    SynEditAutoComplete: TSynCompletionProposal;
    procedure seScript1GutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
    procedure seScript1GutterPaint(Sender: TObject; aLine, X, Y: Integer);
    procedure seScript1SpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
    procedure seScript1StatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure SearchFind1Execute(Sender: TObject);
    procedure SearchFindNext1Execute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure EditCut1Execute(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure EditPaste1Execute(Sender: TObject);
    procedure EditSelectAll1Execute(Sender: TObject);
    procedure EditUndo1Execute(Sender: TObject);
    procedure EditRedo1Execute(Sender: TObject);
    procedure seScript1ReplaceText(Sender: TObject; const ASearch, AReplace: string; Line, Column: Integer; var Action: TSynReplaceAction);
    procedure PSScriptDebugger1Execute(Sender: TPSScript);
    procedure actCompileExecute(Sender: TObject);
    procedure actRunExecute(Sender: TObject);
    procedure PSScriptDebugger1Compile(Sender: TPSScript);
    procedure PSScriptDebugger1Breakpoint(Sender: TObject; const FileName: AnsiString; Position, Row, Col: Cardinal);
    procedure PSScriptDebugger1Idle(Sender: TObject);
    procedure PSScriptDebugger1AfterExecute(Sender: TPSScript);
    procedure PSScriptDebugger1LineInfo(Sender: TObject; const FileName: AnsiString; Position, Row, Col: Cardinal);
    function PSScriptDebugger1NeedFile(Sender: TObject; const OrginFileName: AnsiString; var FileName, Output: AnsiString): Boolean;
    procedure actStepOverExecute(Sender: TObject);
    procedure actStepIntoExecute(Sender: TObject);
    procedure actResetExecute(Sender: TObject);
    procedure actDecompileExecute(Sender: TObject);
    procedure actBreakpointExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddSuiviExecute(Sender: TObject);
    procedure actRunToCursorExecute(Sender: TObject);
    procedure vstSuivisNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: String);
    procedure vstSuivisEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure vstSuivisInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vstSuivisChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vstSuivisGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure vstSuivisPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure vstMessagesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure vstMessagesDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure seScript1Change(Sender: TObject);
    procedure vstBreakpointsDblClick(Sender: TObject);
    procedure vstBreakpointsChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vstBreakpointsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure vstBreakpointsInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vstBreakpointsPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure seScript1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure actFermerExecute(Sender: TObject);
    procedure actEnregistrerExecute(Sender: TObject);
    procedure actEnregistrerSousExecute(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure seScript1ProcessUserCommand(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: Pointer);
    procedure actRunWithoutDebugExecute(Sender: TObject);
    procedure pcScriptsChange(Sender: TObject);
    procedure SynEditParamShowExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure SynEditAutoCompleteExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
    procedure seScript1KeyPress(Sender: TObject; var Key: Char);
  private
    { D�clarations priv�es }
    FLastSearch, FLastReplace: string;
    FSearchOptions: TSynSearchOptions;
    FActiveLine, FRunToCursor, FErrorLine: Cardinal;
    FActiveFile, FRunToCursorFile, FErrorFile: AnsiString;
    FDebugPlugin: TDebugInfos;
    FCompiled: Boolean;
    FPSImport_RegExpr: TPSImport_BdtkRegEx;
    FPSImport_BdtkObjects: TPSImport_BdtkObjects;
    FProjetOuvert: Boolean;
    FForceClose: Boolean;
    FAlbumToImport: TAlbumComplet;
    FListTypesImages: TStringList;

    fObjectList: TParamInfoArray;
    fTypeInfos: TIDHashMap;

    FInfoScripts: TInfosScripts;

    {$REGION 'Ex�cution'}
    procedure SetResultat(const Chaine: string);
    function Compile: Boolean;
    function Execute: Boolean;
    function GetVariableValue(const VarName: AnsiString; Actif: Boolean): AnsiString;
    function GetVar(const Name: AnsiString; out s: AnsiString): PIFVariant;
    {$ENDREGION}
    procedure WMSyscommand(var msg: TWmSysCommand); message WM_SYSCOMMAND;
    {$REGION 'D�buggage'}
    procedure GoToPosition(Editor: TSynEdit; Line, Char: Cardinal);
    procedure GoToMessage(Msg: TMessageInfo);
    procedure GoToBreakpoint(Msg: TBreakpointInfo);
    procedure ToggleBreakPoint(const Script: AnsiString; Line: Cardinal; Keep: Boolean);
    {$ENDREGION}
    function GetFullNameScript(const Script: AnsiString): string;
    function GetScript(const Script: AnsiString): TSynEdit;
    function GetActiveScript: TSynEdit;
    function CorrectScriptName(const Script: AnsiString): AnsiString;
    function TranslatePositionEx(out Proc, Position: Cardinal; Row: Cardinal; Fn: AnsiString): Boolean;
    procedure SetCompiled(const Value: Boolean);
    function GetProjet: AnsiString;
    procedure SetProjet(const Value: AnsiString);
    procedure LoadScript(const Script: AnsiString);
    procedure ClearPages;
    function GetScriptLines(const Script: AnsiString; out Output: AnsiString): Boolean;
    procedure SetProjetOuvert(const Value: Boolean);
    {$REGION 'Auto completion'}
    procedure RebuildLokalObjektList;
    procedure BuildLokalObjektList(Comp: TPSPascalCompiler);
    function FindParameter(LocLine: AnsiString; X: Integer; out Func: TParamInfoRecord; out ParamCount: Integer): Boolean;
    function GetLookUpString(Line: AnsiString; EndPos: Integer): AnsiString;
    function LookUpList(LookUp: AnsiString; var ParamInfo: TParamInfoRecord): Boolean; overload;
    function LookUpList(LookUp: Cardinal; var ParamInfo: TParamInfoRecord): Boolean; overload;
    procedure FillAutoComplete(var List: TParamInfoArray; Types: TInfoTypes; FromFather: Cardinal = 0; Typ: AnsiString = '');
    {$ENDREGION}
  public
    { D�clarations publiques }
    property Compiled: Boolean read FCompiled write SetCompiled;
    property Projet: AnsiString read GetProjet write SetProjet;
    property ProjetOuvert: Boolean read FProjetOuvert write SetProjetOuvert;
  end;

var
  frmScripts: TfrmScripts;

implementation

{$R *.dfm}

uses
  AnsiStrings, UfrmScriptSearch, UScriptsFonctions, CommonConst, uPSPreProcessor,
  Procedures, BdtkRegEx, Commun, Divers;

type
  PPositionData = ^TPositionData;

  TPositionData = packed record
    FileName: AnsiString;
    Position,
    Row,
    Col,
    SourcePosition: Cardinal;
  end;
  PFunctionInfo = ^TFunctionInfo;

  TFunctionInfo = packed record
    Func: TPSProcRec;
    FParamNames: TIfStringList;
    FVariableNames: TIfStringList;
    FPositionTable: TIfList;
  end;

  TCrackPSDebugExec = class(TPSDebugExec)
  end;

{$REGION 'TSynDebugPlugin'}
procedure TSynDebugPlugin.AfterPaint(ACanvas: TCanvas; const AClip: TRect; FirstLine, LastLine: Integer);
begin
  inherited;
end;

constructor TSynDebugPlugin.Create(AOwner: TCustomSynEdit; Debug: TDebugInfos);
begin
  inherited Create(AOwner);
  FDebug := Debug;
end;

procedure TSynDebugPlugin.LinesDeleted(FirstLine, Count: Integer);
var
  i: Integer;
begin
  inherited;
  for i := Pred(FDebug.Breakpoints.Count) downto 0 do
    if FDebug.Breakpoints[i].Line in [FirstLine..FirstLine + Count] then
      FDebug.Breakpoints.Delete(i)
    else if FDebug.Breakpoints[i].Line > Cardinal(FirstLine) then
    begin
      Editor.InvalidateGutterLine(FDebug.Breakpoints[i].Line);
      FDebug.Breakpoints[i].Line := FDebug.Breakpoints[i].Line - Cardinal(Count);
    end;

  for i := Pred(FDebug.Messages.Count) downto 0 do
    if FDebug.Messages[i].Line in [FirstLine..FirstLine + Count] then
      FDebug.Messages.Delete(i)
    else if FDebug.Messages[i].Line > Cardinal(FirstLine) then
      FDebug.Messages[i].Line := FDebug.Messages[i].Line - Cardinal(Count);
end;

procedure TSynDebugPlugin.LinesInserted(FirstLine, Count: Integer);
var
  i: Integer;
begin
  inherited;
  for i := 0 to FDebug.Breakpoints.Count - 1 do
    if FDebug.Breakpoints[i].Line >= Cardinal(FirstLine) then
    begin
      Editor.InvalidateGutterLine(FDebug.Breakpoints[i].Line);
      FDebug.Breakpoints[i].Line := FDebug.Breakpoints[i].Line + Cardinal(Count);
    end;
  for i := 0 to FDebug.Messages.Count - 1 do
    if FDebug.Messages[i].Line >= Cardinal(FirstLine) then
    begin
      Editor.InvalidateGutterLine(FDebug.Messages[i].Line);
      FDebug.Messages[i].Line := FDebug.Messages[i].Line + Cardinal(Count);
    end;
end;

{$ENDREGION}

{$REGION 'TInfosScripts'}

function TInfosScripts.ScriptName(Index: Integer): AnsiString;
var
  info: TInfoScript;
begin
  info := InfoScript(Index);
  if Assigned(info) then
    Result := info.FScriptName
  else
    Result := '';
end;

function TInfosScripts.ScriptName(TabSheet: TTabSheet): AnsiString;
var
  info: TInfoScript;
begin
  info := InfoScript(TabSheet);
  if Assigned(info) then
    Result := info.FScriptName
  else
    Result := '';
end;

function TInfosScripts.ScriptName(Editor: TSynEdit): AnsiString;
var
  info: TInfoScript;
begin
  info := InfoScript(Editor);
  if Assigned(info) then
    Result := info.FScriptName
  else
    Result := '';
end;

function TInfosScripts.ScriptFileName(Index: Integer): string;
var
  info: TInfoScript;
begin
  info := InfoScript(Index);
  if Assigned(info) then
    Result := info.FFileName
  else
    Result := '';
end;

function TInfosScripts.ScriptFileName(TabSheet: TTabSheet): string;
var
  info: TInfoScript;
begin
  info := InfoScript(TabSheet);
  if Assigned(info) then
    Result := info.FFileName
  else
    Result := '';
end;

function TInfosScripts.ScriptFileName(Editor: TSynEdit): string;
var
  info: TInfoScript;
begin
  info := InfoScript(Editor);
  if Assigned(info) then
    Result := info.FFileName
  else
    Result := '';
end;

function TInfosScripts.InfoScript(Index: Integer): TInfoScript;
begin
  if (Index >= 0) and (Index <= Count - 1) then
    Result := Items[Index]
  else
    Result := nil;
end;

function TInfosScripts.InfoScript(TabSheet: TTabSheet): TInfoScript;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Pred(Count) do
    if Items[i].FTabSheet = TabSheet then
    begin
      Result := Items[i];
      Exit;
    end;
end;

function TInfosScripts.InfoScript(Editor: TSynEdit): TInfoScript;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Pred(Count) do
    if Items[i].FEditor = Editor then
    begin
      Result := Items[i];
      Exit;
    end;
end;

function TInfosScripts.InfoScriptByScriptName(const Script: AnsiString): TInfoScript;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Pred(Count) do
    if AnsiSameText(Items[i].FScriptName, Script) then
    begin
      Result := Items[i];
      Exit;
    end;
end;

function TInfosScripts.EditorByIndex(Index: Integer): TSynEdit;
var
  info: TInfoScript;
begin
  info := InfoScript(Index);
  if Assigned(info) then
    Result := info.FEditor
  else
    Result := nil;
end;

function TInfosScripts.EditorByScriptName(const Script: AnsiString): TSynEdit;
var
  info: TInfoScript;
begin
  info := InfoScriptByScriptName(Script);
  if Assigned(info) then
    Result := info.FEditor
  else
    Result := nil;
end;

function TfrmScripts.GetScript(const Script: AnsiString): TSynEdit;
begin
  if Script = '' then
    Result := FInfoScripts.EditorByScriptName(Projet)
  else
    Result := FInfoScripts.EditorByScriptName(Script);
end;

function TfrmScripts.GetActiveScript: TSynEdit;
begin
  Result := FInfoScripts.EditorByIndex(pcScripts.ActivePageIndex);
end;

{$ENDREGION}

{$REGION 'Auto completion'}
function AutoCompleteCompilerBeforeCleanUp(Sender: TPSPascalCompiler): Boolean;
var
  s: AnsiString;
begin
  with TPSScriptDebugger(Sender.ID) do
    if comp.GetOutput(s) then
      TfrmScripts(Owner).BuildLokalObjektList(Sender);
  Result := True;
end;

procedure TfrmScripts.BuildLokalObjektList(Comp: TPSPascalCompiler);
var
  Dummy: Integer;
  VDummy: Integer;
  Info: TParamInfoRecord;
  Typ: TPSType;
  RegProc: TPSRegProc;
  Proc: TPSProcedure;
  ProcInt: TPSInternalProcedure;
  con: TPSConstant;
  Father: Cardinal;

  procedure ClearInfoRec;
  begin
    Info.Name := 0;
    Info.OrgName := '';
    Info.Params := '';
    Info.OrgParams := '';
    Info.Father := 0;
    Info.ReturnTyp := 0;
    Info.HasFields := false;
    Info.SubType := 0;
  end;

  procedure AddTypeInfo(Hash: Cardinal; BaseType: Integer);
  begin
    fTypeInfos.InsertID(Hash, BaseType);
  end;

  procedure AddInfo(var Info: TParamInfoRecord);
  begin
    if (Length(Info.OrgName) < 1) or CharInSet(Info.OrgName[1], ['!', ' ', '_']) then
    begin
      ClearInfoRec;
      exit;
    end;

    Info.Name := HashString(Info.OrgName);
    SetLength(fObjectList, Length(fObjectList) + 1);
    fObjectList[high(fObjectList)] := Info;
    ClearInfoRec;
  end;

  function TypHasField(Typ: TPSType): Boolean;
  begin
    result := (Typ is TPSClassType) or (Typ is TPSRecordType);
  end;

  procedure AddVar(Name: AnsiString; Typ: TPSType; InfoType: TInfoType = itVar); overload;
  begin
    Info.OrgName := Name;

    Info.OrgParams := ': ' + GetTypeName(Typ);
    Info.ReturnTyp := HashString(GetTypeName(Typ));
    Info.HasFields := TypHasField(Typ);
    Info.typ := itVar;
    AddInfo(Info);
  end;

  procedure AddVar(Vari: TPSVar); overload;
  begin
    if Vari.ClassType = TPSVar then
      AddVar(Vari.OrgName, Vari.aType)
    else
      AddVar(Vari.Name, Vari.aType);
  end;

  procedure SetParams(var Info: TParamInfoRecord; Parameters: TPSParametersDecl);
  var
    Params: AnsiString;
  begin
    Info.OrgParams := GetParams(Parameters);
    Params := GetParams(Parameters, '"');

    Params := AnsiString(Copy(string(Params), AnsiStrings.AnsiPos('(', Params) + 1, Length(Params)));
    Params := AnsiString(Copy(string(Params), 1, AnsiStrings.AnsiPos(')', Params) - 1));
    Params := AnsiStrings.StringReplace(Params, ';', ',', [rfReplaceAll]);

    Info.Params := Params;
  end;

  procedure AddProcedure(Name: AnsiString; Parameters: TPSParametersDecl);
  begin
    Info.OrgName := Name;

    SetParams(Info, Parameters);

    if Parameters.Result = nil then
      info.Typ := itProcedure
    else
    begin
      info.Typ := itFunction;
      info.ReturnTyp := HashString(GetTypeName(Parameters.Result));
      Info.HasFields := TypHasField(Parameters.result);
    end;

    AddInfo(Info);
  end;

begin
  SetLength(fObjectList, 0);
  fTypeInfos.ClearList;
  ClearInfoRec;
  // Lokale Variablen
  for Dummy := 1 to Comp.GetProcCount - 1 do
  begin
    Proc := Comp.GetProc(Dummy);
    if Proc is TPSInternalProcedure then
    begin
      ProcInt := TPSInternalProcedure(Proc);
      for VDummy := 0 to ProcInt.ProcVars.Count - 1 do
      begin
        AddVar(TPSVar(ProcInt.ProcVars[VDummy]));
      end;
    end;
  end;

  // Parameter der letzten Funktion (Es wird davon ausgegangen, dass der Cursor
  // in der letzten Funktion steht und somit nur diese Paramter sichtbar sind)
  Proc := Comp.GetProc(Comp.GetProcCount - 1);
  if Proc is TPSInternalProcedure then
  begin
    ProcInt := TPSInternalProcedure(Proc);
    if ProcInt.Decl <> nil then
    begin
      for Dummy := 0 to ProcInt.Decl.ParamCount - 1 do
        AddVar(ProcInt.Decl.Params[Dummy].OrgName, ProcInt.Decl.Params[Dummy].aType);

      if ProcInt.Decl.Result <> nil then
        AddVar('result', ProcInt.Decl.Result);
    end;
  end;

  // Globale Variablen
  for Dummy := 0 to Comp.GetVarCount - 1 do
    AddVar(Comp.GetVar(Dummy));

  // Eigene Funktionen
  // Bei 1 beginnen (0 = main_proc)
  for Dummy := 1 to Comp.GetProcCount - 1 do
  begin
    Proc := Comp.GetProc(Dummy);
    if Proc is TPSInternalProcedure then
    begin
      ProcInt := TPSInternalProcedure(Proc);
      AddProcedure(ProcInt.OriginalName, ProcInt.Decl);
    end;
  end;

  // registrierte Funktionen
  for Dummy := 0 to Comp.GetRegProcCount - 1 do
  begin
    RegProc := Comp.GetRegProc(Dummy);
    if RegProc.NameHash > 0 then // on exclut les property helpers
      AddProcedure(RegProc.OrgName, RegProc.Decl);
  end;

  // Konstanten
  for Dummy := 0 to Comp.GetConstCount - 1 do
  begin
    con := TPSConstant(Comp.GetConst(Dummy));

    Info.OrgName := con.OrgName;

    Info.OrgParams := ': ' + GetTypeName(con.Value.FType);
    Info.ReturnTyp := HashString(GetTypeName(con.Value.FType));
    Info.HasFields := TypHasField(con.Value.FType);
    Info.Nr := Con.Value.ts32;
    Info.Typ := itConstant;
    AddInfo(Info);
  end;

  // Typen �bernehmen
  for Dummy := 0 to Comp.GetTypeCount - 1 do
  begin
    Typ := Comp.GetType(Dummy);

    Info.OrgName := Typ.OriginalName;

    Info.ReturnTyp := HashString(Typ.OriginalName);
    Info.Params := '"CastValue"';
    Info.Typ := itType;

    if Typ.OriginalName <> '' then
      AddTypeInfo(Info.ReturnTyp, Typ.BaseType);

    if Typ is TPSSetType then
      Info.SubType := HashString(TPSSetType(Typ).SetType.OriginalName)
    else if Typ is TPSArrayType then
      Info.SubType := HashString(TPSArrayType(Typ).ArrayTypeNo.OriginalName)
    else if Typ is TPSClassType then
    begin
      if TPSClassType(Typ).Cl.ClassInheritsFrom <> nil then
        Info.SubType := HashString(TPSClassType(Typ).Cl.ClassInheritsFrom.aType.OriginalName);
    end;

    AddInfo(Info);

    Father := HashString(Typ.OriginalName);

    if Typ is TPSRecordType then
    begin
      for VDummy := 0 to TPSRecordType(Typ).RecValCount - 1 do
      begin
        ClearInfoRec;
        with TPSRecordType(Typ).RecVal(VDummy) do
        begin
          Info.OrgName := FieldOrgName;

          Info.OrgParams := ': ' + GetTypeName(aType);
          Info.Typ := itField;
          Info.Father := Father;
          if aType.OriginalName <> '' then
            Info.ReturnTyp := HashString(aType.OriginalName)
          else
          begin
            if aType.ClassType = TPSArrayType then
            begin
              if TPSArrayType(TPSRecordType(Typ).RecVal(VDummy).aType).ArrayTypeNo <> nil then
                Info.ReturnTyp := HashString(GetTypeName(TPSArrayType(TPSRecordType(Typ).RecVal(VDummy).aType).ArrayTypeNo));
            end;
          end;
          Info.Nr := VDummy;
          AddInfo(Info);
        end;
      end;
    end;

    if Typ is TPSClassType then
    begin
      for VDummy := 0 to TPSClassType(Typ).Cl.Count - 1 do
      begin
        ClearInfoRec;
        with TPSClassType(Typ).Cl.Items[VDummy] do
        begin
          Info.OrgName := OrgName;
          Info.Father := Father;

          SetParams(Info, Decl);

          if Decl.Result <> nil then
            Info.ReturnTyp := HashString(GetTypeName(Decl.Result));

          if ClassType = TPSDelphiClassItemProperty then
            Info.Typ := itField
          else if ClassType = TPSDelphiClassItemConstructor then
            Info.Typ := itConstructor
          else
          begin
            if Decl.Result = nil then
              Info.Typ := itProcedure
            else
              Info.Typ := itFunction;
          end;
          AddInfo(Info);
        end;
      end;
    end;
  end;
end;

procedure TfrmScripts.RebuildLokalObjektList;
var
  Script: TStringList;
begin
  Script := TStringList.Create;
  try
    Script.Text := GetActiveScript.Text;
    Script[GetActiveScript.CaretXY.Line - 1] := '';

    PSScriptDebugger1.Script.Text := Script.Text;
    PSScriptDebugger1.Compile;
  finally
    Script.Free;
  end;
end;

function TfrmScripts.GetLookUpString(Line: AnsiString; EndPos: Integer): AnsiString;
const
  TSynValidIdentifierChars = ['.', ' ', '[', ']', '(', ')'];
var
  TmpX: Integer;
  ParenCount: Integer;
  WasSpace: Boolean;
  CanSpace: Boolean;
begin
  //we have a valid open paren, lets see what the word before it is
  TmpX := EndPos;
  ParenCount := 0;
  WasSpace := false;
  CanSpace := true;
  while (TmpX > 0) and (SynPasSyn1.IsIdentChar(WideChar(Line[TmpX])) or CharInSet(Line[TmpX], TSynValidIdentifierChars) or (ParenCount > 0)) do
  begin
    case Line[TmpX] of
      ')', ']': inc(ParenCount);
      '(', '[':
      begin
        if ParenCount = 0 then
          break;
        dec(ParenCount);
      end;
      '.':
      begin
        CanSpace := true;
        WasSpace := false;
      end;
      ' ':
      begin
        if not CanSpace then
          WasSpace := true;
      end;
      else
      begin
        if WasSpace then
          break;
        WasSpace := false;
        CanSpace := false;
      end;
    end;

    dec(TmpX);
  end;

  if ParenCount = 0 then
    result := AnsiString(Copy(Line, TmpX + 1, EndPos - TmpX))
  else
    result := '';

end;

function TfrmScripts.FindParameter(LocLine: AnsiString; X: Integer; out Func: TParamInfoRecord; out ParamCount: Integer): Boolean;
var
  TmpX: Integer;
  StartX, ParenCounter: Integer;
  LookUp: AnsiString;
begin
  { TODO : grosse lacune, la fonction ne g�re pas du tout si la parenth�se est dans une chaine ou non }

  //go back from the cursor and find the first open paren
  TmpX := X;
  if TmpX > length(locLine) then
    TmpX := length(locLine)
  else
    Dec(TmpX);

  result := False;
  ParamCount := 0;
  while (TmpX > 0) and not (result) do
  begin
    if LocLine[TmpX] = ';' then
      Exit
    else if LocLine[TmpX] = ',' then
    begin
      Inc(ParamCount);
      Dec(TmpX);
    end
    else if LocLine[TmpX] = ')' then
    begin
      //We found a close, go till it's opening paren
      ParenCounter := 1;
      Dec(TmpX);
      while (TmpX > 0) and (ParenCounter > 0) do
      begin
        if LocLine[TmpX] = ')' then
          inc(ParenCounter)
        else if LocLine[TmpX] = '(' then
          dec(ParenCounter);

        dec(TmpX);
      end;
    end
    else if locLine[TmpX] = '(' then
    begin
      //we have a valid open paren, lets see what the word before it is
      StartX := TmpX;
      LookUp := GetLookUpString(locLine, tmpX - 1);
      if LookUp <> '' then
      begin
        result := LookupList(Lookup, Func);
        if not (Func.Typ in [itProcedure, itFunction, itType]) then
        begin
          result := false;
        end;
        if not (result) then
        begin
          TmpX := StartX;
          dec(TmpX);
        end;
      end;
    end
    else
      dec(TmpX);
  end;
end;

function TfrmScripts.LookUpList(LookUp: AnsiString; var ParamInfo: TParamInfoRecord): Boolean;
var
  Dummy: Integer;
  Hash: Cardinal;
  Parts: TStringArray;
  FindString: AnsiString;
  Parent: Cardinal;

  function FindEntry(LookUp: AnsiString; Parent: Cardinal; var ParamInfo: TParamInfoRecord): Boolean;
  var
    Dummy: Integer;
    Hash: Cardinal;
  begin
    Hash := HashString(LookUp);
    result := false;
    for Dummy := 0 to high(fObjectList) do
    begin
      if (fObjectList[Dummy].Name = Hash) and (fObjectList[Dummy].Father = Parent) then
      begin
        result := true;
        ParamInfo := fObjectList[Dummy];
        exit;
      end;
    end;

    // Keinen passenden Eintrag gefunden. Vorfahren pr�fen
    if LookUpList(Parent, ParamInfo) then
    begin
      if ParamInfo.SubType <> 0 then
      begin
        result := FindEntry(LookUp, ParamInfo.SubType, ParamInfo);
      end;
    end;
  end;

begin
  if AnsiStrings.AnsiPos('.', LookUp) = 0 then
  begin
    // Einfacher Bezeichner wird gesucht
    Hash := HashString(Trim(LookUp));
    result := false;
    for Dummy := 0 to high(fObjectList) do
    begin
      if (fObjectList[Dummy].Name = Hash) and (fObjectList[Dummy].Father = 0) then
      begin
        Result := True;
        ParamInfo := fObjectList[Dummy];
        Exit;
      end;
    end;
  end
  else
  begin
    // Verkn�pfter bezeichner wird gesucht
    Parts := Explode('.', LookUp);
    Assert(length(Parts) > 0, 'Blub' + LookUp);
    Result := False;
    Parent := 0;
    for Dummy := 0 to high(Parts) do
    begin
      FindString := Trim(Parts[Dummy]);
      if AnsiStrings.AnsiPos('[', FindString) > 0 then
        FindString := AnsiString(Copy(FindString, 1, AnsiStrings.AnsiPos('[', FindString) - 1));

      if AnsiStrings.AnsiPos('(', FindString) > 0 then
        FindString := AnsiString(Copy(FindString, 1, AnsiStrings.AnsiPos('(', FindString) - 1));

      if not FindEntry(FindString, Parent, ParamInfo) then
        Exit;

      Parent := ParamInfo.ReturnTyp;
    end;
    Result := True;
  end;
end;

function TfrmScripts.LookUpList(LookUp: Cardinal; var ParamInfo: TParamInfoRecord): Boolean;
var
  Dummy: Integer;
begin
  result := false;
  for Dummy := 0 to high(fObjectList) do
  begin
    if (fObjectList[Dummy].Name = LookUp) and (fObjectList[Dummy].Father = 0) then
    begin
      result := true;
      ParamInfo := fObjectList[Dummy];
      exit;
    end;
  end;
end;

procedure TfrmScripts.SynEditParamShowExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  ParamIndex: Integer;
  Info: TParamInfoRecord;
  Editor: TSynEdit;
begin
  RebuildLokalObjektList;

  Editor := GetActiveScript;
  CanExecute := FindParameter(AnsiString(Editor.LineText), Editor.CaretX, Info, ParamIndex);

  TSynCompletionProposal(Sender).ItemList.Clear;

  if CanExecute then
  begin
    TSynCompletionProposal(Sender).Form.CurrentIndex := ParamIndex;
    if Info.Params = '' then
      Info.Params := '"* Pas de param�tre *"';

    TSynCompletionProposal(Sender).ItemList.Add(string(Info.Params));
  end;
end;

procedure TfrmScripts.SynEditAutoCompleteExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  Parser: TPSPascalParser;
  Token: TPSPasToken;
  Prev: TPSPasToken;
  PrevEnd: Integer;
  Types: TInfoTypes;
  tmpX: Integer;
  Father: Cardinal;
  Line: AnsiString;
  Info: TParamInfoRecord;
  ParamCount: Integer;
  Parts: TStringArray;
  Typ: AnsiString;
  Obj: AnsiString;
  Editor: TSynEdit;
  hasAssign: Boolean;
begin
  Editor := GetActiveScript;
  RebuildLokalObjektList;

  Line := AnsiString(Editor.LineText);

  Types := [itProcedure, itFunction, itVar];
  Parser := TPSPascalParser.Create;
  Parser.SetText(Line);

  Father := 0;
  Typ := '';

  CanExecute := false;

  Prev := CSTI_EOF;
  Token := CSTI_EOF;
  PrevEnd := -1;
  hasAssign := False;
  while (Parser.CurrTokenID <> CSTI_EOF) and (Parser.CurrTokenPos < Cardinal(Editor.CaretX - 1)) do
  begin
    Prev := Token;
    PrevEnd := Parser.CurrTokenPos + Cardinal(Length(Parser.OriginalToken));
    Token := Parser.CurrTokenID;
    // Tritt ein := oder ( auf, so wird ein Wert mit einem R�ckgabewert erwartet
    // si un := ou ( alors, il est une valeur avec une valeur de retour pr�vu
    if (Token = CSTI_Assignment) and (Prev = CSTI_Identifier) then
    begin
      Types := [itFunction, itVar, itConstant {, itType}];
      if LookUpList(AnsiString(Copy(Editor.LineText, 1, Parser.CurrTokenPos)), Info) then
        Typ := AnsiString(Copy(Info.OrgParams, 3, length(Info.OrgParams)));
      hasAssign := True;
    end
    else if (Token = CSTI_OpenRound) then
    begin
      Types := [itFunction, itVar, itConstant {, itType}];
      hasAssign := True;
    end
    else if (Token = CSTI_SemiColon) then
    begin
      hasAssign := False;
      Typ := '';
    end;

    Parser.Next;
  end;

  Parser.Free;

  if Token = CSTI_String then
    Exit;

  if (PrevEnd < (Editor.CaretX - 1)) then
    Prev := Token;

  if Prev = CSTI_Colon then
    Types := [itType]
  else if Prev = CSTI_AddressOf then
  begin
    Types := [itProcedure, itFunction];
    Typ := '';
  end
  else if Prev = CSTI_Period then
  begin
    tmpX := Editor.CaretX - 1;
    if tmpX > Length(Line) then
      tmpX := Length(Line);

    while (tmpX > 0) and (Line[tmpX] <> '.') do
      dec(tmpX);

    dec(tmpX);

    Obj := GetLookUpString(Line, tmpX);

    if LookUpList(LowerCase(Obj), Info) then
    begin
      Father := Info.ReturnTyp;
      if Info.OrgParams = '' then
        Types := [itConstructor]
      else if hasAssign then
        Types := [itField, itFunction]
      else
        Types := [itField, itProcedure, itFunction];
    end;
  end;

  if (Prev <> CSTI_AddressOf) and FindParameter(AnsiString(Editor.LineText), Editor.CaretX, Info, ParamCount) then
  begin
    Parts := Explode(',', Info.Params);
    if ParamCount <= high(Parts) then
    begin
      if AnsiStrings.AnsiPos(':', Parts[ParamCount]) > 0 then
      begin
        Typ := AnsiString(Copy(Parts[ParamCount], AnsiStrings.AnsiPos(':', Parts[ParamCount]) + 2, length(Parts[ParamCount])));
        Typ := AnsiString(Copy(Typ, 1, length(Typ) - 1));
      end
      else
        Typ := '';

      Exclude(Types, itProcedure);
    end;
  end;

  CanExecute := true;
  FillAutoComplete(fObjectList, Types, Father, Typ);
end;

procedure TfrmScripts.FillAutoComplete(var List: TParamInfoArray; Types: TInfoTypes; FromFather: Cardinal; Typ: AnsiString);
var
  Dummy: Integer;
  Text, sTyp: string;
  HashT: Cardinal;
  cl: TColor;
  Father: TParamInfoRecord;

  function CompareTypes(Typ1: Cardinal; Typ2: Cardinal): Boolean;
  var
    Type1, Type2: Integer;
    Info: TParamInfoRecord;
  begin
    if (Typ1 = 0) or (Typ2 = 0) then
    begin
      result := false;
      exit;
    end;

    if Typ1 = Typ2 then
    begin
      result := true;
      exit;
    end;

    Assert(fTypeInfos.FindKey(Typ1, Type1));
    Assert(fTypeInfos.FindKey(Typ2, Type2));
    result := BaseTypeCompatible(Type1, Type2);

    if result then
    begin
      // Pr�fen, ob Records und Aufz�hlungen kompatibel sind
      if (Type1 = btEnum) or (Type1 = btRecord) then
      begin
        result := Typ1 = Typ2;
        exit;
      end;
    end;

    if not result then
    begin
      // Klassenkompatibilit�t pr�fen
      if LookUpList(Typ2, Info) then
      begin
        while Info.SubType <> 0 do
        begin
          Assert(LookUpList(Info.SubType, Info));
          if Info.ReturnTyp = Typ1 then
          begin
            result := true;
            exit;
          end;
        end;
      end;
    end;
  end;

  function HasFieldReturnTyp(ReturnTyp: Cardinal; FatherTyp: Cardinal): Boolean;
  var
    Dummy: Integer;
  begin
    result := false;
    if (FatherTyp = 0) or (ReturnTyp = 0) then
      exit;

    for Dummy := 0 to high(List) do
    begin
      if List[Dummy].Typ = itConstructor then
        continue;

      if (List[Dummy].Father = FatherTyp) then
      begin
        if (CompareTypes(ReturnTyp, List[Dummy].ReturnTyp)) then
        begin
          result := true;
          exit;
        end;
        if List[Dummy].HasFields then
        begin
          if HasFieldReturnTyp(ReturnTyp, List[Dummy].Name) then
          begin
            result := true;
            exit;
          end;
        end;
      end;
      if List[Dummy].Name = FatherTyp then
      begin
        if List[Dummy].SubType <> 0 then
        begin
          if HasFieldReturnTyp(ReturnTyp, List[Dummy].SubType) then
          begin
            result := true;
            exit;
          end;
        end;
      end;
    end;
  end;

var
  sl1, sl2: TStringList;
  i: Integer;
begin
  SynEditAutoComplete.ClearList;
  SynEditAutoComplete.Columns[0].BiggestWord := '';
  if LookUpList(FromFather, Father) then
  begin
    if Father.SubType <> 0 then
    begin
      for Dummy := 0 to high(List) do
      begin
        if List[Dummy].Name = Father.SubType then
        begin
          FillAutoComplete(List, Types, List[Dummy].Name, Typ);
          break;
        end;
      end;
    end;
  end;
  HashT := HashString(Typ);

  sl1 := TStringList.Create;
  sl2 := TStringList.Create;

  try

    for Dummy := 0 to high(List) do
    begin
      with List[Dummy] do
      begin
        if (Typ in Types) and
          (Father = FromFather) and
          ((HashT = 0) or
          (CompareTypes(HashT, ReturnTyp)) or
          (HashT = ReturnTyp) or
          HasFields
          ) then
        begin
          cl := clBlack;
          case Typ of
            itProcedure:
            begin
              Text := 'procedure ';
              cl := clTeal;
            end;
            itFunction:
            begin
              Text := 'function ';
              cl := clBlue;
            end;
            itType:
            begin
              Text := 'type ';
              cl := clTeal;
            end;
            itVar:
            begin
              Text := 'var ';
              cl := clMaroon;
            end;
            itConstant:
            begin
              Text := 'const ';
              cl := clGreen;
            end;
            itField:
            begin
              Text := 'property ';
              cl := clTeal;
            end;
            itConstructor:
            begin
              Text := 'constructor ';
              cl := clTeal;
            end;
            else
              Assert(false);
          end;
          sTyp := Text;

          if HasFields and (HashT <> 0) and (HashT <> ReturnTyp) then
          begin
            if HasFieldReturnTyp(HashT, ReturnTyp) then
              Text := '\color{' + ColorToString(cl) + '}' + Text + '\column{}\color{0}\style{+B}' + string(OrgName) + '...\style{-B}'
            else
              continue;
          end
          else
          begin
            Text := '\color{' + ColorToString(cl) + '}' + Text + '\column{}\color{0}\style{+B}' + string(OrgName) + '\style{-B}';
            if Typ <> itConstructor then
              Text := Text + string(OrgParams);
          end;

          sl1.AddObject(string(OrgName), Pointer(sl2.Count));
          sl2.Add(Text);
          if Length(sTyp) > Length(SynEditAutoComplete.Columns[0].BiggestWord) then
            SynEditAutoComplete.Columns[0].BiggestWord := sTyp;
        end;
      end;
    end;

    sl1.Sort;
    for i := 0 to Pred(sl1.Count) do
    begin
      SynEditAutoComplete.InsertList.Add(sl1[i]);
      SynEditAutoComplete.ItemList.Add(sl2[Integer(sl1.Objects[i])]);
    end;
  finally
    sl1.Free;
    sl2.Free;
  end;

  if (SynEditAutoComplete.InsertList.Count = 0) and (Hasht <> 0) then
    FillAutoComplete(List, Types, FromFather);
end;

{$ENDREGION}

{$REGION 'Edition'}
const
  imgGutterBREAK = 0;
  imgGutterBREAKVALID = 1;
  imgGutterBREAKINVAL = 2;
  imgGutterCOMPLINE = 3;
  imgGutterEXECLINECL = 4;
  imgGutterEXECLINEBP = 5;
  imgGutterEXECLINE = 6;
  imgGutterBREAKDISABLED = 7;

procedure TfrmScripts.seScript1GutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
begin
  if X <= TSynEdit(Sender).Gutter.LeftOffset then
    ToggleBreakPoint(FInfoScripts.ScriptName(TSynEdit(Sender)), Line, False);
end;

procedure TfrmScripts.seScript1GutterPaint(Sender: TObject; aLine, X, Y: Integer);
var
  IconIndex: Integer;
  i: Integer;
  Script: AnsiString;
  Proc, Pos: Cardinal;
begin
  Script := FInfoScripts.ScriptName(TSynEdit(Sender));
  IconIndex := -1;
  i := FDebugPlugin.Breakpoints.IndexOf(Script, aLine);
  if i <> -1 then
  begin
    if not PSScriptDebugger1.Running then
      if FDebugPlugin.Breakpoints[i].Active then
        IconIndex := imgGutterBREAK
      else
        IconIndex := imgGutterBREAKDISABLED
    else
    begin
      if (Cardinal(aLine) = FActiveLine) and SameText(FActiveFile, Script) then
        IconIndex := imgGutterEXECLINEBP
      else if FDebugPlugin.Breakpoints[i].Active then
        IconIndex := imgGutterBREAKVALID
      else
        IconIndex := imgGutterBREAKDISABLED;
    end;
  end
  else
  begin
    if (PSScriptDebugger1.Exec.DebugMode = dmPaused) and (Cardinal(aLine) = FActiveLine) and SameText(FActiveFile, Script) then
      IconIndex := imgGutterEXECLINE;
  end;

  if Compiled then
    if TranslatePositionEx(Proc, Pos, aLine, Script) then
      case IconIndex of
        -1: IconIndex := imgGutterCOMPLINE;
        // imgGutterBREAKDISABLED: IconIndex := imgGutterCOMPLINE;
        // imgGutterBREAK: IconIndex := imgGutterCOMPLINE;
        // imgGutterBREAKVALID: IconIndex := imgGutterCOMPLINE;
        imgGutterEXECLINE: IconIndex := imgGutterEXECLINECL;
      end
    else
      case IconIndex of
        imgGutterBREAK: IconIndex := imgGutterBREAKINVAL;
        imgGutterBREAKVALID: IconIndex := imgGutterBREAKINVAL;
      end;

  if IconIndex <> -1 then
    lstDebugImages.Draw(TSynEdit(Sender).Canvas, X, Y, IconIndex);
end;

procedure TfrmScripts.seScript1SpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean; var FG, BG: TColor);
var
  i: Integer;
  Script: AnsiString;
  Proc, Pos: Cardinal;
begin
  Script := FInfoScripts.ScriptName(TSynEdit(Sender));
  i := FDebugPlugin.Breakpoints.IndexOf(Script, Line);

  if (Cardinal(Line) = FActiveLine) and SameText(FActiveFile, Script) then
  begin
    Special := True;
    FG := clWhite;
    BG := clNavy;
  end
  else if i <> -1 then
  begin
    Special := True;
    if FDebugPlugin.Breakpoints[i].Active then
    begin
      if Compiled and not TranslatePositionEx(Proc, Pos, Line, Script) then
      begin
        FG := clWhite;
        BG := clOlive;
      end
      else
      begin
        FG := clWhite;
        BG := clRed;
      end;
    end
    else
    begin
      FG := clRed;
      BG := clLime;
    end;
  end
  else if (FErrorLine > 0) and (Cardinal(Line) = FErrorLine) and SameText(FErrorFile, Script) then
  begin
    Special := True;
    FG := clWhite;
    BG := clMaroon;
  end

  else
    Special := False;
end;

procedure TfrmScripts.seScript1StatusChange(Sender: TObject; Changes: TSynStatusChanges);
var
  Attri: TSynHighlighterAttributes;
  Token: string;
  SB: TStatusBar;
  Editor: TSynEdit;
begin
  if (scCaretX in Changes) or (scCaretY in Changes) then
  begin
    Editor := TSynEdit(TSynEdit(Sender));
    SB := FInfoScripts.InfoScript(Editor).FSB;
    SB.Panels[0].Text := Format('%.3d : %.3d', [Editor.CaretY, Editor.CaretX]);
    if Editor.GetHighlighterAttriAtRowCol(Editor.CaretXY, Token, Attri) then
    begin
      SB.Panels[2].Text := Attri.Name;
    end
    else
      SB.Panels[2].Text := '';
  end;
  if (scModified in Changes) then
  begin
    //    FCurrentFile.Modified := EScript.Modified;
  end;
end;

procedure TfrmScripts.SearchFind1Execute(Sender: TObject);
var
  dummyReplace: string;
begin
  if GetActiveScript.SelAvail and (GetActiveScript.BlockBegin.Line = GetActiveScript.BlockEnd.Line) then
  begin
    FLastSearch := GetActiveScript.SelText;
    Include(FSearchOptions, ssoSelectedOnly);
  end
  else
  begin
    FLastSearch := GetActiveScript.WordAtCursor;
    Exclude(FSearchOptions, ssoSelectedOnly);
  end;

  if Sender = SearchFind1 then
  begin
    // chercher
    Exclude(FSearchOptions, ssoReplace);
    Exclude(FSearchOptions, ssoReplaceAll);

    if not TfrmScriptSearch.Execute(FLastSearch, dummyReplace, FSearchOptions) then
      Exit;
  end
  else
  begin
    // remplacer
    Include(FSearchOptions, ssoReplace);
    Exclude(FSearchOptions, ssoReplaceAll);

    if not TfrmScriptSearch.Execute(FLastSearch, FLastReplace, FSearchOptions) then
      Exit;
  end;

  SearchFindNext1Execute(Sender);
end;

procedure TfrmScripts.SearchFindNext1Execute(Sender: TObject);
begin
  if FLastSearch = '' then
    SearchFind1Execute(SearchFind1)
  else if GetActiveScript.SearchReplace(FLastSearch, FLastReplace, FSearchOptions) = 0 then
    ShowMessage('Texte non trouv�');
end;

procedure TfrmScripts.EditCut1Execute(Sender: TObject);
begin
  GetActiveScript.CutToClipboard;
end;

procedure TfrmScripts.EditCopy1Execute(Sender: TObject);
begin
  GetActiveScript.CopyToClipboard;
end;

procedure TfrmScripts.EditPaste1Execute(Sender: TObject);
begin
  GetActiveScript.PasteFromClipboard;
end;

procedure TfrmScripts.EditSelectAll1Execute(Sender: TObject);
begin
  GetActiveScript.SelectAll;
end;

procedure TfrmScripts.EditUndo1Execute(Sender: TObject);
begin
  GetActiveScript.Undo;
end;

procedure TfrmScripts.EditRedo1Execute(Sender: TObject);
begin
  GetActiveScript.Redo;
end;

procedure TfrmScripts.seScript1ReplaceText(Sender: TObject; const ASearch, AReplace: string; Line, Column: Integer; var Action: TSynReplaceAction);
begin
  case MessageDlg('Remplacer cette occurence ?', mtConfirmation, [mbYes, mbNo, mbCancel, mbYesToAll], 0) of
    mrYes: Action := raReplace;
    mrNo: Action := raSkip;
    mrCancel: Action := raCancel;
    mrYesToAll: Action := raReplaceAll;
  end;
end;

procedure TfrmScripts.seScript1Change(Sender: TObject);
begin
  Compiled := False;
  TSynEdit(Sender).Tag := 1;
  FInfoScripts.InfoScript(TSynEdit(Sender)).FSB.Panels[1].Text := 'Modifi�';
  if (FErrorLine > 0) then
  begin
    GetScript(FErrorFile).InvalidateLine(FErrorLine);
    GetScript(FErrorFile).InvalidateGutterLine(FErrorLine);
    FErrorLine := 0;
    FErrorFile := '';
  end;
end;

procedure TfrmScripts.actFermerExecute(Sender: TObject);
begin
  if not FForceClose and (FInfoScripts.ScriptName(GetActiveScript) = Projet) then
    Exit;

  if GetActiveScript.Tag = 1 then
  begin
    case MessageDlg('L''unit� "' + string(FInfoScripts.ScriptName(GetActiveScript)) + '" a �t� modifi�e, voulez-vous l''enregistrer?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: actEnregistrer.Execute;
      mrNo: ;
      mrCancel: Abort;
    end;
  end;
  FInfoScripts.Delete(pcScripts.ActivePageIndex);
  pcScripts.ActivePage.Free;
end;

procedure TfrmScripts.actEnregistrerExecute(Sender: TObject);
begin
  GetActiveScript.Lines.SaveToFile(FInfoScripts.ScriptFileName(GetActiveScript));
  GetActiveScript.Tag := 0;
  FInfoScripts.InfoScript(GetActiveScript).FSB.Panels[1].Text := '';
end;

procedure TfrmScripts.actEnregistrerSousExecute(Sender: TObject);
begin
  //
end;

procedure TfrmScripts.ListView1DblClick(Sender: TObject);
begin
  if not Assigned(ListView1.Selected) then
    Exit;
  Projet := AnsiString(ListView1.Selected.Caption);
end;

procedure TfrmScripts.seScript1ProcessUserCommand(Sender: TObject; var Command: TSynEditorCommand; var AChar: Char; Data: Pointer);
begin
  case Command - ecUserFirst of
    1: LoadScript(AnsiString(GetActiveScript.WordAtCursor));
  end;
end;

procedure TfrmScripts.pcScriptsChange(Sender: TObject);
begin
  //  � am�liorer:
  //     - les params ne s'affichent pas
  //     - l'autocomplete ne s'affiche pas toujours
  //     - l'autocomplete choisi mal ce qui est affich� en fonction de la position dans le script
  SynEditAutoComplete.Editor := GetActiveScript;
  SynEditParamShow.Editor := GetActiveScript;
end;

procedure TfrmScripts.seScript1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = ' ') and ((GetKeyState(VK_CONTROL) < 0) or (GetKeyState(VK_SHIFT) < 0)) then
    Key := #0;
end;

{$ENDREGION}

procedure TfrmScripts.WMSyscommand(var msg: TWmSysCommand);
begin
  case (msg.CmdType and $FFF0) of
    SC_CLOSE: if not PSScriptDebugger1.Running then
        inherited;
    else
      inherited;
  end;
end;

procedure TfrmScripts.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
var
  Editor: TSynEdit;
begin
  Editor := GetActiveScript;
  Handled := True;
  EditCut1.Enabled := Assigned(Editor) and Editor.SelAvail;
  EditCopy1.Enabled := Assigned(Editor) and Editor.SelAvail;
  EditPaste1.Enabled := Assigned(Editor) and Editor.CanPaste;
  EditUndo1.Enabled := Assigned(Editor) and Editor.CanUndo;
  EditRedo1.Enabled := Assigned(Editor) and Editor.CanRedo;
  actCompile.Enabled := FProjetOuvert;
  actRun.Enabled := FProjetOuvert;
  actRunWithoutDebug.Enabled := FProjetOuvert and not PSScriptDebugger1.Running;
  actFermer.Enabled := Assigned(Editor) and (FForceClose or (FInfoScripts.ScriptName(GetActiveScript) <> Projet));
  actEnregistrer.Enabled := Assigned(Editor);
  actEnregistrerSous.Enabled := Assigned(Editor);
end;

function TfrmScripts.GetProjet: AnsiString;
begin
  Result := PSScriptDebugger1.MainFileName;
end;

procedure TfrmScripts.SetProjet(const Value: AnsiString);
begin
  ProjetOuvert := False;
  // doit etre fait avant le LoadScript
  PSScriptDebugger1.MainFileName := Value;
  LoadScript(Value);
  ProjetOuvert := True;
end;

procedure TfrmScripts.SetProjetOuvert(const Value: Boolean);
begin
  if not Value then
  begin
    FForceClose := True;
    try
      ClearPages;
      Compiled := False;
      FDebugPlugin.Messages.Clear;
      PSScriptDebugger1.MainFileName := '';
    finally
      FForceClose := False;
    end;
  end;
  FProjetOuvert := Value;
end;

procedure TfrmScripts.SetCompiled(const Value: Boolean);
var
  Editor: TSynEdit;
begin
  FCompiled := Value;
  Editor := GetActiveScript;
  if Assigned(Editor) then
    Editor.Invalidate;
end;

procedure TfrmScripts.FormCreate(Sender: TObject);
var
  i: Integer;
  sr: TSearchRec;
begin
  FAlbumToImport := TAlbumComplet.Create;
  FListTypesImages := TStringList.Create;
  LoadStrings(6, FListTypesImages);

  fTypeInfos := TIDHashMap.Create;

  Assert(not Assigned(PSScriptDebugger1.Comp.OnBeforeCleanup), 'PSScriptDebugger1.Comp.OnBeforeCleanup d�j� utilis�');
  PSScriptDebugger1.Comp.OnBeforeCleanup := AutoCompleteCompilerBeforeCleanUp;

  FInfoScripts := TInfosScripts.Create;

  FForceClose := False;
  PageControl1.ActivePageIndex := 0;
  FDebugPlugin := TDebugInfos.Create;
  FDebugPlugin.OnGetScript := GetScript;
  FDebugPlugin.Watches.View := vstSuivis;
  FDebugPlugin.Messages.View := vstMessages;
  FDebugPlugin.Breakpoints.View := vstBreakpoints;

  // force � reprendre les params de delphi s'il est install� sur la machine
  SynPasSyn1.UseUserSettings(0);

  FPSImport_RegExpr := TPSImport_BdtkRegEx.Create(Self);
  TPSPluginItem(PSScriptDebugger1.Plugins.Add).Plugin := FPSImport_RegExpr;
  FPSImport_BdtkObjects := TPSImport_BdtkObjects.Create(Self);
  TPSPluginItem(PSScriptDebugger1.Plugins.Add).Plugin := FPSImport_BdtkObjects;

  i := FindFirst(TGlobalVar.Utilisateur.Options.RepertoireScripts + '\*.bds', faAnyFile, sr);
  if i = 0 then
    try
      while i = 0 do
      begin
        if (sr.Attr and faDirectory) = 0 then
          ListView1.Items.Add.Caption := ChangeFileExt(sr.Name, '');
        i := FindNext(sr);
      end;
    finally
      FindClose(sr);
    end;
  PageControl2.ActivePage := tbScripts;
end;

procedure TfrmScripts.FormDestroy(Sender: TObject);
begin
  ClearPages;
  FInfoScripts.Free;
  fTypeInfos.Free;
  FDebugPlugin.Free;
  FAlbumToImport.Free;
  FListTypesImages.Free;
end;

function TfrmScripts.GetFullNameScript(const Script: AnsiString): string;
var
  MatchFound: SysUtils.TFilenameCaseMatch;
begin
  if ExtractFileExt(Script) = '' then
    if ExtractFileName(Script) = Projet then
      Result := string(Script) + '.bds'
    else
      Result := string(Script) + '.bdu';

  if ExtractFilePath(Script) = '' then
    Result := TGlobalVar.Utilisateur.Options.RepertoireScripts + Result;

  Result := SysUtils.ExpandFileNameCase(Result, MatchFound);
end;

function TfrmScripts.CorrectScriptName(const Script: AnsiString): AnsiString;
begin
  if Script = '' then
    Result := Projet
  else
    Result := Script;
end;

function TfrmScripts.GetScriptLines(const Script: AnsiString; out Output: AnsiString): Boolean;
var
  path: string;
  f: TFileStream;
  Editor: TSynEdit;
begin
  Editor := GetScript(Script);
  if Assigned(Editor) then
  begin
    Output := AnsiString(Editor.Lines.Text);
    Result := True;
    Exit;
  end;

  Path := GetFullNameScript(Script);
  try
    F := TFileStream.Create(Path, fmOpenRead or fmShareDenyWrite);
  except
    Result := False;
    Exit;
  end;
  try
    SetLength(Output, f.Size);
    f.Read(Output[1], Length(Output));
  finally
    f.Free;
  end;
  Result := True;
end;

procedure TfrmScripts.LoadScript(const Script: AnsiString);
var
  Code: AnsiString;
  LockWindow: ILockWindow;
  info: TInfoScript;
  Editor: TSynEdit;
begin
  Editor := GetScript(Script);
  if not Assigned(Editor) then
  begin
    LockWindow := TLockWindow.Create(pcScripts);

    // doit �tre fait avant la cr�ation de page
    if not GetScriptLines(Script, Code) then
      raise Exception.Create('Impossible de trouver l''unit� ' + string(Script) + '.');

    info := TInfoScript.Create;
    FInfoScripts.Add(info);

    info.FFileName := GetFullNameScript(Script);
    info.FScriptName := AnsiString(ChangeFileExt(ExtractFileName(info.FFileName), ''));

    info.FTabSheet := TTabSheet.Create(pcScripts);
    info.FTabSheet.PageControl := pcScripts;
    info.FTabSheet.Caption := string(info.FScriptName);

    info.FEditor := TSynEdit.Create(info.FTabSheet);
    info.FEditor.Parent := info.FTabSheet;
    info.FEditor.Align := alClient;
    info.FEditor.Color := clWhite;
    info.FEditor.ActiveLineColor := 16314351;
    info.FEditor.Font.Color := clWindowText;
    info.FEditor.Font.Height := -13;
    info.FEditor.Font.Name := 'Courier New';
    info.FEditor.Font.Style := [];
    info.FEditor.OnMouseMove := seScript1MouseMove;
    info.FEditor.Gutter.AutoSize := True;
    info.FEditor.Gutter.DigitCount := 3;
    info.FEditor.Gutter.Font.Color := clWindowText;
    info.FEditor.Gutter.Font.Height := -11;
    info.FEditor.Gutter.Font.Name := 'Terminal';
    info.FEditor.Gutter.Font.Style := [];
    info.FEditor.Gutter.LeftOffset := 27;
    info.FEditor.Gutter.ShowLineNumbers := True;
    info.FEditor.Gutter.Width := 0;
    info.FEditor.Highlighter := SynPasSyn1;
    info.FEditor.Options := [eoAutoIndent, eoTabIndent, eoSmartTabs, eoAutoSizeMaxScrollWidth, eoDragDropEditing, eoGroupUndo, eoRightMouseMovesCursor, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoTabIndent, eoTabsToSpaces, eoTrimTrailingSpaces];
    info.FEditor.ScrollHintFormat := shfTopToBottom;
    info.FEditor.SearchEngine := SynEditSearch1;
    info.FEditor.TabWidth := 2;
    info.FEditor.WantTabs := True;
    info.FEditor.OnChange := seScript1Change;
    info.FEditor.OnGutterClick := seScript1GutterClick;
    info.FEditor.OnGutterPaint := seScript1GutterPaint;
    info.FEditor.OnReplaceText := seScript1ReplaceText;
    info.FEditor.OnSpecialLineColors := seScript1SpecialLineColors;
    info.FEditor.OnStatusChange := seScript1StatusChange;
    info.FEditor.OnProcessUserCommand := seScript1ProcessUserCommand;
    info.FEditor.OnKeyPress := seScript1KeyPress;
    info.FEditor.AddKey(ecUserFirst + 1, VK_RETURN, [ssCtrl]);

    TSynDebugPlugin.Create(info.FEditor, FDebugPlugin);
    info.FEditor.Lines.Text := string(Code);

    info.FSB := TStatusBar.Create(info.FTabSheet);
    info.FSB.Parent := info.FTabSheet;
    info.FSB.Panels.Add.Width := 50;
    info.FSB.Panels.Add.Width := 50;
    info.FSB.Panels.Add.Width := 50;

    Editor := info.FEditor;
    info.FTabSheet.Visible := True;
  end;
  GoToPosition(Editor, 1, 1);
end;

procedure TfrmScripts.ClearPages;
var
  i: Integer;
begin
  for i := 0 to Pred(pcScripts.PageCount) do
    actFermer.Execute;
end;

{$REGION 'D�buggage'}
procedure TfrmScripts.PSScriptDebugger1Breakpoint(Sender: TObject; const FileName: AnsiString; Position, Row, Col: Cardinal);
begin
  FActiveLine := Row;
  FActiveFile := CorrectScriptName(FileName);
  GoToPosition(GetScript(FActiveFile), FActiveLine, 1);
  FDebugPlugin.Watches.UpdateView;
end;

procedure TfrmScripts.actStepOverExecute(Sender: TObject);
begin
  if PSScriptDebugger1.Exec.Status = isRunning then
    PSScriptDebugger1.StepOver
  else
  begin
    if Compile then
    begin
      PSScriptDebugger1.StepInto;
      Execute;
    end;
  end;
end;

procedure TfrmScripts.actStepIntoExecute(Sender: TObject);
begin
  if PSScriptDebugger1.Exec.Status = isRunning then
    PSScriptDebugger1.StepInto
  else
  begin
    if Compile then
    begin
      PSScriptDebugger1.StepInto;
      Execute;
    end;
  end;
end;

procedure TfrmScripts.actResetExecute(Sender: TObject);
begin
  if PSScriptDebugger1.Exec.Status = isRunning then
    PSScriptDebugger1.Stop;
end;

procedure TfrmScripts.actDecompileExecute(Sender: TObject);
var
  s: AnsiString;
  script: string;
  i, j: LongInt;
  fi: PFunctionInfo;
  pt: TIfList;
  r: PPositionData;
begin
  if Compile then
  begin
    PSScriptDebugger1.GetCompiled(s);
    IFPS3DataToText(s, script);
    output.Lines.Text := script;

    output.Lines.Add('[DEBUG DATA]');
    for i := 0 to TCrackPSDebugExec(PSScriptDebugger1.Exec).FDebugDataForProcs.Count - 1 do
    begin
      fi := TCrackPSDebugExec(PSScriptDebugger1.Exec).FDebugDataForProcs[i];
      pt := fi^.FPositionTable;
      if fi^.Func is TPSExternalProcRec then
        with TPSExternalProcRec(fi^.Func) do
          output.Lines.Add(Format('ExternalProc: %s %s', [Name, Decl]))
      else if fi^.Func is TPSInternalProcRec then
        with TPSInternalProcRec(fi^.Func) do
          output.Lines.Add(Format('InternalProc: %s %s', [ExportName, ExportDecl]))
      else
        output.Lines.Add('unknown proc');

      for j := 0 to pt.Count - 1 do
      begin
        r := pt[j];
        output.Lines.Add(Format('%s: P=%d, RxC=%dx%d, SP=%d', [r^.FileName, r^.Position, r^.Row, r^.Col, r^.SourcePosition]));
      end;
    end;

    PageControl1.ActivePage := TTabSheet(Output.Parent);
  end;
end;

procedure TfrmScripts.actBreakpointExecute(Sender: TObject);
begin
  ToggleBreakPoint(FInfoScripts.ScriptName(GetActiveScript), GetActiveScript.CaretY, False);
end;

procedure TfrmScripts.actAddSuiviExecute(Sender: TObject);
begin
  FDebugPlugin.Watches.AddWatch(AnsiString(GetActiveScript.WordAtCursor));
end;

procedure TfrmScripts.actRunToCursorExecute(Sender: TObject);
begin
  FRunToCursor := GetActiveScript.CaretY;
  FRunToCursorFile := FInfoScripts.ScriptName(GetActiveScript);
  actRun.Execute;
end;

procedure TfrmScripts.vstSuivisNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: UnicodeString);
begin
  FDebugPlugin.Watches[Node.Index].Name := AnsiString(NewText);
  FDebugPlugin.Watches.View.InvalidateNode(Node);
end;

procedure TfrmScripts.vstSuivisEditing(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := Column = 0;
end;

procedure TfrmScripts.vstSuivisInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctCheckBox;
  if FDebugPlugin.Watches[Node.Index].Active then
    Node.CheckState := csCheckedNormal
  else
    Node.CheckState := csUncheckedNormal;
end;

procedure TfrmScripts.vstSuivisChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  FDebugPlugin.Watches[Node.Index].Active := Node.CheckState = csCheckedNormal;
  FDebugPlugin.Watches.View.InvalidateNode(Node);
end;

procedure TfrmScripts.vstSuivisGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
begin
  if Column = -1 then
    Column := 0;
  with FDebugPlugin.Watches[Node.Index] do
    case Column of
      0: CellText := string(Name);
      1: CellText := string(GetVariableValue(Name, Active));
    end;
end;

procedure TfrmScripts.vstSuivisPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  if Node.CheckState = csCheckedNormal then
    TargetCanvas.Font.Color := clWindowText
  else
    TargetCanvas.Font.Color := clGrayText;
end;

procedure TfrmScripts.GoToMessage(Msg: TMessageInfo);
var
  Editor: TSynEdit;
begin
  Editor := GetScript(Msg.Fichier);
  if not Assigned(Editor) then
    LoadScript(Msg.Fichier);
  GoToPosition(GetScript(Msg.Fichier), Msg.Line, Msg.Char);
  PageControl1.ActivePage := TTabSheet(vstMessages.Parent);
end;

procedure TfrmScripts.vstMessagesGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
begin
  if Column = -1 then
    Column := 0;
  with FDebugPlugin.Messages[Node.Index] do
    case Column of
      0:
        case Category of
          cmInfo: CellText := 'Information';
          cmCompileError: CellText := 'Compilation';
          cmRuntimeError: CellText := 'Ex�cution';
          else
            CellText := '';
        end;
      1: CellText := string(TypeMessage);
      2: CellText := string(Fichier);
      3: CellText := string(Text);
    end;
end;

procedure TfrmScripts.vstMessagesDblClick(Sender: TObject);
begin
  GoToMessage(FDebugPlugin.Messages.Current);
end;

procedure TfrmScripts.vstBreakpointsDblClick(Sender: TObject);
begin
  GoToBreakpoint(FDebugPlugin.Breakpoints.Current);
end;

procedure TfrmScripts.GoToBreakpoint(Msg: TBreakpointInfo);
var
  Editor: TSynEdit;
begin
  Editor := GetScript(Msg.Fichier);
  if not Assigned(Editor) then
    LoadScript(Msg.Fichier);
  GoToPosition(GetScript(Msg.Fichier), Msg.Line, 0);
  PageControl1.ActivePage := TTabSheet(vstBreakpoints.Parent);
end;

procedure TfrmScripts.GoToPosition(Editor: TSynEdit; Line, Char: Cardinal);
begin
  if not Assigned(Editor) then
    Exit;

  if (Line < Cardinal(Editor.TopLine + 2)) or (Line > Cardinal(Editor.TopLine + Editor.LinesInWindow - 2)) then
    Editor.TopLine := Line - Cardinal(Editor.LinesInWindow div 2);

  Editor.CaretY := Line;
  Editor.CaretX := Char;
  Editor.Invalidate; // Line et GutterLine sont insuffisants pour certains cas
  PageControl2.ActivePage := tbEdition;
  pcScripts.ActivePage := TTabSheet(Editor.Parent);
  if pcScripts.PageCount = 1 then
    pcScriptsChange(nil);
  Editor.SetFocus;
end;

procedure TfrmScripts.vstBreakpointsChecked(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  with FDebugPlugin.Breakpoints[Node.Index] do
    ToggleBreakPoint(Fichier, Line, True);
  FDebugPlugin.Breakpoints.View.InvalidateNode(Node);
end;

procedure TfrmScripts.vstBreakpointsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
begin
  if Column = -1 then
    Column := 0;
  with FDebugPlugin.Breakpoints[Node.Index] do
    case Column of
      0: CellText := 'Ligne ' + SysUtils.IntToStr(Line);
      1: CellText := string(Fichier);
    end;
end;

procedure TfrmScripts.vstBreakpointsInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node.CheckType := ctCheckBox;
  if FDebugPlugin.Breakpoints[Node.Index].Active then
    Node.CheckState := csCheckedNormal
  else
    Node.CheckState := csUncheckedNormal;
end;

procedure TfrmScripts.vstBreakpointsPaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
begin
  if Node.CheckState = csCheckedNormal then
    TargetCanvas.Font.Color := clWindowText
  else
    TargetCanvas.Font.Color := clGrayText;
end;

procedure TfrmScripts.ToggleBreakPoint(const Script: AnsiString; Line: Cardinal; Keep: Boolean);
var
  i: Integer;
begin
  i := FDebugPlugin.Breakpoints.IndexOf(Script, Line);
  if i = -1 then // nouveau point d'arr�t
  begin
    FDebugPlugin.Breakpoints.AddBreakpoint(Script, Line);
    if PSScriptDebugger1.Running then
      if Script = PSScriptDebugger1.MainFileName then
        PSScriptDebugger1.SetBreakPoint('', Line)
      else
        PSScriptDebugger1.SetBreakPoint(Script, Line);
  end
  else if Keep then // changement d'�tat du point d'arr�t
  begin
    FDebugPlugin.Breakpoints[i].Active := not FDebugPlugin.Breakpoints[i].Active;
    if PSScriptDebugger1.Running then
      if FDebugPlugin.Breakpoints[i].Active then
        if Script = PSScriptDebugger1.MainFileName then
          PSScriptDebugger1.SetBreakPoint('', Line)
        else
          PSScriptDebugger1.SetBreakPoint(Script, Line)
      else if Script = PSScriptDebugger1.MainFileName then
        PSScriptDebugger1.ClearBreakPoint('', Line)
      else
        PSScriptDebugger1.ClearBreakPoint(Script, Line);
  end
  else
  begin // suppression du point d'arr�t
    FDebugPlugin.Breakpoints.Delete(i);
    if PSScriptDebugger1.Running then
      PSScriptDebugger1.ClearBreakPoint(Script, Line);
  end;
end;

function TfrmScripts.GetVar(const Name: AnsiString; out s: AnsiString): PIFVariant;
var
  i: Longint;
  s1: AnsiString;
begin
  s := UpperCase(Name);
  if AnsiStrings.AnsiPos('.', s) > 0 then
  begin
    s1 := AnsiString(Copy(string(s), 1, AnsiStrings.AnsiPos('.', s) - 1));
    delete(s, 1, AnsiStrings.AnsiPos('.', Name));
  end
  else
  begin
    s1 := s;
    s := '';
  end;
  Result := nil;
  with PSScriptDebugger1 do
  begin
    for i := 0 to Exec.CurrentProcVars.Count - 1 do
      if UpperCase(Exec.CurrentProcVars[i]) = s1 then
      begin
        Result := Exec.GetProcVar(i);
        break;
      end;
    if Result = nil then
    begin
      for i := 0 to Exec.CurrentProcParams.Count - 1 do
        if Uppercase(Exec.CurrentProcParams[i]) = s1 then
        begin
          Result := Exec.GetProcParam(i);
          break;
        end;
    end;
    if Result = nil then
    begin
      for i := 0 to Exec.GlobalVarNames.Count - 1 do
        if Uppercase(Exec.GlobalVarNames[i]) = s1 then
        begin
          Result := Exec.GetGlobalVar(i);
          break;
        end;
    end;
  end;
end;

function TfrmScripts.GetVariableValue(const VarName: AnsiString; Actif: Boolean): AnsiString;
var
  pv: PIFVariant;
  Prefix: AnsiString;
begin
  if Actif then
    if PSScriptDebugger1.Running then
    begin
      pv := GetVar(VarName, Prefix);
      if pv = nil then
        Result := '{Expression inconnue}'
      else
        Result := PSVariantToString(NewTPSVariantIFC(pv, False), Prefix);
    end
    else
      Result := '{Valeur inaccessible}'
  else
    Result := '<d�sactiv�>';
end;

procedure TfrmScripts.seScript1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
const
  WordVar: AnsiString = '';
var
  pv: PIFVariant;
  Prefix: AnsiString;
  s: AnsiString;
begin
  if not PSScriptDebugger1.Running then
  begin
    WordVar := '';
    GetActiveScript.ShowHint := False;
    Exit;
  end;
  s := AnsiString(GetActiveScript.WordAtMouse);
  if s <> WordVar then
    Application.CancelHint;
  WordVar := s;

  pv := GetVar(WordVar, Prefix);
  if pv = nil then
  begin
    GetActiveScript.Hint := '';
    GetActiveScript.ShowHint := False;
  end
  else
  begin
    GetActiveScript.Hint := string(PSVariantToString(NewTPSVariantIFC(pv, False), Prefix));
    GetActiveScript.ShowHint := True;
  end;
end;

{$ENDREGION}

{$REGION 'Ex�cution'}
procedure TfrmScripts.SetResultat(const Chaine: string);
begin
  Output.Lines.Add(Chaine);
  if (PageControl1.ActivePage <> TTabSheet(vstSuivis.Parent)) or (FDebugPlugin.Watches.CountActive = 0) then
    PageControl1.ActivePage := TTabSheet(Output.Parent);
  Application.ProcessMessages;
end;

procedure TfrmScripts.PSScriptDebugger1Execute(Sender: TPSScript);
var
  i: Integer;
begin
  PSScriptDebugger1.ClearBreakPoints;
  if PSScriptDebugger1.UseDebugInfo then
    for i := 0 to Pred(FDebugPlugin.Breakpoints.Count) do
      with FDebugPlugin.Breakpoints[i] do
        if Active then
          if Fichier = PSScriptDebugger1.MainFileName then
            PSScriptDebugger1.SetBreakPoint(Fichier, Line)
          else
            PSScriptDebugger1.SetBreakPoint(AnsiStrings.UpperCase(Fichier), Line);

  PSScriptDebugger1.SetVarToInstance('AlbumToImport', FAlbumToImport);
end;

procedure TfrmScripts.actCompileExecute(Sender: TObject);
begin
  if not PSScriptDebugger1.Running then
    Compile;
end;

procedure TfrmScripts.actRunExecute(Sender: TObject);
begin
  if PSScriptDebugger1.Running then
  begin
    PSScriptDebugger1.Resume;
    FActiveLine := 0;
    FActiveFile := '';
    GetActiveScript.Refresh;
  end
  else
  begin
    if Compile then
      Execute;
  end;
end;

function TfrmScripts.Execute: Boolean;
begin
  FAlbumToImport.Clear;
  Output.Clear;
  PageControl1.ActivePage := TTabSheet(vstSuivis.Parent);
  if PSScriptDebugger1.Execute then
  begin
    //    AddMessage('Succesfully Execute');
    FErrorLine := 0;
    Result := True;
  end
  else
  begin
    FErrorLine := PSScriptDebugger1.ExecErrorRow;
    FErrorFile := CorrectScriptName(PSScriptDebugger1.ExecErrorFileName);
    FDebugPlugin.Messages.AddRuntimeErrorMessage(
      FErrorFile,
      AnsiString(Format('%s (Bytecode %d:%d)', [PSScriptDebugger1.ExecErrorToString, PSScriptDebugger1.ExecErrorProcNo, PSScriptDebugger1.ExecErrorByteCodePosition])),
      PSScriptDebugger1.ExecErrorRow,
      PSScriptDebugger1.ExecErrorCol);
    GoToMessage(FDebugPlugin.Messages.Last);
    Result := False;
    try
      PSScriptDebugger1.Exec.RaiseCurrentException;
    except
      on e: EPSException do
        Application.HandleException(nil);
      else
        raise;
    end;
  end;
end;

procedure TfrmScripts.PSScriptDebugger1Compile(Sender: TPSScript);
var
  i: Integer;
begin
  for i := 0 to Pred(FListTypesImages.Count) do
    PSScriptDebugger1.Comp.AddConstantN('cti' + AnsiStrings.StringReplace(AnsiString(SansAccents(FListTypesImages.ValueFromIndex[i])), ' ', '_', [rfReplaceAll]), 'integer').SetInt(StrToInt(AnsiString(FListTypesImages.Names[i])));

  PSScriptDebugger1.AddMethod(Self, @TfrmScripts.SetResultat, 'procedure WriteToConsole(const Chaine: string);');

  PSScriptDebugger1.AddFunction(@GetPage, 'function GetPage(const url: string; UTF8: Boolean): string;');
  PSScriptDebugger1.AddFunction(@findInfo, 'function findInfo(const sDebut, sFin, sChaine, sDefault: string): string;');
  PSScriptDebugger1.AddFunction(@MakeAuteur, 'function MakeAuteur(const Nom: string; Metier: TMetierAuteur): TAuteur;');
  PSScriptDebugger1.AddFunction(@AskSearchEntry, 'function AskSearchEntry(const Labels: array of string; out Search: string; out Index: Integer): Boolean');
  PSScriptDebugger1.AddFunction(@CombineURL, 'function CombineURL(const Root, URL: string): string;');
  PSScriptDebugger1.AddFunction(@HTMLDecode, 'function HTMLDecode(const Chaine: string): string;');

  PSScriptDebugger1.AddFunction(@SysUtils.Format, 'function Format(const Format: string; const Args: array of const): string;');

  PSScriptDebugger1.AddFunction(@SysUtils.SameText, 'function SameText(const S1, S2: string): Boolean;');
  PSScriptDebugger1.AddFunction(@ShowMessage, 'procedure ShowMessage(const Msg: string);');
  PSScriptDebugger1.AddFunction(@StrUtils.PosEx, 'function PosEx(const SubStr, S: string; Offset: Cardinal): Integer;');

  PSScriptDebugger1.Comp.AddTypeS('TReplaceFlag', '(rfReplaceAll, rfIgnoreCase)');
  PSScriptDebugger1.Comp.AddTypeS('TReplaceFlags', 'set of TReplaceFlag');
  PSScriptDebugger1.AddFunction(@SysUtils.StringReplace, 'function StringReplace(const S, OldPattern, NewPattern: string; Flags: TReplaceFlags): string;');
  PSScriptDebugger1.AddFunction(@ScriptStrToFloatDef, 'function StrToFloatDef(const S: string; const Default: Extended): Extended;');

  PSScriptDebugger1.AddRegisteredVariable('AlbumToImport', 'TAlbumComplet');
end;

procedure TfrmScripts.PSScriptDebugger1Idle(Sender: TObject);
begin
  Application.HandleMessage;
end;

procedure TfrmScripts.PSScriptDebugger1AfterExecute(Sender: TPSScript);
begin
  FActiveLine := 0;
  FActiveFile := '';
  FRunToCursor := 0;
  FRunToCursorFile := '';
  PSScriptDebugger1.ClearBreakPoints;
  if pcScripts.PageCount > 0 then
    GetActiveScript.Refresh;
  vstSuivis.Invalidate;
  PageControl1.ActivePage := TTabSheet(Output.Parent);
end;

procedure TfrmScripts.PSScriptDebugger1LineInfo(Sender: TObject; const FileName: AnsiString; Position, Row, Col: Cardinal);
var
  Editor: TSynEdit;
begin
  if (Row = FRunToCursor) and SameText(CorrectScriptName(FileName), FRunToCursorFile) and (PSScriptDebugger1.Exec.DebugMode = dmRun) then
    PSScriptDebugger1.Pause;

  if PSScriptDebugger1.Exec.DebugMode <> dmRun then
  begin
    FActiveLine := Row;
    FActiveFile := CorrectScriptName(FileName);
    Editor := GetScript(FActiveFile);
    if not Assigned(Editor) then
    begin
      LoadScript(FActiveFile);
      Editor := GetScript(FActiveFile);
    end;
    GoToPosition(Editor, FActiveLine, 1);
    FDebugPlugin.Watches.UpdateView;
  end;
end;

function TfrmScripts.PSScriptDebugger1NeedFile(Sender: TObject; const OrginFileName: AnsiString; var FileName, Output: AnsiString): Boolean;
begin
  Result := GetScriptLines(FileName, Output);
end;

function TfrmScripts.Compile: Boolean;
var
  i: Longint;
  Msg: TMessageInfo;
  Script: AnsiString;
begin
  GetScriptLines(Projet, Script);
  PSScriptDebugger1.Script.Text := string(Script);
  Result := PSScriptDebugger1.Compile;
  FDebugPlugin.Messages.Clear;
  Msg := nil;
  for i := 0 to PSScriptDebugger1.CompilerMessageCount - 1 do
    with PSScriptDebugger1.CompilerMessages[i] do
      if ClassType = TPSPascalCompilerWarning then
        FDebugPlugin.Messages.AddCompileErrorMessage(ModuleName, ShortMessageToString, tmWarning, Row, Col)
      else if ClassType = TPSPascalCompilerHint then
        FDebugPlugin.Messages.AddCompileErrorMessage(ModuleName, ShortMessageToString, tmHint, Row, Col)
      else if ClassType = TPSPascalCompilerError then
      begin
        Msg := FDebugPlugin.Messages[FDebugPlugin.Messages.AddCompileErrorMessage(ModuleName, ShortMessageToString, tmError, Row, Col)];
      end
      else
        FDebugPlugin.Messages.AddCompileErrorMessage(ModuleName, ShortMessageToString, tmUnknown, Row, Col);

  if Assigned(Msg) then
    GoToMessage(Msg);
  Compiled := Result;
end;

function TfrmScripts.TranslatePositionEx(out Proc, Position: Cardinal; Row: Cardinal; Fn: AnsiString): Boolean;
var
  i, j: LongInt;
  fi: PFunctionInfo;
  pt: TIfList;
  r: PPositionData;
begin
  Result := True;
  Proc := 0;
  Position := 0;
  for i := 0 to TCrackPSDebugExec(PSScriptDebugger1.Exec).FDebugDataForProcs.Count - 1 do
  begin
    Result := False;
    fi := TCrackPSDebugExec(PSScriptDebugger1.Exec).FDebugDataForProcs[i];
    pt := fi^.FPositionTable;
    for j := 0 to pt.Count - 1 do
    begin
      r := pt[j];
      if not AnsiSameText(r^.FileName, Fn) then
        Continue;
      if r^.Row = Row then
      begin
        Proc := TCrackPSDebugExec(PSScriptDebugger1.Exec).FProcs.IndexOf(fi^.Func);
        Position := r^.Position;
        Result := True;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmScripts.actRunWithoutDebugExecute(Sender: TObject);
begin
  PSScriptDebugger1.UseDebugInfo := False;
  try
    actRun.Execute;
  finally
    PSScriptDebugger1.UseDebugInfo := True;
  end;
end;

{$ENDREGION}

end.
