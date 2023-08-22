unit uPSI_JclCounter;
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
  TPSImport_JclCounter = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJclCounter(CL: TPSPascalCompiler);
procedure SIRegister_JclCounter(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_JclCounter_Routines(S: TPSExec);
procedure RIRegister_TJclCounter(CL: TPSRuntimeClassImporter);
procedure RIRegister_JclCounter(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
 // ,Libc
  ,JclBase
  ,JclCounter
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JclCounter]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJclCounter(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJclCounter') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJclCounter') do
  begin
    RegisterMethod('Constructor Create( const Compensate : Boolean)');
    RegisterMethod('Procedure Continue');
    RegisterMethod('Procedure Start');
    RegisterMethod('Function Stop : Float');
    RegisterProperty('Counting', 'Boolean', iptr);
    RegisterProperty('ElapsedTime', 'Float', iptr);
    RegisterProperty('Overhead', 'Int64', iptr);
    RegisterProperty('RunElapsedTime', 'Float', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JclCounter(CL: TPSPascalCompiler);
begin
  SIRegister_TJclCounter(CL);
 CL.AddDelphiFunction('Procedure ContinueCount( var Counter : TJclCounter)');
 CL.AddDelphiFunction('Procedure StartCount( var Counter : TJclCounter; const Compensate : Boolean)');
 CL.AddDelphiFunction('Function StopCount( var Counter : TJclCounter) : Float');
  CL.AddClassN(CL.FindClass('TOBJECT'),'EJclCounterError');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJclCounterRunElapsedTime_R(Self: TJclCounter; var T: Float);
begin T := Self.RunElapsedTime; end;

(*----------------------------------------------------------------------------*)
procedure TJclCounterOverhead_R(Self: TJclCounter; var T: Int64);
begin T := Self.Overhead; end;

(*----------------------------------------------------------------------------*)
procedure TJclCounterElapsedTime_R(Self: TJclCounter; var T: Float);
begin T := Self.ElapsedTime; end;

(*----------------------------------------------------------------------------*)
procedure TJclCounterCounting_R(Self: TJclCounter; var T: Boolean);
begin T := Self.Counting; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JclCounter_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@ContinueCount, 'ContinueCount', cdRegister);
 S.RegisterDelphiFunction(@StartCount, 'StartCount', cdRegister);
 S.RegisterDelphiFunction(@StopCount, 'StopCount', cdRegister);
  //with CL.Add(EJclCounterError) do
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJclCounter(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJclCounter) do
  begin
    RegisterConstructor(@TJclCounter.Create, 'Create');
    RegisterMethod(@TJclCounter.Continue, 'Continue');
    RegisterMethod(@TJclCounter.Start, 'Start');
    RegisterMethod(@TJclCounter.Stop, 'Stop');
    RegisterPropertyHelper(@TJclCounterCounting_R,nil,'Counting');
    RegisterPropertyHelper(@TJclCounterElapsedTime_R,nil,'ElapsedTime');
    RegisterPropertyHelper(@TJclCounterOverhead_R,nil,'Overhead');
    RegisterPropertyHelper(@TJclCounterRunElapsedTime_R,nil,'RunElapsedTime');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JclCounter(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TJclCounter(CL);
end;

 
 
{ TPSImport_JclCounter }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JclCounter.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JclCounter(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JclCounter.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JclCounter(ri);
  RIRegister_JclCounter_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
