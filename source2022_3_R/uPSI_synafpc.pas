unit uPSI_synafpc;
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
  TPSImport_synafpc = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_synafpc(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_synafpc_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Windows
  ,synafpc
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_synafpc]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_synafpc(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TLibHandle', 'Integer');
 CL.AddDelphiFunction('Function LoadLibraryfpc( ModuleName : PChar) : TLibHandle');
 CL.AddDelphiFunction('Function FreeLibraryfpc( Module : TLibHandle) : LongBool');
 CL.AddDelphiFunction('Function GetProcAddressfpc( Module : TLibHandle; Proc : PChar) : TObject');
 CL.AddDelphiFunction('Function GetModuleFileNamefpc( Module : TLibHandle; Buffer : PChar; BufLen : Integer) : Integer');
  //CL.AddTypeS('TLibHandle', 'Integer');
  CL.AddTypeS('TLibHandle2', 'HModule');
  CL.AddTypeS('LongWordfpc', 'DWord');
 CL.AddDelphiFunction('Procedure Sleepfpc( milliseconds : Cardinal)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_synafpc_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@LoadLibrary, 'LoadLibraryfpc', cdRegister);
 S.RegisterDelphiFunction(@FreeLibrary, 'FreeLibraryfpc', cdRegister);
 S.RegisterDelphiFunction(@GetProcAddress, 'GetProcAddressfpc', cdRegister);
 S.RegisterDelphiFunction(@GetModuleFileName, 'GetModuleFileNamefpc', cdRegister);
 S.RegisterDelphiFunction(@Sleep, 'Sleepfpc', cdRegister);
end;

 
 
{ TPSImport_synafpc }
(*----------------------------------------------------------------------------*)
procedure TPSImport_synafpc.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_synafpc(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_synafpc.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_synafpc_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.