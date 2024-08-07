unit uPSI_StRegIni;
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
  TPSImport_StRegIni = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TStRegIni(CL: TPSPascalCompiler);
procedure SIRegister_StRegIni(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TStRegIni(CL: TPSRuntimeClassImporter);
procedure RIRegister_StRegIni(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Graphics
  ,STStrL
  ,STStrS
  ,StDate
  ,STConst
  ,STBase
  ,StRegIni
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_StRegIni]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TStRegIni(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TStRegIni') do
  with CL.AddClassN(CL.FindClass('TObject'),'TStRegIni') do begin
    RegisterMethod('Constructor Create( RootName : String; IsIniFile : Boolean)');
    RegisterMethod('Procedure Free');
    RegisterMethod('Procedure SetPrimary( Value : string)');
    RegisterMethod('Function GetPrimary : string');
    RegisterMethod('Function GetDataInfo( Key : HKey; const ValueName : string; var Size : LongInt; var DType : DWORD) : LongInt');
    RegisterMethod('Function BytesToString( Value : PByte; Size : Cardinal) : string');
    RegisterMethod('Function StringToBytes( const IString : string; var Value, Size : Cardinal) : Boolean');
    RegisterMethod('Function GetFullKeyPath : string');
    RegisterMethod('Procedure WriteBoolean( const ValueName : string; Value : Boolean)');
    RegisterMethod('Function ReadBoolean( const ValueName : string; Default : Boolean) : Boolean');
    RegisterMethod('Procedure WriteInteger( const ValueName : string; Value : DWORD)');
    RegisterMethod('Function ReadInteger( const ValueName : string; Default : DWORD) : DWORD');
    RegisterMethod('Procedure WriteString( const ValueName : string; const Value : string)');
    RegisterMethod('Function ReadString( const ValueName : string; const Default : string) : string');
    RegisterMethod('Procedure WriteBinaryData( const ValueName : string; const Value, Size : Integer)');
    RegisterMethod('Procedure WriteFloat( const ValueName : string; const Value : Double)');
    RegisterMethod('Function ReadFloat( const ValueName : string; const Default : TStFloat) : TStFloat');
    RegisterMethod('Procedure WriteDate( const ValueName : string; const Value : TStDate)');
    RegisterMethod('Function ReadDate( const ValueName : string; const Default : TStDate) : TStDate');
    RegisterMethod('Procedure WriteDateTime( const ValueName : string; const Value : TDateTime)');
    RegisterMethod('Function ReadDateTime( const ValueName : string; const Default : TDateTime) : TDateTime');
    RegisterMethod('Procedure WriteTime( const ValueName : string; const Value : TStTime)');
    RegisterMethod('Function ReadTime( const ValueName : string; const Default : TStTime) : TStTime');
    RegisterMethod('Procedure CreateKey( const KeyName : string)');
    RegisterMethod('Procedure GetSubKeys( SK : TStrings)');
    RegisterMethod('Procedure GetValues( SKV : TStrings)');
    RegisterMethod('Procedure DeleteKey( const KeyName : string; DeleteSubKeys : Boolean)');
    RegisterMethod('Procedure DeleteValue( const ValueName : string)');
    RegisterMethod('Procedure QueryKey( var KeyInfo : TQueryKeyInfo)');
    RegisterMethod('Function KeyExists( KeyName : string) : Boolean');
    RegisterMethod('Function IsKeyEmpty( Primary, SubKey : string) : Boolean');
    RegisterMethod('Procedure SaveKey( const SubKey : string; FileName : string)');
    RegisterMethod('Procedure LoadKey( const SubKey, FileName : string)');
    RegisterMethod('Procedure UnLoadKey( const SubKey : string)');
    RegisterMethod('Procedure ReplaceKey( const SubKey, InputFile, SaveFile : string)');
    RegisterMethod('Procedure RestoreKey( const SubKey, KeyFile : string; Options : DWORD)');
    RegisterMethod('Procedure RegOpenRemoteKey( CompName : string)');
    RegisterMethod('Procedure RegCloseRemoteKey');
    RegisterProperty('Attributes', 'TSecurityAttributes', iptrw);
    RegisterProperty('CurSubKey', 'string', iptrw);
    RegisterProperty('IsIniFile', 'Boolean', iptr);
    RegisterMethod('Procedure RegGetKeySecurity( const SubKey : string; var SD : TSecurityDescriptor)');
    RegisterMethod('Procedure RegSetKeySecurity( const SubKey : string; SD : TSecurityDescriptor)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_StRegIni(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TRegIniType', '( riIniType, riRegType )');
  CL.AddTypeS('TRegIniMode', '( riSet, riGet )');
  CL.AddTypeS('TWinVerType', '( riWin31, riWin32s, riWin95, riWinNT )');
  CL.AddTypeS('TQueryKeyInfo', 'record QIKey : HKey; QIClassName : string; QINu'
   +'mSubKeys : DWORD; QIMaxSKNLen : DWORD; QIMaxCNLen : DWORD; QINumValues : D'
   +'WORD; QIMaxVNLen : DWORD; QIMaxDataLen : DWORD; QISDescLen : DWORD; QIFile'
   +'Time : TFileTime; end');
 CL.AddConstantN('RI_INVALID_VALUE','LongInt').SetInt( - 1);
 //CL.AddConstantN('RIVOLATILE','').SetString( REG_WHOLE_HIVE_VOLATILE);
 CL.AddConstantN('ShortBufSize','LongInt').SetInt( 255);
 CL.AddConstantN('MaxBufSize','LongInt').SetInt( 8192);
 CL.AddConstantN('MaxByteArraySize','LongInt').SetInt( 127);
 CL.AddConstantN('RIMachine','String').SetString( 'MACHINE');
 CL.AddConstantN('RIUsers','String').SetString( 'USERS');
 CL.AddConstantN('RIRoot','String').SetString( 'ROOT');
 CL.AddConstantN('RICUser','String').SetString( 'C_USERS');
  SIRegister_TStRegIni(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TStRegIniIsIniFile_R(Self: TStRegIni; var T: Boolean);
begin T := Self.IsIniFile; end;

(*----------------------------------------------------------------------------*)
procedure TStRegIniCurSubKey_W(Self: TStRegIni; const T: string);
begin Self.CurSubKey := T; end;

(*----------------------------------------------------------------------------*)
procedure TStRegIniCurSubKey_R(Self: TStRegIni; var T: string);
begin T := Self.CurSubKey; end;

(*----------------------------------------------------------------------------*)
procedure TStRegIniAttributes_W(Self: TStRegIni; const T: TSecurityAttributes);
begin Self.Attributes := T; end;

(*----------------------------------------------------------------------------*)
procedure TStRegIniAttributes_R(Self: TStRegIni; var T: TSecurityAttributes);
begin T := Self.Attributes; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TStRegIni(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TStRegIni) do begin
    RegisterConstructor(@TStRegIni.Create, 'Create');
    RegisterMethod(@TStRegIni.Destroy, 'Free');
    RegisterMethod(@TStRegIni.SetPrimary, 'SetPrimary');
    RegisterMethod(@TStRegIni.GetPrimary, 'GetPrimary');
    RegisterMethod(@TStRegIni.GetDataInfo, 'GetDataInfo');
    RegisterMethod(@TStRegIni.BytesToString, 'BytesToString');
    RegisterMethod(@TStRegIni.StringToBytes, 'StringToBytes');
    RegisterMethod(@TStRegIni.GetFullKeyPath, 'GetFullKeyPath');
    RegisterMethod(@TStRegIni.WriteBoolean, 'WriteBoolean');
    RegisterMethod(@TStRegIni.ReadBoolean, 'ReadBoolean');
    RegisterMethod(@TStRegIni.WriteInteger, 'WriteInteger');
    RegisterMethod(@TStRegIni.ReadInteger, 'ReadInteger');
    RegisterMethod(@TStRegIni.WriteString, 'WriteString');
    RegisterMethod(@TStRegIni.ReadString, 'ReadString');
    RegisterMethod(@TStRegIni.WriteBinaryData, 'WriteBinaryData');
    RegisterMethod(@TStRegIni.WriteFloat, 'WriteFloat');
    RegisterMethod(@TStRegIni.ReadFloat, 'ReadFloat');
    RegisterMethod(@TStRegIni.WriteDate, 'WriteDate');
    RegisterMethod(@TStRegIni.ReadDate, 'ReadDate');
    RegisterMethod(@TStRegIni.WriteDateTime, 'WriteDateTime');
    RegisterMethod(@TStRegIni.ReadDateTime, 'ReadDateTime');
    RegisterMethod(@TStRegIni.WriteTime, 'WriteTime');
    RegisterMethod(@TStRegIni.ReadTime, 'ReadTime');
    RegisterMethod(@TStRegIni.CreateKey, 'CreateKey');
    RegisterMethod(@TStRegIni.GetSubKeys, 'GetSubKeys');
    RegisterMethod(@TStRegIni.GetValues, 'GetValues');
    RegisterMethod(@TStRegIni.DeleteKey, 'DeleteKey');
    RegisterMethod(@TStRegIni.DeleteValue, 'DeleteValue');
    RegisterMethod(@TStRegIni.QueryKey, 'QueryKey');
    RegisterMethod(@TStRegIni.KeyExists, 'KeyExists');
    RegisterMethod(@TStRegIni.IsKeyEmpty, 'IsKeyEmpty');
    RegisterMethod(@TStRegIni.SaveKey, 'SaveKey');
    RegisterMethod(@TStRegIni.LoadKey, 'LoadKey');
    RegisterMethod(@TStRegIni.UnLoadKey, 'UnLoadKey');
    RegisterMethod(@TStRegIni.ReplaceKey, 'ReplaceKey');
    RegisterMethod(@TStRegIni.RestoreKey, 'RestoreKey');
    RegisterMethod(@TStRegIni.RegOpenRemoteKey, 'RegOpenRemoteKey');
    RegisterMethod(@TStRegIni.RegCloseRemoteKey, 'RegCloseRemoteKey');
    RegisterPropertyHelper(@TStRegIniAttributes_R,@TStRegIniAttributes_W,'Attributes');
    RegisterPropertyHelper(@TStRegIniCurSubKey_R,@TStRegIniCurSubKey_W,'CurSubKey');
    RegisterPropertyHelper(@TStRegIniIsIniFile_R,nil,'IsIniFile');
    RegisterMethod(@TStRegIni.RegGetKeySecurity, 'RegGetKeySecurity');
    RegisterMethod(@TStRegIni.RegSetKeySecurity, 'RegSetKeySecurity');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_StRegIni(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TStRegIni(CL);
end;

 
 
{ TPSImport_StRegIni }
(*----------------------------------------------------------------------------*)
procedure TPSImport_StRegIni.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_StRegIni(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_StRegIni.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_StRegIni(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
