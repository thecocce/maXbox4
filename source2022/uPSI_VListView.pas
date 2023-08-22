unit uPSI_VListView;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility

}
interface
 
uses
   SysUtils
  ,Classes
  ,uPSComponent
  ,uPSRuntime
  ,uPSCompiler
  ;
 
type 
(*----------------------------------------------------------------------------*)
  TPSImport_VListView = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TForm1(CL: TPSPascalCompiler);
procedure SIRegister_VListView(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TForm1(CL: TPSRuntimeClassImporter);
procedure RIRegister_VListView(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Messages
  ,Graphics
  ,Controls
  ,Forms
  ,Dialogs
  ,ComCtrls
  ,StdCtrls
  ,ToolWin
  ,ShlObj
  ,ImgList
  ,Menus
  ,VListView
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_VListView]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TForm1(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TForm', 'TForm1') do
  with CL.AddClassN(CL.FindClass('TForm'),'TFormListView') do
  begin
    RegisterProperty('ListView', 'TListView', iptrw);
    RegisterProperty('CoolBar1', 'TCoolBar', iptrw);
    RegisterProperty('ToolBar2', 'TToolBar', iptrw);
    RegisterProperty('ToolbarImages', 'TImageList', iptrw);
    RegisterProperty('btnBrowse', 'TToolButton', iptrw);
    RegisterProperty('btnLargeIcons', 'TToolButton', iptrw);
    RegisterProperty('btnSmallIcons', 'TToolButton', iptrw);
    RegisterProperty('btnList', 'TToolButton', iptrw);
    RegisterProperty('btnReport', 'TToolButton', iptrw);
    RegisterProperty('cbPath', 'TComboBox', iptrw);
    RegisterProperty('ToolButton3', 'TToolButton', iptrw);
    RegisterProperty('PopupMenu1', 'TPopupMenu', iptrw);
    RegisterProperty('btnBack', 'TToolButton', iptrw);
    RegisterMethod('Procedure FormCreate( Sender : TObject)');
    RegisterMethod('Procedure ListViewData( Sender : TObject; Item : TListItem)');
    RegisterMethod('Procedure btnBrowseClick( Sender : TObject)');
    RegisterMethod('Procedure cbPathKeyDown( Sender : TObject; var Key : Word; Shift : TShiftState)');
    RegisterMethod('Procedure cbPathClick( Sender : TObject)');
    RegisterMethod('Procedure btnLargeIconsClick( Sender : TObject)');
    RegisterMethod('Procedure ListViewDblClick( Sender : TObject)');
    RegisterMethod('Procedure ListViewDataHint( Sender : TObject; StartIndex, EndIndex : Integer)');
    RegisterMethod('Procedure ListViewKeyDown( Sender : TObject; var Key : Word; Shift : TShiftState)');
    RegisterMethod('Procedure ListViewDataFind( Sender : TObject; Find : TItemFind; const FindString : String; const FindPosition : TPoint; FindData : Pointer; StartIndex : Integer; Direction : TSearchDirection; Wrap : Boolean; var Index : Integer)');
    RegisterMethod('Procedure ListViewCustomDrawItem( Sender : TCustomListView; Item : TListItem; State : TCustomDrawState; var DefaultDraw : Boolean)');
    RegisterMethod('Procedure ListViewCustomDrawSubItem( Sender : TCustomListView; Item : TListItem; SubItem : Integer; State : TCustomDrawState; var DefaultDraw : Boolean)');
    RegisterMethod('Procedure btnBackClick( Sender : TObject)');
    RegisterMethod('Procedure Form1Close( Sender : TObject; var Action : TCloseAction)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_VListView(CL: TPSPascalCompiler);
begin
  SIRegister_TForm1(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
Procedure TForm1SetPath1_P(Self: TFormListView;  ID : PItemIDList);
Begin //Self.SetPath(ID);
 END;

(*----------------------------------------------------------------------------*)
Procedure TForm1SetPath_P(Self: TFormListView;  const Value : string);
Begin //Self.SetPath(Value);
 END;

(*----------------------------------------------------------------------------*)
procedure TForm1btnBack_W(Self: TFormListView; const T: TToolButton);
Begin Self.btnBack := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnBack_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.btnBack; end;

(*----------------------------------------------------------------------------*)
procedure TForm1PopupMenu1_W(Self: TFormListView; const T: TPopupMenu);
Begin Self.PopupMenu1 := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1PopupMenu1_R(Self: TFormListView; var T: TPopupMenu);
Begin T := Self.PopupMenu1; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ToolButton3_W(Self: TFormListView; const T: TToolButton);
Begin Self.ToolButton3 := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ToolButton3_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.ToolButton3; end;

(*----------------------------------------------------------------------------*)
procedure TForm1cbPath_W(Self: TFormListView; const T: TComboBox);
Begin Self.cbPath := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1cbPath_R(Self: TFormListView; var T: TComboBox);
Begin T := Self.cbPath; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnReport_W(Self: TFormListView; const T: TToolButton);
Begin Self.btnReport := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnReport_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.btnReport; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnList_W(Self: TFormListView; const T: TToolButton);
Begin Self.btnList := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnList_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.btnList; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnSmallIcons_W(Self: TFormListView; const T: TToolButton);
Begin Self.btnSmallIcons := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnSmallIcons_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.btnSmallIcons; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnLargeIcons_W(Self: TFormListView; const T: TToolButton);
Begin Self.btnLargeIcons := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnLargeIcons_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.btnLargeIcons; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnBrowse_W(Self: TFormListView; const T: TToolButton);
Begin Self.btnBrowse := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1btnBrowse_R(Self: TFormListView; var T: TToolButton);
Begin T := Self.btnBrowse; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ToolbarImages_W(Self: TFormListView; const T: TImageList);
Begin Self.ToolbarImages := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ToolbarImages_R(Self: TFormListView; var T: TImageList);
Begin T := Self.ToolbarImages; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ToolBar2_W(Self: TFormListView; const T: TToolBar);
Begin Self.ToolBar2 := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ToolBar2_R(Self: TFormListView; var T: TToolBar);
Begin T := Self.ToolBar2; end;

(*----------------------------------------------------------------------------*)
procedure TForm1CoolBar1_W(Self: TFormListView; const T: TCoolBar);
Begin Self.CoolBar1 := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1CoolBar1_R(Self: TFormListView; var T: TCoolBar);
Begin T := Self.CoolBar1; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ListView_W(Self: TFormListView; const T: TListView);
Begin Self.ListView := T; end;

(*----------------------------------------------------------------------------*)
procedure TForm1ListView_R(Self: TFormListView; var T: TListView);
Begin T := Self.ListView; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TForm1(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TFormListView) do
  begin
    RegisterPropertyHelper(@TForm1ListView_R,@TForm1ListView_W,'ListView');
    RegisterPropertyHelper(@TForm1CoolBar1_R,@TForm1CoolBar1_W,'CoolBar1');
    RegisterPropertyHelper(@TForm1ToolBar2_R,@TForm1ToolBar2_W,'ToolBar2');
    RegisterPropertyHelper(@TForm1ToolbarImages_R,@TForm1ToolbarImages_W,'ToolbarImages');
    RegisterPropertyHelper(@TForm1btnBrowse_R,@TForm1btnBrowse_W,'btnBrowse');
    RegisterPropertyHelper(@TForm1btnLargeIcons_R,@TForm1btnLargeIcons_W,'btnLargeIcons');
    RegisterPropertyHelper(@TForm1btnSmallIcons_R,@TForm1btnSmallIcons_W,'btnSmallIcons');
    RegisterPropertyHelper(@TForm1btnList_R,@TForm1btnList_W,'btnList');
    RegisterPropertyHelper(@TForm1btnReport_R,@TForm1btnReport_W,'btnReport');
    RegisterPropertyHelper(@TForm1cbPath_R,@TForm1cbPath_W,'cbPath');
    RegisterPropertyHelper(@TForm1ToolButton3_R,@TForm1ToolButton3_W,'ToolButton3');
    RegisterPropertyHelper(@TForm1PopupMenu1_R,@TForm1PopupMenu1_W,'PopupMenu1');
    RegisterPropertyHelper(@TForm1btnBack_R,@TForm1btnBack_W,'btnBack');
    RegisterMethod(@TFormListView.FormCreate, 'FormCreate');
    RegisterMethod(@TFormListView.ListViewData, 'ListViewData');
    RegisterMethod(@TFormListView.btnBrowseClick, 'btnBrowseClick');
    RegisterMethod(@TFormListView.cbPathKeyDown, 'cbPathKeyDown');
    RegisterMethod(@TFormListView.cbPathClick, 'cbPathClick');
    RegisterMethod(@TFormListView.btnLargeIconsClick, 'btnLargeIconsClick');
    RegisterMethod(@TFormListView.ListViewDblClick, 'ListViewDblClick');
    RegisterMethod(@TFormListView.ListViewDataHint, 'ListViewDataHint');
    RegisterMethod(@TFormListView.ListViewKeyDown, 'ListViewKeyDown');
    RegisterMethod(@TFormListView.ListViewDataFind, 'ListViewDataFind');
    RegisterMethod(@TFormListView.ListViewCustomDrawItem, 'ListViewCustomDrawItem');
    RegisterMethod(@TFormListView.ListViewCustomDrawSubItem, 'ListViewCustomDrawSubItem');
    RegisterMethod(@TFormListView.btnBackClick, 'btnBackClick');
    RegisterMethod(@TFormListView.Form1Close, 'Form1Close');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_VListView(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TForm1(CL);
end;

 
 
{ TPSImport_VListView }
(*----------------------------------------------------------------------------*)
procedure TPSImport_VListView.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_VListView(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_VListView.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_VListView(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.