unit uPSI_JclRegistry;
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
  TPSImport_JclRegistry = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_JclRegistry(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_JclRegistry_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Windows
  ,JclBase
  ,JclRegistry
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JclRegistry]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_JclRegistry(CL: TPSPascalCompiler);
begin
 CL.AddDelphiFunction('Function RegCreateKey( const RootKey : HKEY; const Key, Value : string) : Longint');
 CL.AddDelphiFunction('Function RegDeleteEntry( const RootKey : HKEY; const Key, Name : string) : Boolean');
 CL.AddDelphiFunction('Function RegDeleteKeyTree( const RootKey : HKEY; const Key : string) : Boolean');
 CL.AddDelphiFunction('Function RegReadBool( const RootKey : HKEY; const Key, Name : string) : Boolean');
 CL.AddDelphiFunction('Function RegReadBoolDef( const RootKey : HKEY; const Key, Name : string; Def : Boolean) : Boolean');
 CL.AddDelphiFunction('Function RegReadInteger( const RootKey : HKEY; const Key, Name : string) : Integer');
 CL.AddDelphiFunction('Function RegReadIntegerDef( const RootKey : HKEY; const Key, Name : string; Def : Integer) : Integer');
 CL.AddDelphiFunction('Function RegReadString( const RootKey : HKEY; const Key, Name : string) : string');
 CL.AddDelphiFunction('Function RegReadStringDef( const RootKey : HKEY; const Key, Name, Def : string) : string');
 CL.AddDelphiFunction('Function RegReadDWORD( const RootKey : HKEY; const Key, Name : string) : Int64');
 CL.AddDelphiFunction('Function RegReadDWORDDef( const RootKey : HKEY; const Key, Name : string; Def : Int64) : Int64');
 CL.AddDelphiFunction('Procedure RegWriteBool( const RootKey : HKEY; const Key, Name : string; Value : Boolean)');
 CL.AddDelphiFunction('Procedure RegWriteInteger( const RootKey : HKEY; const Key, Name : string; Value : Integer)');
 CL.AddDelphiFunction('Procedure RegWriteString( const RootKey : HKEY; const Key, Name, Value : string)');
 CL.AddDelphiFunction('Procedure RegWriteDWORD( const RootKey : HKEY; const Key, Name : string; Value : Int64)');
 CL.AddDelphiFunction('Function RegGetValueNames( const RootKey : HKEY; const Key : string; const List : TStrings) : Boolean');
 CL.AddDelphiFunction('Function RegGetKeyNames( const RootKey : HKEY; const Key : string; const List : TStrings) : Boolean');
 CL.AddDelphiFunction('Function RegHasSubKeys( const RootKey : HKEY; const Key : string) : Boolean');
 CL.AddDelphiFunction('Function RegKeyExists( const RootKey : HKEY; const Key : string) : Boolean');
  CL.AddTypeS('TExecKind', '( ekMachineRun, ekMachineRunOnce, ekUserRun, ekUser'
   +'RunOnce, ekServiceRun, ekServiceRunOnce )');
  CL.AddClassN(CL.FindClass('TOBJECT'),'EJclRegistryError');
 CL.AddDelphiFunction('Function UnregisterAutoExec( ExecKind : TExecKind; const Name : string) : Boolean');
 CL.AddDelphiFunction('Function RegisterAutoExec( ExecKind : TExecKind; const Name, Cmdline : string) : Boolean');
 CL.AddDelphiFunction('Function RegSaveList( const RootKey : HKEY; const Key : string; const ListName : string; const Items : TStrings) : Boolean');
 CL.AddDelphiFunction('Function RegLoadList( const RootKey : HKEY; const Key : string; const ListName : string; const SaveTo : TStrings) : Boolean');
 CL.AddDelphiFunction('Function RegDelList( const RootKey : HKEY; const Key : string; const ListName : string) : Boolean');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_JclRegistry_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@RegCreateKey, 'RegCreateKey', cdRegister);
 S.RegisterDelphiFunction(@RegDeleteEntry, 'RegDeleteEntry', cdRegister);
 S.RegisterDelphiFunction(@RegDeleteKeyTree, 'RegDeleteKeyTree', cdRegister);
 S.RegisterDelphiFunction(@RegReadBool, 'RegReadBool', cdRegister);
 S.RegisterDelphiFunction(@RegReadBoolDef, 'RegReadBoolDef', cdRegister);
 S.RegisterDelphiFunction(@RegReadInteger, 'RegReadInteger', cdRegister);
 S.RegisterDelphiFunction(@RegReadIntegerDef, 'RegReadIntegerDef', cdRegister);
 S.RegisterDelphiFunction(@RegReadString, 'RegReadString', cdRegister);
 S.RegisterDelphiFunction(@RegReadStringDef, 'RegReadStringDef', cdRegister);
 S.RegisterDelphiFunction(@RegReadDWORD, 'RegReadDWORD', cdRegister);
 S.RegisterDelphiFunction(@RegReadDWORDDef, 'RegReadDWORDDef', cdRegister);
 S.RegisterDelphiFunction(@RegWriteBool, 'RegWriteBool', cdRegister);
 S.RegisterDelphiFunction(@RegWriteInteger, 'RegWriteInteger', cdRegister);
 S.RegisterDelphiFunction(@RegWriteString, 'RegWriteString', cdRegister);
 S.RegisterDelphiFunction(@RegWriteDWORD, 'RegWriteDWORD', cdRegister);
 S.RegisterDelphiFunction(@RegGetValueNames, 'RegGetValueNames', cdRegister);
 S.RegisterDelphiFunction(@RegGetKeyNames, 'RegGetKeyNames', cdRegister);
 S.RegisterDelphiFunction(@RegHasSubKeys, 'RegHasSubKeys', cdRegister);
 S.RegisterDelphiFunction(@RegKeyExists, 'RegKeyExists', cdRegister);
//  with CL.Add(EJclRegistryError) do
 S.RegisterDelphiFunction(@UnregisterAutoExec, 'UnregisterAutoExec', cdRegister);
 S.RegisterDelphiFunction(@RegisterAutoExec, 'RegisterAutoExec', cdRegister);
 S.RegisterDelphiFunction(@RegSaveList, 'RegSaveList', cdRegister);
 S.RegisterDelphiFunction(@RegLoadList, 'RegLoadList', cdRegister);
 S.RegisterDelphiFunction(@RegDelList, 'RegDelList', cdRegister);
end;

 
 
{ TPSImport_JclRegistry }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JclRegistry.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JclRegistry(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JclRegistry.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  //RIRegister_JclRegistry(ri);
  RIRegister_JclRegistry_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
