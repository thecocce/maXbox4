unit uPSI_PJConsoleApp;
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
  TPSImport_PJConsoleApp = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TPJConsoleApp(CL: TPSPascalCompiler);
procedure SIRegister_TPJCustomConsoleApp(CL: TPSPascalCompiler);
procedure SIRegister_PJConsoleApp(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TPJConsoleApp(CL: TPSRuntimeClassImporter);
procedure RIRegister_TPJCustomConsoleApp(CL: TPSRuntimeClassImporter);
procedure RIRegister_PJConsoleApp_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Windows
  ,Graphics
  ,Types
  ,PJConsoleApp
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_PJConsoleApp]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TPJConsoleApp(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPJCustomConsoleApp', 'TPJConsoleApp') do
  with CL.AddClassN(CL.FindClass('TPJCustomConsoleApp'),'TPJConsoleApp') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TPJCustomConsoleApp(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TPJCustomConsoleApp') do
  with CL.AddClassN(CL.FindClass('TObject'),'TPJCustomConsoleApp') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Function Execute( const CmdLine : string; const CurrentDir : string) : Boolean;');
    RegisterMethod('Function Execute1 : Boolean;');
    RegisterMethod('Procedure Terminate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_PJConsoleApp(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('cOneSecInMS','LongInt').SetInt( 1000);
 CL.AddConstantN('cDefTimeSlice','LongInt').SetInt( 50);
 CL.AddConstantN('cDefMaxExecTime','60').SetString( cOneMinInMS);
 CL.AddConstantN('cAppErrorMask','LongInt').SetInt( 1 shl 29);
 CL.AddDelphiFunction('Function IsApplicationError( const ErrCode : LongWord) : Boolean');
  CL.AddTypeS('TPJConsoleAppPriority', '( cpDefault, cpHigh, cpNormal, cpIdle, '
   +'cpRealTime )');
  CL.AddTypeS('TPJConsoleColors', 'record Foreground : TPJConsoleColor; Backgro'
   +'und : TPJConsoleColor; end');
 CL.AddDelphiFunction('Function MakeConsoleColors( const AForeground, ABackground : TPJConsoleColor) : TPJConsoleColors;');
 CL.AddDelphiFunction('Function MakeConsoleColors1( const AForeground, ABackground : TColor) : TPJConsoleColors;');
 CL.AddDelphiFunction('Function MakeConsoleColors2( const AForeground, ABackground : TAlphaColor) : TPJConsoleColors;');
 CL.AddDelphiFunction('Function MakeSize( const ACX, ACY : LongInt) : TSize');
  SIRegister_TPJCustomConsoleApp(CL);
  SIRegister_TPJConsoleApp(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
Function TPJCustomConsoleAppExecute1_P(Self: TPJCustomConsoleApp) : Boolean;
Begin Result := Self.Execute; END;

(*----------------------------------------------------------------------------*)
Function TPJCustomConsoleAppExecute_P(Self: TPJCustomConsoleApp;  const CmdLine : string; const CurrentDir : string) : Boolean;
Begin Result := Self.Execute(CmdLine, CurrentDir); END;

(*----------------------------------------------------------------------------*)
Function MakeConsoleColors2_P( const AForeground, ABackground : TAlphaColor) : TPJConsoleColors;
Begin Result := PJConsoleApp.MakeConsoleColors(AForeground, ABackground); END;

(*----------------------------------------------------------------------------*)
Function MakeConsoleColors1_P( const AForeground, ABackground : TColor) : TPJConsoleColors;
Begin Result := PJConsoleApp.MakeConsoleColors(AForeground, ABackground); END;

(*----------------------------------------------------------------------------*)
Function MakeConsoleColors_P( const AForeground, ABackground : TPJConsoleColor) : TPJConsoleColors;
Begin Result := PJConsoleApp.MakeConsoleColors(AForeground, ABackground); END;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TPJConsoleApp(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TPJConsoleApp) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TPJCustomConsoleApp(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TPJCustomConsoleApp) do
  begin
    RegisterConstructor(@TPJCustomConsoleApp.Create, 'Create');
    RegisterMethod(@TPJCustomConsoleAppExecute_P, 'Execute');
    RegisterMethod(@TPJCustomConsoleAppExecute1_P, 'Execute1');
    RegisterMethod(@TPJCustomConsoleApp.Terminate, 'Terminate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_PJConsoleApp_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@IsApplicationError, 'IsApplicationError', cdRegister);
 S.RegisterDelphiFunction(@MakeConsoleColors, 'MakeConsoleColors', cdRegister);
 S.RegisterDelphiFunction(@MakeConsoleColors1, 'MakeConsoleColors1', cdRegister);
 S.RegisterDelphiFunction(@MakeConsoleColors2, 'MakeConsoleColors2', cdRegister);
 S.RegisterDelphiFunction(@MakeSize, 'MakeSize', cdRegister);
  RIRegister_TPJCustomConsoleApp(CL);
  RIRegister_TPJConsoleApp(CL);
end;

 
 
{ TPSImport_PJConsoleApp }
(*----------------------------------------------------------------------------*)
procedure TPSImport_PJConsoleApp.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_PJConsoleApp(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_PJConsoleApp.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_PJConsoleApp_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.