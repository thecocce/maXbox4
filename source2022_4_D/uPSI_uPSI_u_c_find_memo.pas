unit uPSI_uPSI_u_c_find_memo;
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
  TPSImport_uPSI_u_c_find_memo = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TPSImport_u_c_find_memo(CL: TPSPascalCompiler);
procedure SIRegister_uPSI_u_c_find_memo(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_uPSI_u_c_find_memo_Routines(S: TPSExec);
procedure RIRegister_TPSImport_u_c_find_memo(CL: TPSRuntimeClassImporter);
procedure RIRegister_uPSI_u_c_find_memo(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   uPSI_u_c_find_memo
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_uPSI_u_c_find_memo]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TPSImport_u_c_find_memo(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPSPlugin', 'TPSImport_u_c_find_memo') do
  with CL.AddClassN(CL.FindClass('TPSPlugin'),'TPSImport_u_c_find_memo') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_uPSI_u_c_find_memo(CL: TPSPascalCompiler);
begin
  SIRegister_TPSImport_u_c_find_memo(CL);
 CL.AddDelphiFunction('Procedure SIRegister_c_find_memo( CL : TPSPascalCompiler)');
 CL.AddDelphiFunction('Procedure SIRegister_u_c_find_memo( CL : TPSPascalCompiler)');
 CL.AddDelphiFunction('Procedure RIRegister_c_find_memo( CL : TPSRuntimeClassImporter)');
 CL.AddDelphiFunction('Procedure RIRegister_u_c_find_memo( CL : TPSRuntimeClassImporter)');
 CL.AddDelphiFunction('Procedure Register');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_uPSI_u_c_find_memo_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@SIRegister_c_find_memo, 'SIRegister_c_find_memo', cdRegister);
 S.RegisterDelphiFunction(@SIRegister_u_c_find_memo, 'SIRegister_u_c_find_memo', cdRegister);
 S.RegisterDelphiFunction(@RIRegister_c_find_memo, 'RIRegister_c_find_memo', cdRegister);
 S.RegisterDelphiFunction(@RIRegister_u_c_find_memo, 'RIRegister_u_c_find_memo', cdRegister);
 S.RegisterDelphiFunction(@Register, 'Register', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TPSImport_u_c_find_memo(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TPSImport_u_c_find_memo) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_uPSI_u_c_find_memo(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TPSImport_u_c_find_memo(CL);
end;

 
 
{ TPSImport_uPSI_u_c_find_memo }
(*----------------------------------------------------------------------------*)
procedure TPSImport_uPSI_u_c_find_memo.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_uPSI_u_c_find_memo(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_uPSI_u_c_find_memo.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_uPSI_u_c_find_memo(ri);
  RIRegister_uPSI_u_c_find_memo_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
