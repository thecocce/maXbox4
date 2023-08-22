unit uPSI_Masks;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis.
with maskutils
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
  TPSImport_Masks = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TMask(CL: TPSPascalCompiler);
procedure SIRegister_Masks(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_Masks_Routines(S: TPSExec);
procedure RIRegister_TMask(CL: TPSRuntimeClassImporter);
procedure RIRegister_Masks(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Masks
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_Masks]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TMask(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TMask') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TMask') do begin
    RegisterMethod('Constructor Create( const MaskValue : string)');
      RegisterMethod('Procedure Free;');
      RegisterMethod('Function Matches( const Filename : string) : Boolean');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_Masks(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'EMaskException');
  SIRegister_TMask(CL);
 CL.AddDelphiFunction('Function MatchesMask( const Filename, Mask : string) : Boolean');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_Masks_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@MatchesMask, 'MatchesMask', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TMask(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TMask) do begin
    RegisterConstructor(@TMask.Create, 'Create');
    RegisterMethod(@TMask.Destroy, 'Free');
    RegisterMethod(@TMask.Matches, 'Matches');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_Masks(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EMaskException) do
  RIRegister_TMask(CL);
end;

 
 
{ TPSImport_Masks }
(*----------------------------------------------------------------------------*)
procedure TPSImport_Masks.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_Masks(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Masks.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_Masks(ri);
  RIRegister_Masks_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
