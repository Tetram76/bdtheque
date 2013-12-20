unit JsonDeserializer;

interface

uses
  System.SysUtils, System.Rtti, System.Generics.Collections, System.TypInfo, dwsJSON, Commun,
  EntitiesLite, EntitiesFull, System.Classes, UMetadata;

type
{$TYPEINFO ON}
{$RTTI EXPLICIT METHODS([vcPrivate, vcPublic, vcProtected])}
  TJsonDeserializer = class
  strict private
    class var RttiContext: TRttiContext;
    class var FJsonReaders: TDictionary<PTypeInfo, TRttiMethod>;
    class procedure EnsureJsonReadersCache;
  protected
    class procedure ReadStringListFromJSON(list: TStrings; json: TdwsJSONArray);
    class procedure ReadStringListWithValuesFromJSON(list: TStrings; json: TdwsJSONArray);
    class procedure ReadListLiteFromJSON<T: TBaseLite, constructor>(list: TList<T>; json: TdwsJSONArray);
    class procedure ReadListFullFromJSON<T: TBaseFull, constructor>(list: TList<T>; json: TdwsJSONArray);

    class function ReadValueFromJSON(const Name: string; const Default: string; json: TdwsJSONObject): string; overload; inline;
    class function ReadValueFromJSON(const Name: string; const Default: Integer; json: TdwsJSONObject): Integer; overload; inline;
    class function ReadValueFromJSON(const Name: string; const Default: Currency; json: TdwsJSONObject): Currency; overload; inline;
    class function ReadValueFromJSON(const Name: string; const Default: Boolean; json: TdwsJSONObject): Boolean; overload; inline;
    class function ReadValueFromJSON(const Name: string; const Default: ROption; json: TdwsJSONObject): ROption; overload; inline;
    class function ReadValueFromJSON(const Name: string; const Default: RGUIDEx; json: TdwsJSONObject): RGUIDEx; overload; inline;
    class function ReadValueFromJSON(const Name: string; const Default: TMetierAuteur; json: TdwsJSONObject): TMetierAuteur; overload; inline;
    class procedure ReadValueFromJSON(const Name: string; Value: TStrings; json: TdwsJSONObject; ItemsHasValues: Boolean = False); overload; inline;
  public
    class constructor Create;
    class destructor Destroy;

    class procedure LoadFromJson<T: class>(Obj: T; const json: string);
    class function BuildFromJson<T: class, constructor>(const json: string): T; overload;
    class function BuildFromJson<T: class, constructor>(json: TdwsJSONObject): T; overload;

    class procedure ReadFromJSON(Obj: TObject; json: TdwsJSONObject);
  end;

implementation

{ TJsonDeserializer }

class function TJsonDeserializer.BuildFromJson<T>(json: TdwsJSONObject): T;
begin
  Result := T.Create;
  ReadFromJSON(Result, json);
end;

class function TJsonDeserializer.BuildFromJson<T>(const json: string): T;
var
  o: TdwsJSONObject;
begin
  o := TdwsJSONObject.ParseString(json) as TdwsJSONObject;
  try
    Result := BuildFromJson<T>(o);
  finally
    o.Free;
  end;
end;

class constructor TJsonDeserializer.Create;
begin
  FJsonReaders := TDictionary<PTypeInfo, TRttiMethod>.Create;
end;

class destructor TJsonDeserializer.Destroy;
begin
  FJsonReaders.Free;
end;

class procedure TJsonDeserializer.EnsureJsonReadersCache;
var
  m: TRttiMethod;
begin
  if FJsonReaders.Count > 0 then
    Exit;

  for m in RttiContext.GetType(Self).GetMethods('ProcessReadFromJSON') do
    FJsonReaders.Add(m.GetParameters[0].ParamType.Handle, m);
end;

class procedure TJsonDeserializer.LoadFromJson<T>(Obj: T; const json: string);
var
  o: TdwsJSONObject;
begin
  o := TdwsJSONObject.ParseString(json) as TdwsJSONObject;
  try
    ReadFromJSON(Obj, o);
  finally
    o.Free;
  end;
end;

class procedure TJsonDeserializer.ReadFromJSON(Obj: TObject; json: TdwsJSONObject);
var
  params: array [0 .. 1] of TValue;
  m: TRttiMethod;
  c: TClass;
  listMethods: TList<TRttiMethod>;
begin
  if not json.IsDefined then
    Exit;

  EnsureJsonReadersCache;

  listMethods := TList<TRttiMethod>.Create;
  try
    c := Obj.ClassType;
    while c.ClassParent <> nil do
    begin
      if FJsonReaders.TryGetValue(c.ClassInfo, m) then
        listMethods.Add(m);
      c := c.ClassParent;
    end;

    listMethods.Reverse;

    for m in listMethods do
    begin
      TValue.Make(@Obj, c.ClassInfo, params[0]);
      TValue.Make(@json, json.ClassInfo, params[1]);
      m.Invoke(Self, params);
    end;
  finally
    listMethods.Free;
  end;
end;

class procedure TJsonDeserializer.ReadListFullFromJSON<T>(list: TList<T>; json: TdwsJSONArray);
var
  i: Integer;
begin
  if json = nil then
    Exit;

  list.Clear;
  for i := 0 to Pred(json.ElementCount) do
    list.Add(BuildFromJson<T>(json.Elements[i] as TdwsJSONObject));
end;

class procedure TJsonDeserializer.ReadListLiteFromJSON<T>(list: TList<T>; json: TdwsJSONArray);
var
  i: Integer;
begin
  if json = nil then
    Exit;

  list.Clear;
  for i := 0 to Pred(json.ElementCount) do
    list.Add(BuildFromJson<T>(json.Elements[i] as TdwsJSONObject));
end;

class procedure TJsonDeserializer.ReadStringListFromJSON(list: TStrings; json: TdwsJSONArray);
var
  i: Integer;
begin
  if json = nil then
    Exit;

  list.Clear;
  for i := 0 to Pred(json.ElementCount) do
    list.Add(json.Elements[i].AsString);
end;

class procedure TJsonDeserializer.ReadStringListWithValuesFromJSON(list: TStrings; json: TdwsJSONArray);
var
  i: Integer;
begin
  if json = nil then
    Exit;

  list.Clear;
  for i := 0 to Pred(json.ElementCount) do
    list.Values[json.Names[i]] := json.Elements[i].AsString;
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: ROption; json: TdwsJSONObject): ROption;
var
  o: TdwsJSONObject;
begin
  o := json.Items[Name] as TdwsJSONObject;
  if o = nil then
    Result := Default
  else
  begin
    Result.Value := StrToInt(o.Names[0]);
    Result.Caption := ReadValueFromJSON(IntToStr(Result.Value), Result.Caption, o);
  end;
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: Boolean; json: TdwsJSONObject): Boolean;
var
  o: TdwsJSONValue;
begin
  o := json.Items[Name];
  if o = nil then
    Result := Default
  else
    Result := o.AsBoolean;
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: Integer; json: TdwsJSONObject): Integer;
var
  o: TdwsJSONValue;
begin
  o := json.Items[Name];
  if o = nil then
    Result := Default
  else
    Result := o.AsInteger;
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: string; json: TdwsJSONObject): string;
var
  o: TdwsJSONValue;
begin
  o := json.Items[Name];
  if o = nil then
    Result := Default
  else
    Result := o.AsString;
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: RGUIDEx; json: TdwsJSONObject): RGUIDEx;
begin
  Result := ReadValueFromJSON(Name, string(Default), json);
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: Currency; json: TdwsJSONObject): Currency;
var
  o: TdwsJSONValue;
begin
  o := json.Items[Name];
  if o = nil then
    Result := Default
  else
    Result := o.AsNumber;
end;

class procedure TJsonDeserializer.ReadValueFromJSON(const Name: string; Value: TStrings; json: TdwsJSONObject; ItemsHasValues: Boolean);
var
  o: TdwsJSONValue;
begin
  o := json.Items[Name];
  if o <> nil then
    if ItemsHasValues then
      ReadStringListWithValuesFromJSON(Value, o as TdwsJSONArray)
    else
      ReadStringListFromJSON(Value, o as TdwsJSONArray);
end;

class function TJsonDeserializer.ReadValueFromJSON(const Name: string; const Default: TMetierAuteur; json: TdwsJSONObject): TMetierAuteur;
begin
  Result := TMetierAuteur(ReadValueFromJSON(Name, 0, json));
end;

end.
