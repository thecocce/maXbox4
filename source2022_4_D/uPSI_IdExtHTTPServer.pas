unit uPSI_IdExtHTTPServer;
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
  TPSImport_IdExtHTTPServer = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdExtApplication(CL: TPSPascalCompiler);
procedure SIRegister_TIdExtHTTPServer(CL: TPSPascalCompiler);
procedure SIRegister_TIdExtSessionList(CL: TPSPascalCompiler);
procedure SIRegister_TIdExtSession(CL: TPSPascalCompiler);
procedure SIRegister_IdExtHTTPServer(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_IdExtHTTPServer_Routines(S: TPSExec);
procedure RIRegister_TIdExtApplication(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdExtHTTPServer(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdExtSessionList(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdExtSession(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdExtHTTPServer(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdCustomHTTPServer
  ,IdHTTPServer
  //,IdContext
  ,ExtPascalUtils
  ,IdExtHTTPServer
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdExtHTTPServer]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdExtApplication(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TIdExtApplication') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TIdExtApplication') do
  begin
    RegisterProperty('Title', 'string', iptrw);
    RegisterMethod('Constructor Create( ATitle : string; ASessionClass : TIdExtSessionClass; APort : word; AMaxIdleMinutes : word; AMaxConns : integer)');
    RegisterMethod('Procedure Run');
    RegisterProperty('Icon', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdExtHTTPServer(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHTTPServer', 'TIdExtHTTPServer') do
  with CL.AddClassN(CL.FindClass('TIdHTTPServer'),'TIdExtHTTPServer') do
  begin
    RegisterMethod('Constructor Create( const AExtSessionClass : TIdExtSessionClass)');
    RegisterProperty('ExtSessionClass', 'TIdExtSessionClass', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdExtSessionList(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHTTPDefaultSessionList', 'TIdExtSessionList') do
  with CL.AddClassN(CL.FindClass('TIdHTTPDefaultSessionList'),'TIdExtSessionList') do
  begin
    RegisterMethod('Constructor Create( const AOwner : TIdExtHTTPServer)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdExtSession(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHTTPSession', 'TIdExtSession') do
  with CL.AddClassN(CL.FindClass('TIdHTTPSession'),'TIdExtSession') do
  begin
    RegisterProperty('Response', 'string', iptrw);
    RegisterProperty('ContentType', 'string', iptrw);
    RegisterProperty('MaxUploadSize', 'integer', iptrw);
    RegisterMethod('Constructor Create( NewSocket : integer)');
    RegisterMethod('Constructor CreateInitialized( AOwner : TIdHTTPCustomSessionList; const SessionID, RemoteIP : String)');
    RegisterMethod('Procedure HandleRequest( ARequest : TIdHTTPRequestInfo; AResponse : TIdHTTPResponseInfo)');
    RegisterMethod('Procedure AddToGarbage( const Name : string; Obj : TObject)');
    RegisterMethod('Procedure DeleteFromGarbage( Obj : TObject);');
    RegisterMethod('Procedure DeleteFromGarbage1( Name : string);');
    RegisterMethod('Function FindObject( Name : string) : TObject');
    RegisterMethod('Function ExistsReference( Name : string) : boolean');
    RegisterMethod('Function MethodURI1( AMethodName : string) : string;');
    RegisterMethod('Function MethodURI2( AMethodName : TExtProcedure) : string;');
    RegisterMethod('Procedure Alert( Msg : string)');
    RegisterMethod('Procedure DownloadBuffer( Name, Buffer : AnsiString; pContentType : string)');
    RegisterProperty('PathInfo', 'string', iptr);
    RegisterProperty('Query', 'string string', iptr);
    RegisterProperty('QueryAsBoolean', 'boolean string', iptr);
    RegisterProperty('QueryAsInteger', 'integer string', iptr);
    RegisterProperty('QueryAsDouble', 'double string', iptr);
    RegisterProperty('QueryAsTDateTime', 'TDateTime string', iptr);
    RegisterProperty('Queries', 'TStringList', iptr);
    RegisterProperty('RequestHeader', 'string string', iptr);
    RegisterProperty('Cookie', 'string string', iptr);
    RegisterProperty('NewThread', 'boolean', iptrw);
    RegisterProperty('IsAjax', 'boolean', iptr);
    RegisterProperty('IsUpload', 'boolean', iptr);
    RegisterProperty('IsDownload', 'boolean', iptr);
    RegisterProperty('Browser', 'TBrowser', iptr);
    RegisterProperty('FileUploaded', 'string', iptr);
    RegisterProperty('FileUploadedFullName', 'string', iptr);
    RegisterProperty('WebServer', 'string', iptr);
    RegisterMethod('Procedure Home');
    RegisterMethod('Procedure Logout');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdExtHTTPServer(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'TIdExtHTTPServer');
  SIRegister_TIdExtSession(CL);
  //CL.AddTypeS('TIdExtSessionClass', 'class of TIdExtSession');
  SIRegister_TIdExtSessionList(CL);
  SIRegister_TIdExtHTTPServer(CL);
  SIRegister_TIdExtApplication(CL);
  CL.AddTypeS('TMimeExtension', 'record Ext : string; MimeType : string; end');
 CL.AddDelphiFunction('Function FileType2MimeType( const AFileName : string) : string');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdExtApplicationIcon_W(Self: TIdExtApplication; const T: string);
begin Self.Icon := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtApplicationIcon_R(Self: TIdExtApplication; var T: string);
begin T := Self.Icon; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtApplicationTitle_W(Self: TIdExtApplication; const T: string);
Begin Self.Title := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtApplicationTitle_R(Self: TIdExtApplication; var T: string);
Begin T := Self.Title; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtHTTPServerExtSessionClass_W(Self: TIdExtHTTPServer; const T: TIdExtSessionClass);
begin Self.ExtSessionClass := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtHTTPServerExtSessionClass_R(Self: TIdExtHTTPServer; var T: TIdExtSessionClass);
begin T := Self.ExtSessionClass; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionWebServer_R(Self: TIdExtSession; var T: string);
begin T := Self.WebServer; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionFileUploadedFullName_R(Self: TIdExtSession; var T: string);
begin T := Self.FileUploadedFullName; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionFileUploaded_R(Self: TIdExtSession; var T: string);
begin T := Self.FileUploaded; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionBrowser_R(Self: TIdExtSession; var T: TBrowser);
begin T := Self.Browser; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionIsDownload_R(Self: TIdExtSession; var T: boolean);
begin T := Self.IsDownload; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionIsUpload_R(Self: TIdExtSession; var T: boolean);
begin T := Self.IsUpload; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionIsAjax_R(Self: TIdExtSession; var T: boolean);
begin T := Self.IsAjax; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionNewThread_W(Self: TIdExtSession; const T: boolean);
begin Self.NewThread := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionNewThread_R(Self: TIdExtSession; var T: boolean);
begin T := Self.NewThread; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionCookie_R(Self: TIdExtSession; var T: string; const t1: string);
begin T := Self.Cookie[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionRequestHeader_R(Self: TIdExtSession; var T: string; const t1: string);
begin T := Self.RequestHeader[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionQueries_R(Self: TIdExtSession; var T: TStringList);
begin T := Self.Queries; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionQueryAsTDateTime_R(Self: TIdExtSession; var T: TDateTime; const t1: string);
begin T := Self.QueryAsTDateTime[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionQueryAsDouble_R(Self: TIdExtSession; var T: double; const t1: string);
begin T := Self.QueryAsDouble[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionQueryAsInteger_R(Self: TIdExtSession; var T: integer; const t1: string);
begin T := Self.QueryAsInteger[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionQueryAsBoolean_R(Self: TIdExtSession; var T: boolean; const t1: string);
begin T := Self.QueryAsBoolean[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionQuery_R(Self: TIdExtSession; var T: string; const t1: string);
begin T := Self.Query[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionPathInfo_R(Self: TIdExtSession; var T: string);
begin T := Self.PathInfo; end;

(*----------------------------------------------------------------------------*)
Function TIdExtSessionMethodURI2_P(Self: TIdExtSession;  AMethodName : TExtProcedure) : string;
Begin Result := Self.MethodURI(AMethodName); END;

(*----------------------------------------------------------------------------*)
Function TIdExtSessionMethodURI1_P(Self: TIdExtSession;  AMethodName : string) : string;
Begin Result := Self.MethodURI(AMethodName); END;

(*----------------------------------------------------------------------------*)
Procedure TIdExtSessionDeleteFromGarbage1_P(Self: TIdExtSession;  Name : string);
Begin Self.DeleteFromGarbage(Name); END;

(*----------------------------------------------------------------------------*)
Procedure TIdExtSessionDeleteFromGarbage_P(Self: TIdExtSession;  Obj : TObject);
Begin Self.DeleteFromGarbage(Obj); END;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionMaxUploadSize_W(Self: TIdExtSession; const T: integer);
Begin Self.MaxUploadSize := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionMaxUploadSize_R(Self: TIdExtSession; var T: integer);
Begin T := Self.MaxUploadSize; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionContentType_W(Self: TIdExtSession; const T: string);
Begin Self.ContentType := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionContentType_R(Self: TIdExtSession; var T: string);
Begin T := Self.ContentType; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionResponse_W(Self: TIdExtSession; const T: string);
Begin Self.Response := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdExtSessionResponse_R(Self: TIdExtSession; var T: string);
Begin T := Self.Response; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdExtHTTPServer_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@FileType2MimeType, 'FileType2MimeType', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdExtApplication(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdExtApplication) do
  begin
    RegisterPropertyHelper(@TIdExtApplicationTitle_R,@TIdExtApplicationTitle_W,'Title');
    RegisterConstructor(@TIdExtApplication.Create, 'Create');
    RegisterMethod(@TIdExtApplication.Run, 'Run');
    RegisterPropertyHelper(@TIdExtApplicationIcon_R,@TIdExtApplicationIcon_W,'Icon');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdExtHTTPServer(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdExtHTTPServer) do
  begin
    RegisterConstructor(@TIdExtHTTPServer.Create, 'Create');
    RegisterPropertyHelper(@TIdExtHTTPServerExtSessionClass_R,@TIdExtHTTPServerExtSessionClass_W,'ExtSessionClass');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdExtSessionList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdExtSessionList) do
  begin
    RegisterConstructor(@TIdExtSessionList.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdExtSession(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdExtSession) do
  begin
    RegisterPropertyHelper(@TIdExtSessionResponse_R,@TIdExtSessionResponse_W,'Response');
    RegisterPropertyHelper(@TIdExtSessionContentType_R,@TIdExtSessionContentType_W,'ContentType');
    RegisterPropertyHelper(@TIdExtSessionMaxUploadSize_R,@TIdExtSessionMaxUploadSize_W,'MaxUploadSize');
    RegisterVirtualConstructor(@TIdExtSession.Create, 'Create');
    RegisterConstructor(@TIdExtSession.CreateInitialized, 'CreateInitialized');
    RegisterMethod(@TIdExtSession.HandleRequest, 'HandleRequest');
    RegisterMethod(@TIdExtSession.AddToGarbage, 'AddToGarbage');
    RegisterMethod(@TIdExtSessionDeleteFromGarbage_P, 'DeleteFromGarbage');
    RegisterMethod(@TIdExtSessionDeleteFromGarbage1_P, 'DeleteFromGarbage1');
    RegisterMethod(@TIdExtSession.FindObject, 'FindObject');
    RegisterMethod(@TIdExtSession.ExistsReference, 'ExistsReference');
    RegisterMethod(@TIdExtSessionMethodURI1_P, 'MethodURI1');
    RegisterMethod(@TIdExtSessionMethodURI2_P, 'MethodURI2');
    RegisterVirtualMethod(@TIdExtSession.Alert, 'Alert');
    RegisterMethod(@TIdExtSession.DownloadBuffer, 'DownloadBuffer');
    RegisterPropertyHelper(@TIdExtSessionPathInfo_R,nil,'PathInfo');
    RegisterPropertyHelper(@TIdExtSessionQuery_R,nil,'Query');
    RegisterPropertyHelper(@TIdExtSessionQueryAsBoolean_R,nil,'QueryAsBoolean');
    RegisterPropertyHelper(@TIdExtSessionQueryAsInteger_R,nil,'QueryAsInteger');
    RegisterPropertyHelper(@TIdExtSessionQueryAsDouble_R,nil,'QueryAsDouble');
    RegisterPropertyHelper(@TIdExtSessionQueryAsTDateTime_R,nil,'QueryAsTDateTime');
    RegisterPropertyHelper(@TIdExtSessionQueries_R,nil,'Queries');
    RegisterPropertyHelper(@TIdExtSessionRequestHeader_R,nil,'RequestHeader');
    RegisterPropertyHelper(@TIdExtSessionCookie_R,nil,'Cookie');
    RegisterPropertyHelper(@TIdExtSessionNewThread_R,@TIdExtSessionNewThread_W,'NewThread');
    RegisterPropertyHelper(@TIdExtSessionIsAjax_R,nil,'IsAjax');
    RegisterPropertyHelper(@TIdExtSessionIsUpload_R,nil,'IsUpload');
    RegisterPropertyHelper(@TIdExtSessionIsDownload_R,nil,'IsDownload');
    RegisterPropertyHelper(@TIdExtSessionBrowser_R,nil,'Browser');
    RegisterPropertyHelper(@TIdExtSessionFileUploaded_R,nil,'FileUploaded');
    RegisterPropertyHelper(@TIdExtSessionFileUploadedFullName_R,nil,'FileUploadedFullName');
    RegisterPropertyHelper(@TIdExtSessionWebServer_R,nil,'WebServer');
    RegisterVirtualAbstractMethod(@TIdExtSession, @!.Home, 'Home');
    RegisterVirtualMethod(@TIdExtSession.Logout, 'Logout');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdExtHTTPServer(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdExtHTTPServer) do
  RIRegister_TIdExtSession(CL);
  RIRegister_TIdExtSessionList(CL);
  RIRegister_TIdExtHTTPServer(CL);
  RIRegister_TIdExtApplication(CL);
end;

 
 
{ TPSImport_IdExtHTTPServer }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdExtHTTPServer.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdExtHTTPServer(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdExtHTTPServer.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdExtHTTPServer(ri);
  RIRegister_IdExtHTTPServer_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
