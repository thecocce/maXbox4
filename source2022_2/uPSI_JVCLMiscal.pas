unit uPSI_JVCLMiscal;
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
  TPSImport_JVCLMiscal = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvDirectoryProperty(CL: TPSPascalCompiler);
procedure SIRegister_TJvExeNameProperty(CL: TPSPascalCompiler);
procedure SIRegister_TJvPerfStatProperty(CL: TPSPascalCompiler);
procedure SIRegister_TJvMailEditor(CL: TPSPascalCompiler);
procedure SIRegister_TJvOpenDialogEditor(CL: TPSPascalCompiler);
procedure SIRegister_TJvNosortEnumProperty(CL: TPSPascalCompiler);
procedure SIRegister_JVCLMiscal(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvDirectoryProperty(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvExeNameProperty(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvPerfStatProperty(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvMailEditor(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvOpenDialogEditor(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvNosortEnumProperty(CL: TPSRuntimeClassImporter);
procedure RIRegister_JVCLMiscal(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Dlgs
  ,Dialogs
  //,DsgnIntf
  //,DesignEditors
  //,DesignIntf
  ,JvMail
  ,JvPerfMon95
  ,JVCLMiscal
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JVCLMiscal]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDirectoryProperty(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStringProperty', 'TJvDirectoryProperty') do
  with CL.AddClassN(CL.FindClass('TStringProperty'),'TJvDirectoryProperty') do
  begin
    RegisterMethod('Procedure Edit');
    RegisterMethod('Function GetAttributes : TPropertyAttributes');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvExeNameProperty(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStringProperty', 'TJvExeNameProperty') do
  with CL.AddClassN(CL.FindClass('TStringProperty'),'TJvExeNameProperty') do
  begin
    RegisterMethod('Procedure Edit');
    RegisterMethod('Function GetAttributes : TPropertyAttributes');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvPerfStatProperty(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStringProperty', 'TJvPerfStatProperty') do
  with CL.AddClassN(CL.FindClass('TStringProperty'),'TJvPerfStatProperty') do
  begin
    RegisterMethod('Function GetAttributes : TPropertyAttributes');
    RegisterMethod('Procedure GetValues( Proc : TGetStrProc)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvMailEditor(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TComponentEditor', 'TJvMailEditor') do
  with CL.AddClassN(CL.FindClass('TComponentEditor'),'TJvMailEditor') do
  begin
    RegisterMethod('Procedure ExecuteVerb( Index : Integer)');
    RegisterMethod('Function GetVerb( Index : Integer) : string');
    RegisterMethod('Function GetVerbCount : Integer');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvOpenDialogEditor(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TComponentEditor', 'TJvOpenDialogEditor') do
  with CL.AddClassN(CL.FindClass('TComponentEditor'),'TJvOpenDialogEditor') do
  begin
    RegisterMethod('Procedure ExecuteVerb( Index : Integer)');
    RegisterMethod('Function GetVerb( Index : Integer) : string');
    RegisterMethod('Function GetVerbCount : Integer');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvNosortEnumProperty(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TEnumProperty', 'TJvNosortEnumProperty') do
  with CL.AddClassN(CL.FindClass('TEnumProperty'),'TJvNosortEnumProperty') do
  begin
    RegisterMethod('Function GetAttributes : TPropertyAttributes');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JVCLMiscal(CL: TPSPascalCompiler);
begin
  SIRegister_TJvNosortEnumProperty(CL);
  SIRegister_TJvOpenDialogEditor(CL);
  CL.AddClassN(CL.FindClass('TOBJECT'),'TCommonDialogHack');
  SIRegister_TJvMailEditor(CL);
  SIRegister_TJvPerfStatProperty(CL);
  SIRegister_TJvExeNameProperty(CL);
  SIRegister_TJvDirectoryProperty(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDirectoryProperty(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDirectoryProperty) do
  begin
    RegisterMethod(@TJvDirectoryProperty.Edit, 'Edit');
    RegisterMethod(@TJvDirectoryProperty.GetAttributes, 'GetAttributes');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvExeNameProperty(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvExeNameProperty) do
  begin
    RegisterMethod(@TJvExeNameProperty.Edit, 'Edit');
    RegisterMethod(@TJvExeNameProperty.GetAttributes, 'GetAttributes');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvPerfStatProperty(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvPerfStatProperty) do
  begin
    RegisterMethod(@TJvPerfStatProperty.GetAttributes, 'GetAttributes');
    RegisterMethod(@TJvPerfStatProperty.GetValues, 'GetValues');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvMailEditor(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvMailEditor) do
  begin
    RegisterMethod(@TJvMailEditor.ExecuteVerb, 'ExecuteVerb');
    RegisterMethod(@TJvMailEditor.GetVerb, 'GetVerb');
    RegisterMethod(@TJvMailEditor.GetVerbCount, 'GetVerbCount');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvOpenDialogEditor(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvOpenDialogEditor) do
  begin
    RegisterMethod(@TJvOpenDialogEditor.ExecuteVerb, 'ExecuteVerb');
    RegisterMethod(@TJvOpenDialogEditor.GetVerb, 'GetVerb');
    RegisterMethod(@TJvOpenDialogEditor.GetVerbCount, 'GetVerbCount');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvNosortEnumProperty(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvNosortEnumProperty) do
  begin
    RegisterMethod(@TJvNosortEnumProperty.GetAttributes, 'GetAttributes');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JVCLMiscal(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TJvNosortEnumProperty(CL);
  RIRegister_TJvOpenDialogEditor(CL);
  with CL.Add(TCommonDialogHack) do
  RIRegister_TJvMailEditor(CL);
  RIRegister_TJvPerfStatProperty(CL);
  RIRegister_TJvExeNameProperty(CL);
  RIRegister_TJvDirectoryProperty(CL);
end;

 
 
{ TPSImport_JVCLMiscal }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JVCLMiscal.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JVCLMiscal(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JVCLMiscal.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JVCLMiscal(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
