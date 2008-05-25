unit Form_Preview;
{.$D-}
{$B-}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, ToolWin, Menus, Printers, PrintObject, ImgList;

type
  TFrmPreview = class(TForm, IPrintObjectPreview)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ImageList1: TImageList;
    Label1: TLabel;
    ToolButton13: TToolButton;
    PopupMenu1: TPopupMenu;
    ToolButton14: TToolButton;
    Panel: TPanel;
    ScrollBarV: TScrollBar;
    ScrollBarH: TScrollBar;
    Panelcoin: TPanel;
    Zoom: TComboBox;
    Panel2: TPanel;
    Image3: TImage;
    Label2: TLabel;
    Panel3: TPanel;
    Image2: TImage;
    Panel4: TPanel;
    fondImage: TPanel;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Panel5: TPanel;
    ImageDroite: TImage;
    Panel6: TPanel;
    ImageGauche: TImage;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure PopupClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ScrollBarVChange(Sender: TObject);
    procedure ScrollBarHChange(Sender: TObject);
    procedure ZoomChange(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageGaucheMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImageGaucheMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageGaucheMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    Fnumeropage: Integer;
    { D�clarations priv�es }
    function ShowPage(Page: Integer): Boolean;
    function Maximum: Integer;
    function PWidth: Integer;
    function PHeight: Integer;
    procedure Setnumeropage(const Value: Integer);
  public
    { D�clarations publiques }
    HeightMM: Single;
    WidthMM: Single;
    FPages: TList;
    PosClick: TPoint;
    Moving: Boolean;
    procedure Abort; safecall;
    procedure Quit; safecall;
    function Pages: TList; safecall;
    procedure SetHeightMM(const Value: Single); safecall;
    procedure SetWidthMM(const Value: Single); safecall;
    procedure SetCaption(const Title: string); safecall;
    procedure Start; safecall;
    property numeropage: Integer read Fnumeropage write Setnumeropage;
  end;

implementation

uses MMSystem, UHistorique;

resourcestring
  zoompleinepage = 'Pleine page';
  zoomecran = 'Largeur de fen�tre';
  listezoom = '';
  premiere = 'Premi�re page';
  suivante = 'Page suivante';
  precedente = 'Page pr�c�dente';
  derniere = 'Derni�re page';
  AllerA = 'Aller � la page...';
  numpage = 'Num�ro de page';
  nbpages = 'Nombre de pages';
  quitter = 'Fermer l''aper�u';

const
  CurHand = 300;

{$R *.DFM}
{$R *.res}

function Max(a, b: Integer): Integer;
begin
  if a > b then
    Result := a
  else
    Result := b;
end;

function Min(a, b: Integer): Integer;
begin
  if a < b then
    Result := a
  else
    Result := b;
end;

procedure TFrmPreview.Start;
begin
end;

function TFrmPreview.Maximum;
begin
  Result := Pages.Count;
end;

procedure AddNewItem(M: TPopupMenu; c: Integer; F: TFrmPreview);
var
  t: TMenuItem;
begin
  t := TMenuItem.Create(M);
  t.Caption := IntToStr(c);
  t.Tag := c;
  t.OnClick := F.PopupClick;
  M.Items.Add(t);
end;

procedure TFrmPreview.FormCreate(Sender: TObject);
begin
  fondImage.DoubleBuffered := True;
  Zoom.Items.Add(zoompleinepage);
  Zoom.Items.Add(zoomecran);
  Zoom.Items.Add('25%');
  Zoom.Items.Add('50%');
  Zoom.Items.Add('75%');
  Zoom.Items.Add('100%');
  Zoom.Items.Add('125%');
  Zoom.Items.Add('150%');
  Zoom.Items.Add('175%');
  Zoom.Items.Add('200%');
  Zoom.ItemIndex := 0;
  Zoom.Hint := listezoom;
  ToolButton1.Hint := premiere;
  ToolButton2.Hint := suivante;
  ToolButton3.Hint := precedente;
  ToolButton4.Hint := derniere;
  Label2.Hint := numpage;
  Image3.Hint := numpage;
  Label1.Hint := nbpages;
  Image2.Hint := nbpages;
  ToolButton8.Hint := quitter;
  Fnumeropage := 0;
  Icon := TApplication(Owner).Icon;
  FPages := TList.Create;
  ScrollBarV.Top := 0;
  ScrollBarV.Height := Panel.Height;
  ScrollBarV.Left := Panel.Width - ScrollBarV.Width;
  ScrollBarH.Left := 0;
  ScrollBarH.Width := Panel.Width;
  ScrollBarH.Top := Panel.Height - ScrollBarH.Height;
  PanelCoin.Height := ScrollBarH.Height;
  PanelCoin.Width := ScrollBarV.Width;
  PanelCoin.Top := ScrollBarH.Top;
  PanelCoin.Left := ScrollBarV.Left;
  ImageGauche.Cursor := CurHand;
  ImageDroite.Cursor := CurHand;
end;

procedure TFrmPreview.Quit;
begin
  Label1.Caption := IntToStr(maximum);
  Zoom.OnChange := nil;
  try
    Zoom.ItemIndex := Zoom.Items.IndexOf('100%'); // 5
  finally
    Zoom.OnChange := ZoomChange;
  end;
  ToolButton1.Click;
  Label1.AutoSize := False;
  Label2.AutoSize := False;
  Historique.AddWaiting(fcPreview, Integer(Self));
end;

procedure TFrmPreview.ToolButton8Click(Sender: TObject);
begin
  ModalResult := mrOk;
  Release;
end;

procedure TFrmPreview.ToolButton1Click(Sender: TObject);
begin
  if (numeropage <> 1) then ShowPage(1);
end;

procedure TFrmPreview.ToolButton2Click(Sender: TObject);
begin
  if ToolButton7.Down then begin
    if (numeropage > 1) then ShowPage(numeropage - 2);
  end
  else begin
    if (numeropage > 1) then ShowPage(numeropage - 1);
  end;
end;

procedure TFrmPreview.ToolButton3Click(Sender: TObject);
begin
  if ToolButton7.Down then begin
    if (numeropage < maximum) then ShowPage(numeropage + 2);
  end
  else begin
    if (numeropage < maximum) then ShowPage(numeropage + 1);
  end;
end;

procedure TFrmPreview.ToolButton4Click(Sender: TObject);
begin
  if (numeropage <> maximum) then ShowPage(maximum);
end;

procedure TFrmPreview.PopupClick(Sender: TObject);
var
  dummy: Integer;
begin
  if TComponent(Sender).Tag = 0 then
    dummy := StrToInt(InputBox(AllerA, AllerA, IntToStr(numeropage)))
  else
    dummy := TComponent(Sender).Tag;
  if (dummy in [1..maximum]) and (dummy <> numeropage) then ShowPage(dummy);
end;

procedure TFrmPreview.FormResize(Sender: TObject);
begin
  ScrollBarV.Top := 0;
  ScrollBarV.Height := Panel.Height;
  ScrollBarV.Left := Panel.Width - ScrollBarV.Width;

  ScrollBarH.Left := 0;
  ScrollBarH.Width := Panel.Width;
  ScrollBarH.Top := Panel.Height - ScrollBarH.Height;

  PanelCoin.Top := ScrollBarH.Top;
  PanelCoin.Left := ScrollBarV.Left;

  ShowPage(numeropage);
end;

function TFrmPreview.PWidth;
begin
  Result := Panel.Width;
  if ScrollBarV.Visible then Result := Panel.Width - ScrollBarV.Width;
end;

function TFrmPreview.PHeight;
begin
  Result := Panel.Height;
  if ScrollBarH.Visible then Result := Panel.Height - ScrollBarH.Height;
end;

function TFrmPreview.ShowPage(Page: Integer): Boolean;
const
  Interpage = 10;
var
  Source1, Source2: TGraphic;
  Source1Width, Source1Height, Source2Width, Source2Height: Integer;
  Rapport: Double;
  DoublePage: Boolean;
begin
  Source1 := nil;
  Source2 := nil;
  Source1Width := 0;
  Source1Height := 0;
  Source2Width := 0;
  Source2Height := 0;
  try
    DoublePage := ToolButton7.Down; // and (Page < Pred(Pages.Count));
    if DoublePage then begin
      if Page mod 2 = 1 then Dec(Page);
      //      if Page < 1 then Page := 1;
    end;

    if Page > 0 then begin
      Source1 := TGraphic(Pages[Page - 1]);
      Source1Width := Source1.Width;
      Source1Height := Source1.Height;
    end;
    if DoublePage and (Page < Pages.Count) then begin
      Source2 := TGraphic(Pages[Page]);
      Source2Width := Source2.Width;
      Source2Height := Source2.Height;
    end;

    case Zoom.ItemIndex + 1 of
      1: begin // pleine page
          fondImage.Top := 0;
          if DoublePage then
            Rapport := (Max(Source1Width, Source2Width) * 2 + Interpage) / Max(Source1Height, Source2Height)
          else
            Rapport := Source1Width / Source1Height;
          fondImage.Width := Round(Panel.Height * Rapport);
          fondImage.Height := Panel.Height;

          ScrollBarV.Visible := False;
          ScrollBarH.Visible := False;
          PanelCoin.Visible := False;
        end;
      2: begin // largeur de page
          if DoublePage then
            Rapport := (Max(Source1Width, Source2Width) * 2 + Interpage) / Max(Source1Height, Source2Height)
          else
            Rapport := Source1Width / Source1Height;
          ScrollBarV.Visible := Rapport > (Panel.Height / Panel.Width);
          ScrollBarV.Height := Panel.Height;
          ScrollBarH.Visible := False;
          PanelCoin.Visible := False;

          fondImage.Width := PWidth;
          fondImage.Height := Round(PWidth / Rapport);
        end;
      else begin
          Rapport := StrToInt(Copy(Zoom.Items[Zoom.ItemIndex], 1, Length(Zoom.Items[Zoom.ItemIndex]) - 1)) / 100;
          if DoublePage then
            fondImage.Width := Round(WidthMM * 2 * Screen.PixelsPerInch * 56.7 / 1440 * Rapport)
          else
            fondImage.Width := Round(WidthMM * Screen.PixelsPerInch * 56.7 / 1440 * Rapport);
          fondImage.Height := Round(HeightMM * Screen.PixelsPerInch * 56.7 / 1440 * Rapport);
          ScrollBarV.Visible := fondImage.Height > (Panel.Height - ScrollBarH.Height);
          ScrollBarH.Visible := fondImage.Width > (Panel.Width - ScrollBarV.Width);
          ScrollBarV.Height := PHeight;
          ScrollBarH.Width := PWidth;
          PanelCoin.Visible := ScrollBarV.Visible and ScrollBarH.Visible;
        end;
    end;

    if not DoublePage then begin
      ImageGauche.Width := fondImage.Width;
      ImageGauche.Height := fondImage.Height;
    end
    else begin
      Rapport := Max(Source1Width, Source2Width) / Max(Source1Height, Source2Height);

      ImageGauche.Width := Round(fondImage.Height * Rapport);
      ImageGauche.Height := fondImage.Height;

      ImageDroite.Width := ImageGauche.Width;
      ImageDroite.Height := ImageGauche.Height;
    end;

    ImageGauche.Picture.Assign(Source1);
    if not Assigned(Source1) then
      Panel6.ParentColor := True
    else
      Panel6.Color := clWhite;
    ImageDroite.Picture.Assign(Source2);
    if not Assigned(Source2) then
      Panel5.ParentColor := True
    else
      Panel5.Color := clWhite;
    //    if DoublePage and not Assigned(Source2) then
    //      ImageDroite.SetBounds(ImageDroite.Left, ImageDroite.Top, ImageGauche.Width, ImageGauche.Height);
    //    if DoublePage and not Assigned(Source1) then
    //      ImageGauche.SetBounds(ImageGauche.Left, ImageGauche.Top, ImageDroite.Width, ImageDroite.Height);

    Panel6.Left := 0;
    Panel5.Left := Panel6.Width + Interpage;
    Panel5.Visible := DoublePage;

    OnResize := FormResize;

    ScrollBarV.Min := 0;
    ScrollBarV.Max := Abs(fondImage.Height - PHeight);
    ScrollBarV.LargeChange := PHeight;
    ScrollBarV.SmallChange := PHeight div 5;

    ScrollBarH.Min := 0;
    ScrollBarH.Max := Abs(fondImage.Width - PWidth);
    ScrollBarH.LargeChange := PWidth;
    ScrollBarH.SmallChange := PWidth div 5;

    if not ScrollBarH.Visible then
      fondImage.Left := (PWidth - fondImage.Width) div 2
    else if (fondImage.Left > 0) then
      fondImage.Left := 0;
    if not ScrollBarV.Visible then
      fondImage.Top := (PHeight - fondImage.Height) div 2
    else if (fondImage.Top > 0) then
      fondImage.Top := 0;
    if fondImage.Top <= 0 then ScrollBarV.Position := -fondImage.Top;
    if fondImage.Left <= 0 then ScrollBarH.Position := -fondImage.Left;

    Result := True;
    numeropage := Min(FPages.Count, Max(1, Page));
  except
    Result := False;
  end;
end;

procedure TFrmPreview.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  OnResize := nil;
  for i := 0 to Maximum - 1 do
    TImage(Pages[i]).Free;
  Pages.Free;
end;

procedure TFrmPreview.ScrollBarVChange(Sender: TObject);
begin
  if not Moving then fondImage.Top := -ScrollBarV.Position;
end;

procedure TFrmPreview.ScrollBarHChange(Sender: TObject);
begin
  if not Moving then fondImage.Left := -ScrollBarH.Position;
end;

procedure TFrmPreview.ZoomChange(Sender: TObject);
begin
  ShowPage(numeropage);
end;

procedure TFrmPreview.PopupMenu1Popup(Sender: TObject);
var
  i: Integer;
  debut, fin: Integer;
  t: TMenuItem;
begin
  for i := 0 to PopupMenu1.Items.Count - 1 do
    PopupMenu1.Items[0].Free;
  debut := Max(numeropage - 5, 1);
  fin := Min(debut + 10, maximum);
  debut := Max(fin - 10, 1);
  for i := debut to fin do
    AddNewItem(PopupMenu1, i, Self);
  if Maximum > 10 then begin
    t := TMenuItem.Create(PopupMenu1);
    t.Caption := AllerA;
    t.Tag := 0;
    t.OnClick := Self.PopupClick;
    PopupMenu1.Items.Add(t);
  end;
end;

procedure TFrmPreview.FormActivate(Sender: TObject);
begin
  //  ShowNoPage;
end;

procedure TFrmPreview.Image3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
begin
  if (Sender = Image3) or (Sender = Label2) then PopupMenu1.Alignment := paLeft;
  if (Sender = Panel4) then PopupMenu1.Alignment := paCenter;
  if (Sender = Image2) or (Sender = Label1) then PopupMenu1.Alignment := paRight;

  pos.x := X;
  pos.y := Image3.Top + Image3.Height;
  pos := TWinControl(Sender).ClientToScreen(pos);
  PopupMenu1.Popup(pos.x, pos.y);
end;

procedure TFrmPreview.ImageGaucheMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  oldImageLeft, oldImageTop: Integer;
  newImageLeft, newImageTop: Integer;
begin
  if Shift <> [ssLeft] then Exit;

  oldImageLeft := fondImage.Left;
  oldImageTop := fondImage.Top;

  newImageLeft := fondImage.Left;
  newImageTop := fondImage.Top;

  if ScrollBarH.Visible then newImageLeft := Max(-ScrollBarH.Max, Min(ScrollBarH.Min, fondImage.Left + (X - PosClick.x)));
  if ScrollBarV.Visible then newImageTop := Max(-ScrollBarV.Max, Min(ScrollBarV.Min, fondImage.Top + (Y - PosClick.y)));
  fondImage.Left := newImageLeft;
  fondImage.Top := newImageTop;
  ScrollBarH.Position := -fondImage.Left;
  ScrollBarV.Position := -fondImage.Top;

  if oldImageLeft = fondImage.Left then PosClick.X := X;
  if oldImageTop = fondImage.Top then PosClick.Y := Y;
end;

procedure TFrmPreview.ImageGaucheMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  MonRect: TRect;
begin
  GetWindowRect(Panel.Handle, MonRect);
  ClipCursor(@MonRect);
  PosClick := Point(X, Y);
end;

procedure TFrmPreview.ImageGaucheMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Moving := False;
  ClipCursor(nil);
end;

procedure TFrmPreview.Abort;
begin
  Self.Release;
end;

function TFrmPreview.Pages: TList;
begin
  Result := FPages;
end;

procedure TFrmPreview.SetCaption(const Title: string);
begin
  Caption := Title;
end;

procedure TFrmPreview.SetHeightMM(const Value: Single);
begin
  HeightMM := Value;
end;

procedure TFrmPreview.SetWidthMM(const Value: Single);
begin
  WidthMM := Value;
end;

procedure TFrmPreview.ToolButton6Click(Sender: TObject);
begin
  with TPrintObject.Create(nil) do try
    Titre := Caption;
    PrintPages(Pages);
  finally
    Free;
  end;
end;

procedure TFrmPreview.ToolButton7Click(Sender: TObject);
begin
  ShowPage(numeropage);
end;

procedure TFrmPreview.Setnumeropage(const Value: Integer);
begin
  Fnumeropage := Value;

  ToolButton1.Enabled := Fnumeropage > 1;
  ToolButton2.Enabled := Fnumeropage > 1;
  ToolButton3.Enabled := Fnumeropage < maximum;
  ToolButton4.Enabled := Fnumeropage < maximum;

  Label2.Caption := Format('%.*d', [Length(Label1.Caption), Fnumeropage]);
end;

initialization
  Screen.Cursors[CurHand] := LoadCursor(HInstance, 'HAND');

end.
