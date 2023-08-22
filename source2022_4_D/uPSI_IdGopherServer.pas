unit uPSI_IdGopherServer;
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
  TPSImport_IdGopherServer = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdGopherServer(CL: TPSPascalCompiler);
procedure SIRegister_IdGopherServer(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdGopherServer(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdGopherServer(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAssignedNumbers
  ,IdTCPServer
  ,IdGopherServer
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdGopherServer]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdGopherServer(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdTCPServer', 'TIdGopherServer') do
  with CL.AddClassN(CL.FindClass('TIdTCPServer'),'TIdGopherServer') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Function ReturnGopherItem( ItemType : Char; UserFriendlyName, RealResourceName : String; HostServer : String; HostPort : Integer) : String');
    RegisterMethod('Procedure SendDirectoryEntry( Thread : TIdPeerThread; ItemType : Char; UserFriendlyName, RealResourceName : String; HostServer : String; HostPort : Integer)');
    RegisterMethod('Procedure SetTruncateUserFriendlyName( truncate : Boolean)');
    RegisterMethod('Procedure SetTruncateLength( length : Integer)');
    RegisterProperty('AdminEmail', 'String', iptrw);
    RegisterProperty('OnRequest', 'TRequestEvent', iptrw);
    RegisterProperty('OnPlusRequest', 'TPlusRequestEvent', iptrw);
    RegisterProperty('TruncateUserFriendlyName', 'Boolean', iptrw);
    RegisterProperty('TruncateLength', 'Integer', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdGopherServer(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TRequestEvent', 'Procedure ( AThread : TIdPeerThread; ARequest :'
   +' String)');
  CL.AddTypeS('TPlusRequestEvent', 'Procedure ( AThread : TIdPeerThread; AReque'
   +'st : String; APlusData : String)');
  SIRegister_TIdGopherServer(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdGopherServerTruncateLength_W(Self: TIdGopherServer; const T: Integer);
begin Self.TruncateLength := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerTruncateLength_R(Self: TIdGopherServer; var T: Integer);
begin T := Self.TruncateLength; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerTruncateUserFriendlyName_W(Self: TIdGopherServer; const T: Boolean);
begin Self.TruncateUserFriendlyName := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerTruncateUserFriendlyName_R(Self: TIdGopherServer; var T: Boolean);
begin T := Self.TruncateUserFriendlyName; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerOnPlusRequest_W(Self: TIdGopherServer; const T: TPlusRequestEvent);
begin Self.OnPlusRequest := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerOnPlusRequest_R(Self: TIdGopherServer; var T: TPlusRequestEvent);
begin T := Self.OnPlusRequest; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerOnRequest_W(Self: TIdGopherServer; const T: TRequestEvent);
begin Self.OnRequest := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerOnRequest_R(Self: TIdGopherServer; var T: TRequestEvent);
begin T := Self.OnRequest; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerAdminEmail_W(Self: TIdGopherServer; const T: String);
begin Self.AdminEmail := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdGopherServerAdminEmail_R(Self: TIdGopherServer; var T: String);
begin T := Self.AdminEmail; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdGopherServer(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdGopherServer) do
  begin
    RegisterConstructor(@TIdGopherServer.Create, 'Create');
    RegisterMethod(@TIdGopherServer.ReturnGopherItem, 'ReturnGopherItem');
    RegisterMethod(@TIdGopherServer.SendDirectoryEntry, 'SendDirectoryEntry');
    RegisterMethod(@TIdGopherServer.SetTruncateUserFriendlyName, 'SetTruncateUserFriendlyName');
    RegisterMethod(@TIdGopherServer.SetTruncateLength, 'SetTruncateLength');
    RegisterPropertyHelper(@TIdGopherServerAdminEmail_R,@TIdGopherServerAdminEmail_W,'AdminEmail');
    RegisterPropertyHelper(@TIdGopherServerOnRequest_R,@TIdGopherServerOnRequest_W,'OnRequest');
    RegisterPropertyHelper(@TIdGopherServerOnPlusRequest_R,@TIdGopherServerOnPlusRequest_W,'OnPlusRequest');
    RegisterPropertyHelper(@TIdGopherServerTruncateUserFriendlyName_R,@TIdGopherServerTruncateUserFriendlyName_W,'TruncateUserFriendlyName');
    RegisterPropertyHelper(@TIdGopherServerTruncateLength_R,@TIdGopherServerTruncateLength_W,'TruncateLength');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdGopherServer(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdGopherServer(CL);
end;

 
 
{ TPSImport_IdGopherServer }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdGopherServer.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdGopherServer(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdGopherServer.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdGopherServer(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
