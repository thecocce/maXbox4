unit uPSI_ALWinHttpClient;
{
This file has been generated by UnitParser v0.7, written by M. Knight
and updated by NP. v/d Spek and George Birbilis. 
Source Code from Carlo Kok has been used to implement various sections of
UnitParser. Components of ROPS are used in the construction of UnitParser,
code implementing the class wrapper is taken from Carlo Kok's conv utility
  set problems

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
  TPSImport_ALWinHttpClient = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TALWinHttpClient(CL: TPSPascalCompiler);
procedure SIRegister_ALWinHttpClient(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TALWinHttpClient(CL: TPSRuntimeClassImporter);
procedure RIRegister_ALWinHttpClient(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,ALHttpCommon
  ,ALHttpClient
  ,ALWinHttpWrapper
  ,ALWinHttpClient
  ;


procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_ALWinHttpClient]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TALWinHttpClient(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TALHTTPClient', 'TALWinHttpClient') do
  with CL.AddClassN(CL.FindClass('TALHTTPClient'),'TALWinHttpClient') do begin
    RegisterMethod('Constructor Create');
     RegisterMethod('Procedure Free');
    RegisterMethod('Procedure Connect');
    RegisterMethod('Procedure Disconnect');
    RegisterMethod('Function Send( aRequestDataStream : TStream) : Integer');
    RegisterMethod('Procedure Receive( aContext : Dword; aResponseContentStream : TStream; aResponseContentHeader : TALHTTPResponseHeader)');
    RegisterProperty('AccessType', 'TALWinHttpClientInternetOpenAccessType', iptrw);
    RegisterProperty('InternetOptions', 'TALWinHttpClientInternetOptionSet', iptrw);
    RegisterProperty('InternetOptions2', 'TALWinHttpClientInternetOptionSet2', iptrw);
    RegisterProperty('DisconnectOnError', 'Boolean', iptrw);
    RegisterProperty('OnStatusChange', 'TALWinHttpClientStatusChangeEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_ALWinHttpClient(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('DWORD_PTR', 'DWORD');
  CL.AddTypeS('TALWinHttpClientInternetOpenAccessType', '( wHttpAt_NO_PROXY, wH'
   +'ttpAt_DEFAULT_PROXY, wHttpAt_NAMED_PROXY )');
  CL.AddTypeS('TAlWinHttpClientInternetOption', '( wHttpIo_Async, wHttpIo_BYPAS'
   +'S_PROXY_CACHE, wHttpIo_ESCAPE_DISABLE, wHttpIo_ESCAPE_DISABLE_QUERY, wHttp'
   +'Io_ESCAPE_PERCENT, wHttpIo_NULL_CODEPAGE, wHttpIo_REFRESH, wHttpIo_SECURE,'
   +' wHttpIo_Keep_connection, wHttpIo_No_cookies, wHttpIo_No_auto_redirect )');
  CL.AddTypeS('TALWinHttpClientInternetOptionSet', 'set of TALWinHttpClientInternetOption');
  CL.AddTypeS('TALWinHttpClientInternetOptionSet2', 'TALWinHttpClientInternetOption');

 // CL.AddTypeS('TALWinHttpClientStatusChangeEvent', 'Procedure ( sender : Tobjec'
   //+'t; InternetStatus : DWord; StatusInformation : Pointer; StatusInformationLength : DWord)');
  SIRegister_TALWinHttpClient(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientOnStatusChange_W(Self: TALWinHttpClient; const T: TALWinHttpClientStatusChangeEvent);
begin Self.OnStatusChange := T; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientOnStatusChange_R(Self: TALWinHttpClient; var T: TALWinHttpClientStatusChangeEvent);
begin T := Self.OnStatusChange; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientDisconnectOnError_W(Self: TALWinHttpClient; const T: Boolean);
begin Self.DisconnectOnError := T; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientDisconnectOnError_R(Self: TALWinHttpClient; var T: Boolean);
begin T := Self.DisconnectOnError; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientInternetOptions_W(Self: TALWinHttpClient; const T: TALWinHttpClientInternetOptionSet);
begin Self.InternetOptions := T; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientInternetOptions_R(Self: TALWinHttpClient; var T: TALWinHttpClientInternetOptionSet);
begin T := Self.InternetOptions; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientAccessType_W(Self: TALWinHttpClient; const T: TALWinHttpClientInternetOpenAccessType);
begin Self.AccessType := T; end;

(*----------------------------------------------------------------------------*)
procedure TALWinHttpClientAccessType_R(Self: TALWinHttpClient; var T: TALWinHttpClientInternetOpenAccessType);
begin T := Self.AccessType; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TALWinHttpClient(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TALWinHttpClient) do  begin
    RegisterConstructor(@TALWinHttpClient.Create, 'Create');
    RegisterMethod(@TALWinHttpClient.Destroy, 'Free');
    RegisterMethod(@TALWinHttpClient.Connect, 'Connect');
    RegisterMethod(@TALWinHttpClient.Disconnect, 'Disconnect');
    RegisterVirtualMethod(@TALWinHttpClient.Send, 'Send');
    RegisterVirtualMethod(@TALWinHttpClient.Receive, 'Receive');
    RegisterPropertyHelper(@TALWinHttpClientAccessType_R,@TALWinHttpClientAccessType_W,'AccessType');
    RegisterPropertyHelper(@TALWinHttpClientInternetOptions_R,@TALWinHttpClientInternetOptions_W,'InternetOptions');
    RegisterPropertyHelper(@TALWinHttpClientInternetOptions_R,@TALWinHttpClientInternetOptions_W,'InternetOptions2');

    RegisterPropertyHelper(@TALWinHttpClientDisconnectOnError_R,@TALWinHttpClientDisconnectOnError_W,'DisconnectOnError');
    RegisterPropertyHelper(@TALWinHttpClientOnStatusChange_R,@TALWinHttpClientOnStatusChange_W,'OnStatusChange');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_ALWinHttpClient(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TALWinHttpClient(CL);
end;

 
 
{ TPSImport_ALWinHttpClient }
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALWinHttpClient.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_ALWinHttpClient(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALWinHttpClient.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_ALWinHttpClient(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
