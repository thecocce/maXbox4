unit uPSI_uregtest;
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
  TPSImport_uregtest = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_uregtest(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_uregtest_Routines(S: TPSExec);

procedure Register;

implementation


uses
   utypes
  ,umeansd
  ,uregtest
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_uregtest]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_uregtest(CL: TPSPascalCompiler);
begin
 CL.AddDelphiFunction('Procedure RegTest( Y, Ycalc : TVector; LbY, UbY : Integer; V : TMatrix; LbV, UbV : Integer; var Test : TRegTest)');
 CL.AddDelphiFunction('Procedure WRegTest( Y, Ycalc, S : TVector; LbY, UbY : Integer; V : TMatrix; LbV, UbV : Integer; var Test : TRegTest)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_uregtest_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@RegTest, 'RegTest', cdRegister);
 S.RegisterDelphiFunction(@WRegTest, 'WRegTest', cdRegister);
end;

 
 
{ TPSImport_uregtest }
(*----------------------------------------------------------------------------*)
procedure TPSImport_uregtest.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_uregtest(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_uregtest.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  //RIRegister_uregtest(ri);
  RIRegister_uregtest_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.