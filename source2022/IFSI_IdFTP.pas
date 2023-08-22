unit IFSI_IdFTP;
{
This file has been generated by UnitParser v0.6, written by M. Knight
and updated by NP. v/d Spek.
expanded by max for FTP inheritance in properties, june 2010
    port, host, password, username
}
{$I PascalScript.inc}
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
  TPSImport_IdFTP = class(TPSPlugin)
  protected
    procedure CompOnUses(CompExec: TPSScript); override;
    procedure ExecOnUses(CompExec: TPSScript); override;
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure CompileImport2(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
    procedure ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;



{ compile-time registration functions }
procedure SIRegister_TIdFTP(CL: TPSPascalCompiler);
procedure SIRegister_TIdFtpProxySettings(CL: TPSPascalCompiler);
procedure SIRegister_IdFTP(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdFTP(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdFtpProxySettings(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdFTP(CL: TPSRuntimeClassImporter);



implementation


uses
   IdAssignedNumbers
  ,IdException
  //,IdRFCReply  d2007
  ,IdSocketHandle
  ,IdTCPConnection
  ,IdTCPClient
  ,IdThread
  ,IdFTPList
  ,IdFTPCommon
  ,IdGlobal
  ,IdFTP
  ;


{ compile-time importer function }
(*----------------------------------------------------------------------------
 Sometimes the CL.AddClassN() fails to correctly register a class, 
 for unknown (at least to me) reasons
 So, you may use the below RegClassS() replacing the CL.AddClassN()
 of the various SIRegister_XXXX calls 
 ----------------------------------------------------------------------------*)
function RegClassS(CL: TPSPascalCompiler; const InheritsFrom, Classname: string): TPSCompileTimeClass;
begin
  Result := CL.FindClass(Classname);
  if Result = nil then
    Result := CL.AddClassN(CL.FindClass(InheritsFrom), Classname)
  else Result.ClassInheritsFrom := CL.FindClass(InheritsFrom);
end;
  

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
Function BoolToStr(value : boolean) : string;
Begin If value then Result := 'TRUE' else Result := 'FALSE' End;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdFTP(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdTCPClient', 'TIdFTP') do
  with CL.AddClassN(CL.FindClass('TIdTCPClient'),'TIdFTP') do
  begin
    RegisterMethod('Constructor Create(AOwner: TComponent);');
    //RegisterMethod('Constructor Create(AHTTP : TIdCustomHTTP)');
    RegisterMethod('Procedure Free;');
    RegisterMethod('Procedure Abort');
    RegisterMethod('Procedure Account( AInfo : String)');
    RegisterMethod('Procedure Allocate( AAllocateBytes : Integer)');
    RegisterMethod('Procedure ChangeDir( const ADirName : string)');
    RegisterMethod('Procedure ChangeDirUp');
    RegisterMethod('Procedure Connect( AAutoLogin : boolean; const ATimeout : Integer)');
    RegisterMethod('Procedure Delete( const AFilename : string)');
    RegisterMethod('Procedure FileStructure( AStructure : TIdFTPDataStructure)');
    RegisterMethod('Procedure Get1( const ASourceFile : string; ADest : TStream; AResume : Boolean);');
    RegisterMethod('Procedure Get2( const ASourceFile, ADestFile : string; const ACanOverwrite : boolean; AResume : Boolean);');
    RegisterMethod('Procedure Help( var AHelpContents : TStringList; ACommand : String)');
    RegisterMethod('Procedure KillDataChannel');
    RegisterMethod('Procedure List( ADest : TStrings; const ASpecifier : string; const ADetails : boolean)');
    RegisterMethod('Procedure Login');
    RegisterMethod('Procedure MakeDir( const ADirName : string)');
    RegisterMethod('Procedure Noop');
    RegisterMethod('Procedure Put1( const ASource : TStream; const ADestFile : string; const AAppend : boolean);');
    RegisterMethod('Procedure Put2( const ASourceFile : string; const ADestFile : string; const AAppend : boolean);');
    RegisterMethod('Procedure Quit');
    RegisterMethod('Function Quote( const ACommand : String) : SmallInt');
    RegisterMethod('Procedure RemoveDir( const ADirName : string)');
    RegisterMethod('Procedure Rename( const ASourceFile, ADestFile : string)');
    RegisterMethod('Function ResumeSupported : Boolean');
    RegisterMethod('Function RetrieveCurrentDir : string');
    RegisterMethod('Procedure Site( const ACommand : string)');
    RegisterMethod('Function Size( const AFileName : String) : Integer');
    RegisterMethod('Procedure Status( var AStatusList : TStringList)');
    RegisterMethod('Procedure StructureMount( APath : String)');
    RegisterMethod('Procedure TransferMode( ATransferMode : TIdFTPTransferMode)');
    RegisterMethod('Procedure ReInitialize( ADelay : Cardinal)');
    RegisterProperty('CanResume', 'Boolean', iptr);
    RegisterProperty('DirectoryListing', 'TIdFTPListItems', iptr);
    RegisterProperty('LoginMsg', 'TIdRFCReply', iptr);
    RegisterProperty('SystemDesc', 'string', iptr);
    RegisterProperty('ListResult', 'TStrings', iptr);
    RegisterProperty('Passive', 'boolean', iptrw);
    RegisterProperty('TransferType', 'TIdFTPTransferType', iptrw);
    RegisterProperty('ProxySettings', 'TIdFtpProxySettings', iptrw);
    RegisterProperty('OnAfterClientLogin', 'TOnAfterClientLogin', iptrw);
    RegisterProperty('OnCheckListFormat', 'TIdCheckListFormat', iptrw);
    RegisterProperty('OnCreateFTPList', 'TIdCreateFTPList', iptrw);
    RegisterProperty('OnParseCustomListFormat', 'TIdOnParseCustomListFormat', iptrw);
    RegisterProperty('OnAfterGet', 'TIdFtpAfterGet', iptrw);
    RegisterProperty('Host', 'String', iptrw);
    RegisterProperty('UserName', 'String', iptrw);
    RegisterProperty('Password', 'String', iptrw);
    RegisterProperty('Port', 'Integer', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdFtpProxySettings(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TIdFtpProxySettings') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TIdFtpProxySettings') do begin
    RegisterMethod('Assign(Source: TPersistent);');
    RegisterProperty('ProxyType', 'TIdFtpProxyType', iptrw);
    RegisterProperty('Host', 'String', iptrw);
    RegisterProperty('UserName', 'String', iptrw);
    RegisterProperty('Password', 'String', iptrw);
    RegisterProperty('Port', 'Integer', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdFTP(CL: TPSPascalCompiler);
begin
  //CL.AddTypeS('TIdCreateFTPList', 'Procedure ( ASender : TObject; var VFTPList '
   //+': TIdFTPListItems)');
  //CL.AddTypeS('TIdCheckListFormat', 'Procedure ( ASender : TObject; const ALine'
  // +' : String; var VListFormat : TIdFTPListFormat)');
  //from IdFTPCommon
  CL.AddTypeS('TIdFTPTransferType', '( ftASCII, ftBinary )');
  CL.AddTypeS('TIdFTPDataStructure', '( dsFile, dsRecord, dsPage )');
  CL.AddTypeS('TIdFTPTransferMode', '( dmBlock, dmCompressed, dmStream )');
  CL.AddTypeS('TOnAfterClientLogin', 'TNotifyEvent');
  CL.AddTypeS('TIdFtpAfterGet', 'Procedure ( ASender : TObject; VStream : TStream)');
  CL.AddConstantN('Id_TIdFTP_TransferType','TIdFTPTransferType');
  CL.AddConstantN('Id_TIdFTP_Passive','Boolean');
  CL.AddTypeS('TIdFtpProxyType', '( fpcmNone, fpcmUserSite, fpcmSite, fpcmOpen,'
   +' fpcmUserPass, fpcmTransparent, fpcmHttpProxyWithFtp )');
  SIRegister_TIdFtpProxySettings(CL);
  SIRegister_TIdFTP(CL);
  CL.AddClassN(CL.FindClass('TOBJECT'),'EIdFTPFileAlreadyExists');
end;
//Id_TIdFTP_Passive

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdFTPOnAfterGet_W(Self: TIdFTP; const T: TIdFtpAfterGet);
begin Self.OnAfterGet := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnAfterGet_R(Self: TIdFTP; var T: TIdFtpAfterGet);
begin T := Self.OnAfterGet; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnParseCustomListFormat_W(Self: TIdFTP; const T: TIdOnParseCustomListFormat);
begin //Self.OnParseCustomListFormat := T;
 end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnParseCustomListFormat_R(Self: TIdFTP; var T: TIdOnParseCustomListFormat);
begin //T := //Self.OnParseCustomListFormat;
 end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnCreateFTPList_W(Self: TIdFTP; const T: TIdCreateFTPList);
begin Self.OnCreateFTPList := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnCreateFTPList_R(Self: TIdFTP; var T: TIdCreateFTPList);
begin T := Self.OnCreateFTPList; end;

(*----------------------------------------------------------------------------*)
{procedure TIdFTPOnCheckListFormat_W(Self: TIdFTP; const T: TIdCheckListFormat);
begin Self.OnCheckListFormat := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnCheckListFormat_R(Self: TIdFTP; var T: TIdCheckListFormat);
begin T := Self.OnCheckListFormat; end;}

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnAfterClientLogin_W(Self: TIdFTP; const T: TOnAfterClientLogin);
begin Self.OnAfterClientLogin := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPOnAfterClientLogin_R(Self: TIdFTP; var T: TOnAfterClientLogin);
begin T := Self.OnAfterClientLogin; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPProxySettings_W(Self: TIdFTP; const T: TIdFtpProxySettings);
begin Self.ProxySettings := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPProxySettings_R(Self: TIdFTP; var T: TIdFtpProxySettings);
begin T := Self.ProxySettings; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPTransferType_W(Self: TIdFTP; const T: TIdFTPTransferType);
begin Self.TransferType := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPTransferType_R(Self: TIdFTP; var T: TIdFTPTransferType);
begin T := Self.TransferType; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPPassive_W(Self: TIdFTP; const T: boolean);
begin Self.Passive := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPPassive_R(Self: TIdFTP; var T: boolean);
begin T := Self.Passive; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPListResult_R(Self: TIdFTP; var T: TStrings);
begin T := Self.ListResult; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPSystemDesc_R(Self: TIdFTP; var T: string);
begin T := Self.SystemDesc; end;

(*----------------------------------------------------------------------------*)
{procedure TIdFTPLoginMsg_R(Self: TIdFTP; var T: TIdRFCReply);
begin T := Self.LoginMsg; end;}

(*----------------------------------------------------------------------------*)
procedure TIdFTPDirectoryListing_R(Self: TIdFTP; var T: TIdFTPListItems);
begin T := Self.DirectoryListing; end;

(*----------------------------------------------------------------------------*)
procedure TIdFTPCanResume_R(Self: TIdFTP; var T: Boolean);
begin T := Self.CanResume; end;

(*----------------------------------------------------------------------------*)
Procedure TIdFTPPut2_P(Self: TIdFTP;  const ASourceFile : string; const ADestFile : string; const AAppend : boolean);
Begin Self.Put(ASourceFile, ADestFile, AAppend); END;

(*----------------------------------------------------------------------------*)
Procedure TIdFTPPut1_P(Self: TIdFTP;  const ASource : TStream; const ADestFile : string; const AAppend : boolean);
Begin Self.Put(ASource, ADestFile, AAppend); END;

(*----------------------------------------------------------------------------*)
Procedure TIdFTPGet2_P(Self: TIdFTP;  const ASourceFile, ADestFile : string; const ACanOverwrite : boolean; AResume : Boolean);
Begin Self.Get(ASourceFile, ADestFile, ACanOverwrite, AResume); END;

(*----------------------------------------------------------------------------*)
Procedure TIdFTPGet1_P(Self: TIdFTP;  const ASourceFile : string; ADest : TStream; AResume : Boolean);
Begin Self.Get(ASourceFile, ADest, AResume); END;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsPort_W(Self: TIdFtpProxySettings; const T: Integer);
begin Self.Port := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsPort_R(Self: TIdFtpProxySettings; var T: Integer);
begin T := Self.Port; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsPassword_W(Self: TIdFtpProxySettings; const T: String);
begin Self.Password := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsPassword_R(Self: TIdFtpProxySettings; var T: String);
begin T := Self.Password; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsUserName_W(Self: TIdFtpProxySettings; const T: String);
begin Self.UserName := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsUserName_R(Self: TIdFtpProxySettings; var T: String);
begin T := Self.UserName; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsHost_W(Self: TIdFtpProxySettings; const T: String);
begin Self.Host := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsHost_R(Self: TIdFtpProxySettings; var T: String);
begin T := Self.Host; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsProxyType_W(Self: TIdFtpProxySettings; const T: TIdFtpProxyType);
begin Self.ProxyType := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdFtpProxySettingsProxyType_R(Self: TIdFtpProxySettings; var T: TIdFtpProxyType);
begin T := Self.ProxyType; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdFTP(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdFTP) do begin
    RegisterConstructor(@TIdFTP.Create, 'Create');
    RegisterVirtualMethod(@TIdFTP.Abort, 'Abort');
    //RegisterMethod(@TIdFTP.Account, 'Account');
    RegisterMethod(@TIdFTP.Destroy, 'Free');
    RegisterMethod(@TIdFTP.Allocate, 'Allocate');
    RegisterMethod(@TIdFTP.ChangeDir, 'ChangeDir');
    RegisterMethod(@TIdFTP.ChangeDirUp, 'ChangeDirUp');
    RegisterMethod(@TIdFTP.Connect, 'Connect');
    RegisterMethod(@TIdFTP.Delete, 'Delete');
    RegisterMethod(@TIdFTP.FileStructure, 'FileStructure');
    RegisterMethod(@TIdFTPGet1_P, 'Get');    //3.6
    RegisterMethod(@TIdFTPGet1_P, 'Get1');
    RegisterMethod(@TIdFTPGet2_P, 'Get2');
    RegisterMethod(@TIdFTP.Help, 'Help');
    RegisterVirtualMethod(@TIdFTP.KillDataChannel, 'KillDataChannel');
    RegisterMethod(@TIdFTP.List, 'List');
    RegisterMethod(@TIdFTP.Login, 'Login');
    RegisterMethod(@TIdFTP.MakeDir, 'MakeDir');
    RegisterMethod(@TIdFTP.Noop, 'Noop');
    RegisterMethod(@TIdFTPPut1_P, 'Put');
    RegisterMethod(@TIdFTPPut1_P, 'Put1');
     RegisterMethod(@TIdFTPPut2_P, 'Put2');
    RegisterMethod(@TIdFTP.Quit, 'Quit');
    RegisterMethod(@TIdFTP.Quote, 'Quote');
    RegisterMethod(@TIdFTP.RemoveDir, 'RemoveDir');
    RegisterMethod(@TIdFTP.Rename, 'Rename');
    RegisterMethod(@TIdFTP.ResumeSupported, 'ResumeSupported');
    RegisterMethod(@TIdFTP.RetrieveCurrentDir, 'RetrieveCurrentDir');
    RegisterMethod(@TIdFTP.Site, 'Site');
    RegisterMethod(@TIdFTP.Size, 'Size');
    RegisterMethod(@TIdFTP.Status, 'Status');
    RegisterMethod(@TIdFTP.StructureMount, 'StructureMount');
    RegisterMethod(@TIdFTP.TransferMode, 'TransferMode');
    RegisterMethod(@TIdFTP.ReInitialize, 'ReInitialize');
    RegisterPropertyHelper(@TIdFTPCanResume_R,nil,'CanResume');
    RegisterPropertyHelper(@TIdFTPDirectoryListing_R,nil,'DirectoryListing');
    //RegisterPropertyHelper(@TIdFTPLoginMsg_R,nil,'LoginMsg');
    RegisterPropertyHelper(@TIdFTPSystemDesc_R,nil,'SystemDesc');
    RegisterPropertyHelper(@TIdFTPListResult_R,nil,'ListResult');
    RegisterPropertyHelper(@TIdFTPPassive_R,@TIdFTPPassive_W,'Passive');
    RegisterPropertyHelper(@TIdFTPTransferType_R,@TIdFTPTransferType_W,'TransferType');
    RegisterPropertyHelper(@TIdFTPProxySettings_R,@TIdFTPProxySettings_W,'ProxySettings');
    RegisterPropertyHelper(@TIdFTPOnAfterClientLogin_R,@TIdFTPOnAfterClientLogin_W,'OnAfterClientLogin');
    //RegisterPropertyHelper(@TIdFTPOnCheckListFormat_R,@TIdFTPOnCheckListFormat_W,'OnCheckListFormat');
    RegisterPropertyHelper(@TIdFTPOnCreateFTPList_R,@TIdFTPOnCreateFTPList_W,'OnCreateFTPList');
    RegisterPropertyHelper(@TIdFTPOnParseCustomListFormat_R,@TIdFTPOnParseCustomListFormat_W,'OnParseCustomListFormat');
    RegisterPropertyHelper(@TIdFTPOnAfterGet_R,@TIdFTPOnAfterGet_W,'OnAfterGet');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdFtpProxySettings(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdFtpProxySettings) do begin
    RegisterMethod(@TIdFTPProxySettings.Assign, 'Assign');
    RegisterPropertyHelper(@TIdFtpProxySettingsProxyType_R,@TIdFtpProxySettingsProxyType_W,'ProxyType');
    RegisterPropertyHelper(@TIdFtpProxySettingsHost_R,@TIdFtpProxySettingsHost_W,'Host');
    RegisterPropertyHelper(@TIdFtpProxySettingsUserName_R,@TIdFtpProxySettingsUserName_W,'UserName');
    RegisterPropertyHelper(@TIdFtpProxySettingsPassword_R,@TIdFtpProxySettingsPassword_W,'Password');
    RegisterPropertyHelper(@TIdFtpProxySettingsPort_R,@TIdFtpProxySettingsPort_W,'Port');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdFTP(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdFtpProxySettings(CL);
  RIRegister_TIdFTP(CL);
  with CL.Add(EIdFTPFileAlreadyExists) do
end;

 
 
{ TPSImport_IdFTP }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdFTP.CompOnUses(CompExec: TPSScript);
begin
  { nothing } 
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdFTP.ExecOnUses(CompExec: TPSScript);
begin
  { nothing } 
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdFTP.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdFTP(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdFTP.CompileImport2(CompExec: TPSScript);
begin
  { nothing } 
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdFTP.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdFTP(ri);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdFTP.ExecImport2(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  { nothing } 
end;
 
 
end.
