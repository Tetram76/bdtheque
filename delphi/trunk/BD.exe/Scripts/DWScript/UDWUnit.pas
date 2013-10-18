unit UDWUnit;

interface

uses
  System.SysUtils, System.Classes, dwsComp, dwsExprs, dwsSymbols, Generics.Collections, Variants, dwsUnitSymbols, dwsOperators, dwsUtils;

type
{$M+}
  TDW_Unit = class(TdwsUnit)
  private
    FExternalInstances: TDictionary<Variant, TObject>;
    FScriptObjInstances: TDictionary<TObject, Variant>;

    function RegisterMethod(c: TdwsClass; Kind: TMethodKind; const MethodName, ResultType: string; Params: array of String; Event: TMethodEvalEvent; Visibility: TdwsVisibility = cvPublic; Attributes: TMethodAttributes = []): TdwsMethod; overload;
    procedure HandleDestroy(info: TProgramInfo; ExternalObject: TObject);
    function GetMethod(MethodName: string): TMethod;
  protected
    procedure InitUnitTable(systemTable: TSystemSymbolTable; unitSyms: TUnitMainSymbols; operators: TOperators; UnitTable: TUnitSymbolTable); override;
    procedure OnCleanClass(ExternalObject: TObject);
    function GetScriptObjFromExternal(info: TProgramInfo; AObject: TObject): Variant;
    function GetExternalFromScriptObj(ScriptObj: Variant): TObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ConvertFuncParams(Params: TdwsParameters; const funcParams: array of string);

    function RegisterClass(const Name: string; const AncestorName: string = ''): TdwsClass;
    function RegisterConstructor(c: TdwsClass; Params: array of String; Visibility: TdwsVisibility = cvPublic; Attributes: TMethodAttributes = []): TdwsConstructor;
    procedure RegisterDestructor(c: TdwsClass);
    function RegisterMethod(c: TdwsClass; const MethodName, ResultType: string; Params: array of String; Visibility: TdwsVisibility = cvPublic; Attributes: TMethodAttributes = []): TdwsMethod; overload;
    function RegisterMethod(c: TdwsClass; const MethodName: string; Params: array of String; Visibility: TdwsVisibility = cvPublic; Attributes: TMethodAttributes = []): TdwsMethod; overload;
    function RegisterProperty(c: TdwsClass; const PropertyName, PropertyType: string; ReadWrite: Boolean): TdwsProperty; overload;
    function RegisterProperty(c: TdwsClass; const PropertyName, PropertyType: string; EvalRead: TMethodEvalEvent; EvalWrite: TMethodEvalEvent = nil): TdwsProperty; overload;
    function RegisterProperty(c: TdwsClass; const PropertyName, PropertyType: string; Params: array of String; EvalRead: TMethodEvalEvent; EvalWrite: TMethodEvalEvent = nil): TdwsProperty; overload;
  end;

implementation

{ TDW_Unit }

constructor TDW_Unit.Create(AOwner: TComponent);
begin
  inherited;
  FExternalInstances := TDictionary<Variant, TObject>.Create;
  FScriptObjInstances := TDictionary<TObject, Variant>.Create;
end;

destructor TDW_Unit.Destroy;
begin
  FExternalInstances.Free;
  FScriptObjInstances.Free;
  inherited;
end;

function TDW_Unit.GetExternalFromScriptObj(ScriptObj: Variant): TObject;
begin
  FExternalInstances.TryGetValue(ScriptObj, Result);
end;

function TDW_Unit.GetMethod(MethodName: string): TMethod;
begin
  Result.Data := Self;
  Result.Code := Self.MethodAddress(MethodName);
  Assert(Result.Code <> nil, 'Method ' + MethodName + ' not found');
end;

function TDW_Unit.GetScriptObjFromExternal(info: TProgramInfo; AObject: TObject): Variant;
begin
  Result := Unassigned;
  if not FScriptObjInstances.TryGetValue(AObject, Result) then
  begin
    Result := info.RegisterExternalObject(AObject, False, False);
    FScriptObjInstances.Add(AObject, Result);
    FExternalInstances.Add(Result, AObject);
  end;
end;

procedure TDW_Unit.HandleDestroy(info: TProgramInfo; ExternalObject: TObject);
var
  v: Variant;
begin
  if FScriptObjInstances.TryGetValue(ExternalObject, v) then
  begin
    FExternalInstances.Remove(v);
    FScriptObjInstances.Remove(ExternalObject);
  end;
  ExternalObject.Free;
end;

procedure TDW_Unit.InitUnitTable(systemTable: TSystemSymbolTable; unitSyms: TUnitMainSymbols; operators: TOperators; UnitTable: TUnitSymbolTable);
begin
  inherited;
  FExternalInstances.Clear;
  FScriptObjInstances.Clear;
end;

procedure TDW_Unit.OnCleanClass(ExternalObject: TObject);
// var
// v: variant;
begin
  // if FScriptObjInstances.TryGetValue(ExternalObject, v) then
  // begin
  // FExternalInstances.Remove(v);
  // FScriptObjInstances.Remove(ExternalObject);
  // end;
end;

procedure TDW_Unit.ConvertFuncParams(Params: TdwsParameters; const funcParams: array of string);

  procedure ParamSpecifier(c: WideChar; paramRec: TdwsParameter);
  begin
    paramRec.IsVarParam := (c = '@');
    // paramRec.IsConstParam := (c = '&');
    paramRec.Name := Copy(paramRec.Name, 2, MaxInt)
  end;

  procedure ParamDefaultValue(p: Integer; paramRec: TdwsParameter);
  begin
    paramRec.DefaultValue := Trim(Copy(paramRec.Name, p + 1, MaxInt));
    paramRec.HasDefaultValue := True;
    paramRec.Name := Trim(Copy(paramRec.Name, 1, p - 1));
  end;

var
  x, p: Integer;
  c: WideChar;
  paramRec: TdwsParameter;
begin
  x := 0;
  while x < Length(funcParams) - 1 do
  begin
    paramRec := Params.Add;

    paramRec.Name := funcParams[x];
    c := #0;
    if paramRec.Name <> '' then
      c := paramRec.Name[1];

    case c of
      '@', '&':
        ParamSpecifier(c, paramRec);
      else
        paramRec.IsVarParam := False;
        // paramRec.IsConstParam := False;
    end;

    p := Pos('=', paramRec.Name);
    if p > 0 then
      ParamDefaultValue(p, paramRec);

    paramRec.DataType := funcParams[x + 1];

    Inc(x, 2);
  end;
end;

function TDW_Unit.RegisterClass(const Name, AncestorName: string): TdwsClass;
begin
  Result := Classes.Add;
  Result.Name := Name;
  Result.Ancestor := AncestorName;
  Forwards.Add.Name := Result.Name;
  Result.OnCleanUp := OnCleanClass;
end;

function TDW_Unit.RegisterConstructor(c: TdwsClass; Params: array of String; Visibility: TdwsVisibility; Attributes: TMethodAttributes): TdwsConstructor;
begin
  Result := c.Constructors.Add;
  Result.Name := 'Create';
  ConvertFuncParams(Result.Parameters, Params);
  Result.OnEval := TAssignExternalObjectEvent(GetMethod('On' + c.Name + '_CreateEval'));
  Result.Attributes := Attributes;
  if c.Methods.IndexOf('Destroy') = -1 then
    RegisterMethod(c, mkDestructor, 'Destroy', '', [], HandleDestroy, cvPublic, [maOverride]);
end;

procedure TDW_Unit.RegisterDestructor(c: TdwsClass);
begin
  c.OnCleanUp := TObjectDestroyEvent(GetMethod('On' + c.Name + '_DestroyEval'));
end;

function TDW_Unit.RegisterMethod(c: TdwsClass; const MethodName, ResultType: string; Params: array of String; Visibility: TdwsVisibility; Attributes: TMethodAttributes): TdwsMethod;
begin
  Result := RegisterMethod(c, mkFunction, MethodName, ResultType, Params, TMethodEvalEvent(GetMethod('On' + c.Name + '_' + MethodName + 'Eval')), Visibility, Attributes);
end;

function TDW_Unit.RegisterMethod(c: TdwsClass; const MethodName: string; Params: array of String; Visibility: TdwsVisibility; Attributes: TMethodAttributes): TdwsMethod;
begin
  Result := RegisterMethod(c, mkProcedure, MethodName, '', Params, TMethodEvalEvent(GetMethod('On' + c.Name + '_' + MethodName + 'Eval')), Visibility, Attributes);
end;

function TDW_Unit.RegisterMethod(c: TdwsClass; Kind: TMethodKind; const MethodName, ResultType: string; Params: array of String; Event: TMethodEvalEvent; Visibility: TdwsVisibility = cvPublic; Attributes: TMethodAttributes = []): TdwsMethod;
begin
  Result := c.Methods.Add;
  Result.Name := MethodName;
  Result.ResultType := ResultType;
  Result.OnEval := Event;
  Result.Kind := Kind;
  Result.Attributes := Attributes;
  Result.Visibility := Visibility;
  ConvertFuncParams(Result.Parameters, Params);
end;

function TDW_Unit.RegisterProperty(c: TdwsClass; const PropertyName, PropertyType: string; Params: array of String; EvalRead, EvalWrite: TMethodEvalEvent): TdwsProperty;
var
  aRead, aWrite: string;
  p: array of string;
  i: Integer;
begin
  aRead := 'Get' + PropertyName;
  aWrite := '';
  RegisterMethod(c, mkFunction, aRead, PropertyType, Params, EvalRead, cvPrivate);
  if Assigned(EvalWrite) then
  begin
    aWrite := 'Set' + PropertyName;
    SetLength(p, Length(Params) + 2);
    for i := 0 to Pred(Length(Params)) do
      p[i] := Params[i];
    p[Length(p) - 2] := 'Value';
    p[Length(p) - 1] := PropertyType;
    RegisterMethod(c, mkProcedure, aWrite, '', p, EvalWrite, cvPrivate);
  end;
  Result := c.Properties.Add;
  with Result do
  begin
    Name := PropertyName;
    DataType := PropertyType;
    ReadAccess := aRead;
    WriteAccess := aWrite;
    ConvertFuncParams(Parameters, Params);
  end;
end;

function TDW_Unit.RegisterProperty(c: TdwsClass; const PropertyName, PropertyType: string; EvalRead, EvalWrite: TMethodEvalEvent): TdwsProperty;
begin
  Result := RegisterProperty(c, PropertyName, PropertyType, [], EvalRead, EvalWrite);
end;

function TDW_Unit.RegisterProperty(c: TdwsClass; const PropertyName, PropertyType: string; ReadWrite: Boolean): TdwsProperty;
begin
  with c.Fields.Add do
  begin
    Name := 'F' + PropertyName;
    DataType := PropertyType;
    Visibility := cvPrivate;
  end;
  Result := c.Properties.Add;
  with Result do
  begin
    Name := PropertyName;
    DataType := PropertyType;
    ReadAccess := 'F' + PropertyName;
    if ReadWrite then
      WriteAccess := ReadAccess;
  end;
end;

end.