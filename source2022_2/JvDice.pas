{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvDice.PAS, released on 2002-07-04.

The Initial Developers of the Original Code are: Fedor Koshevnikov, Igor Pavluk and Serge Korolev
Copyright (c) 1997, 1998 Fedor Koshevnikov, Igor Pavluk and Serge Korolev
Copyright (c) 2001,2002 SGB Software
All Rights Reserved.

Contributor(s):
  Polaris Software

Last Modified: 2002-07-04

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

unit JvDice;

interface

uses
  SysUtils,
  {$IFDEF WIN32}
  Windows,
  {$ELSE}
  WinTypes, WinProcs,
  {$ENDIF}
  Classes, Graphics, Messages, Controls, Forms, Menus,
  JvTimer;

type
  TJvDiceValue = 1..6;

  TJvDice = class(TCustomControl)
  private
    FActive: Boolean;
    FAutoSize: Boolean;
    FBitmap: TBitmap;
    FInterval: Cardinal;
    FAutoStopInterval: Cardinal;
    FOnChange: TNotifyEvent;
    FRotate: Boolean;
    FShowFocus: Boolean;
    FTimer: TJvTimer;
    FTickCount: Longint;
    FValue: TJvDiceValue;
    FOnStart: TNotifyEvent;
    FOnStop: TNotifyEvent;
    procedure CMFocusChanged(var Msg: TCMFocusChanged); message CM_FOCUSCHANGED;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure CreateBitmap;
    {$IFNDEF COMPILER6_UP} // Polaris
    procedure SetAutoSize(Value: Boolean);
    {$ENDIF}
    procedure SetInterval(Value: Cardinal);
    procedure SetRotate(Value: Boolean);
    procedure SetShowFocus(Value: Boolean);
    procedure SetValue(Value: TJvDiceValue);
    procedure TimerExpired(Sender: TObject);
  protected
    {$IFDEF COMPILER6_UP} // Polaris
    procedure SetAutoSize(Value: Boolean); override;
    {$ENDIF}
    function GetPalette: HPALETTE; override;
    procedure AdjustSize;
    {$IFDEF COMPILER4_UP} override;
    {$ENDIF}
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure Change; dynamic;
    procedure DoStart; dynamic;
    procedure DoStop; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RandomValue;
  published
    property Align;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property AutoStopInterval: Cardinal read FAutoStopInterval write FAutoStopInterval default 0;
    property Color;
    property Cursor;
    property DragMode;
    property DragCursor;
    property Enabled;
    property Interval: Cardinal read FInterval write SetInterval default 60;
    property ParentColor;
    property ParentShowHint;
    property PopupMenu;
    property Rotate: Boolean read FRotate write SetRotate;
    property ShowFocus: Boolean read FShowFocus write SetShowFocus;
    property ShowHint;
    {$IFDEF COMPILER4_UP}
    property Anchors;
    property Constraints;
    property DragKind;
    {$ENDIF}
    property TabOrder;
    property TabStop;
    property Value: TJvDiceValue read FValue write SetValue default 1;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseMove;
    property OnMouseDown;
    property OnMouseUp;
    property OnKeyDown;
    property OnKeyUp;
    property OnKeyPress;
    property OnDragOver;
    property OnDragDrop;
    property OnEndDrag;
    {$IFDEF WIN32}
    property OnStartDrag;
    {$ENDIF}
    {$IFDEF COMPILER5_UP}
    property OnContextPopup;
    {$ENDIF}
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
    {$IFDEF COMPILER4_UP}
    property OnEndDock;
    property OnStartDock;
    {$ENDIF}
  end;

implementation

{$IFDEF WIN32}
{$R *.Res}
{$ELSE}
{$R *.R16}
{$ENDIF}

const
  ResName: array [TJvDiceValue] of PChar =
  ('JV_DICE1', 'JV_DICE2', 'JV_DICE3', 'JV_DICE4', 'JV_DICE5', 'JV_DICE6');

constructor TJvDice.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Randomize;
  ControlStyle := [csClickEvents, csSetCaption, csCaptureMouse,
    csOpaque, csDoubleClicks];
  FValue := 1;
  FInterval := 60;
  CreateBitmap;
  FAutoSize := True;
  Width := FBitmap.Width + 2;
  Height := FBitmap.Height + 2;
end;

destructor TJvDice.Destroy;
begin
  FOnChange := nil;
  FBitmap.Free;
  inherited Destroy;
end;

function TJvDice.GetPalette: HPALETTE;
begin
  if FBitmap <> nil then
    Result := FBitmap.Palette
  else
    Result := 0;
end;

procedure TJvDice.RandomValue;
var
  Val: Byte;
begin
  Val := Random(6) + 1;
  if Val = Byte(FValue) then
    if Val = 1 then
      Inc(Val)
    else
      Dec(Val);
  SetValue(TJvDiceValue(Val));
end;

procedure TJvDice.DoStart;
begin
  if Assigned(FOnStart) then
    FOnStart(Self);
end;

procedure TJvDice.DoStop;
begin
  if Assigned(FOnStop) then
    FOnStop(Self);
end;

procedure TJvDice.CMFocusChanged(var Msg: TCMFocusChanged);
var
  Active: Boolean;
begin
  with Msg do
    Active := (Sender = Self);
  if Active <> FActive then
  begin
    FActive := Active;
    if FShowFocus then
      Invalidate;
  end;
  inherited;
end;

procedure TJvDice.WMSize(var Msg: TWMSize);
begin
  inherited;
  {$IFNDEF COMPILER4_UP}
  AdjustSize;
  {$ENDIF}
end;

procedure TJvDice.CreateBitmap;
begin
  if FBitmap = nil then
    FBitmap := TBitmap.Create;
  FBitmap.Handle := LoadBitmap(HInstance, ResName[FValue]);
end;

procedure TJvDice.AdjustSize;
var
  MinSide: Integer;
begin
  if not (csReading in ComponentState) then
  begin
    if AutoSize and Assigned(FBitmap) and (FBitmap.Width > 0) and
      (FBitmap.Height > 0) then
      SetBounds(Left, Top, FBitmap.Width + 2, FBitmap.Height + 2)
    else
    begin
      { Adjust aspect ratio if control size changed }
      MinSide := Width;
      if Height < Width then
        MinSide := Height;
      SetBounds(Left, Top, MinSide, MinSide);
    end;
  end;
end;

procedure TJvDice.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and TabStop and CanFocus then
    SetFocus;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TJvDice.Paint;
var
  ARect: TRect;

  procedure DrawBitmap;
  var
    TmpImage: TBitmap;
    IWidth, IHeight: Integer;
    IRect: TRect;
  begin
    IWidth := FBitmap.Width;
    IHeight := FBitmap.Height;
    IRect := Rect(0, 0, IWidth, IHeight);
    TmpImage := TBitmap.Create;
    try
      TmpImage.Width := IWidth;
      TmpImage.Height := IHeight;
      TmpImage.Canvas.Brush.Color := Self.Brush.Color;
      TmpImage.Canvas.BrushCopy(IRect, FBitmap, IRect, FBitmap.TransparentColor);
      InflateRect(ARect, -1, -1);
      Canvas.StretchDraw(ARect, TmpImage);
    finally
      TmpImage.Free;
    end;
  end;

begin
  ARect := ClientRect;
  if FBitmap <> nil then
    DrawBitmap;
  if Focused and FShowFocus and TabStop and not (csDesigning in ComponentState) then
    Canvas.DrawFocusRect(ARect);
end;

procedure TJvDice.TimerExpired(Sender: TObject);
var
  ParentForm: TCustomForm;
  Now: Longint;
begin
  RandomValue;
  if not FRotate then
  begin
    FTimer.Free;
    FTimer := nil;
    if csDesigning in ComponentState then
    begin
      ParentForm := GetParentForm(Self);
      if ParentForm <> nil then
        ParentForm.Designer.Modified;
    end;
    DoStop;
  end
  else
  if AutoStopInterval > 0 then
  begin
    Now := GetTickCount;
    {$IFDEF COMPILER4_UP}
    if (Now - FTickCount >= Integer(AutoStopInterval)) or (Now < FTickCount) then
    {$ELSE}
    if (Now - FTickCount >= AutoStopInterval) or (Now < FTickCount) then
    {$ENDIF}
      Rotate := False;
  end;
end;

procedure TJvDice.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TJvDice.SetValue(Value: TJvDiceValue);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    CreateBitmap;
    Invalidate;
    Change;
  end;
end;

procedure TJvDice.SetAutoSize(Value: Boolean);
begin
  {$IFDEF COMPILER6_UP}
  inherited SetAutoSize(Value);
  {$ENDIF}
  FAutoSize := Value;
  AdjustSize;
  Invalidate;
end;

procedure TJvDice.SetInterval(Value: Cardinal);
begin
  if FInterval <> Value then
  begin
    FInterval := Value;
    if FTimer <> nil then
      FTimer.Interval := FInterval;
  end;
end;

procedure TJvDice.SetRotate(Value: Boolean);
begin
  if FRotate <> Value then
  begin
    if Value then
    begin
      if FTimer = nil then
        FTimer := TJvTimer.Create(Self);
      try
        with FTimer do
        begin
          OnTimer := TimerExpired;
          Interval := FInterval;
          Enabled := True;
        end;
        FRotate := Value;
        FTickCount := GetTickCount;
        DoStart;
      except
        FTimer.Free;
        FTimer := nil;
        raise;
      end;
    end
    else
      FRotate := Value;
  end;
end;

procedure TJvDice.SetShowFocus(Value: Boolean);
begin
  if FShowFocus <> Value then
  begin
    FShowFocus := Value;
    if not (csDesigning in ComponentState) then
      Invalidate;
  end;
end;

end.

