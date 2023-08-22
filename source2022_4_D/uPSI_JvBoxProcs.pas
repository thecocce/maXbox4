unit uPSI_JvBoxProcs;
{
   proc for box
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
  TPSImport_JvBoxProcs = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_JvBoxProcs(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_JvBoxProcs_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Controls
  ,StdCtrls
  ,JvxCtrls
  ,JvBoxProcs
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvBoxProcs]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_JvBoxProcs(CL: TPSPascalCompiler);
begin
 CL.AddDelphiFunction('Procedure BoxMoveSelectedItems( SrcList, DstList : TWinControl)');
 CL.AddDelphiFunction('Procedure BoxMoveAllItems( SrcList, DstList : TWinControl)');
 CL.AddDelphiFunction('Procedure BoxDragOver( List : TWinControl; Source : TObject; X, Y : Integer; State : TDragState; var Accept : Boolean; Sorted : Boolean)');
 CL.AddDelphiFunction('Procedure BoxMoveFocusedItem( List : TWinControl; DstIndex : Integer)');
 CL.AddDelphiFunction('Procedure BoxMoveSelected( List : TWinControl; Items : TStrings)');
 CL.AddDelphiFunction('Procedure BoxSetItem( List : TWinControl; Index : Integer)');
 CL.AddDelphiFunction('Function BoxGetFirstSelection( List : TWinControl) : Integer');
 CL.AddDelphiFunction('Function BoxCanDropItem( List : TWinControl; X, Y : Integer; var DragIndex : Integer) : Boolean');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_JvBoxProcs_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@BoxMoveSelectedItems, 'BoxMoveSelectedItems', cdRegister);
 S.RegisterDelphiFunction(@BoxMoveAllItems, 'BoxMoveAllItems', cdRegister);
 S.RegisterDelphiFunction(@BoxDragOver, 'BoxDragOver', cdRegister);
 S.RegisterDelphiFunction(@BoxMoveFocusedItem, 'BoxMoveFocusedItem', cdRegister);
 S.RegisterDelphiFunction(@BoxMoveSelected, 'BoxMoveSelected', cdRegister);
 S.RegisterDelphiFunction(@BoxSetItem, 'BoxSetItem', cdRegister);
 S.RegisterDelphiFunction(@BoxGetFirstSelection, 'BoxGetFirstSelection', cdRegister);
 S.RegisterDelphiFunction(@BoxCanDropItem, 'BoxCanDropItem', cdRegister);
end;

 
 
{ TPSImport_JvBoxProcs }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvBoxProcs.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvBoxProcs(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvBoxProcs.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvBoxProcs(ri);
  RIRegister_JvBoxProcs_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
