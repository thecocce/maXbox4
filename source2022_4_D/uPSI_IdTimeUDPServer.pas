unit uPSI_IdTimeUDPServer;
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
  TPSImport_IdTimeUDPServer = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdTimeUDPServer(CL: TPSPascalCompiler);
procedure SIRegister_IdTimeUDPServer(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdTimeUDPServer(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdTimeUDPServer(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAssignedNumbers
  ,IdSocketHandle
  ,IdUDPBase
  ,IdUDPServer
  ,IdTimeUDPServer
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdTimeUDPServer]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdTimeUDPServer(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPServer', 'TIdTimeUDPServer') do
  with CL.AddClassN(CL.FindClass('TIdUDPServer'),'TIdTimeUDPServer') do
  begin
    RegisterMethod('Constructor Create( axOwner : TComponent)');
    RegisterProperty('BaseDate', 'TDateTime', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdTimeUDPServer(CL: TPSPascalCompiler);
begin
  SIRegister_TIdTimeUDPServer(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPServerBaseDate_W(Self: TIdTimeUDPServer; const T: TDateTime);
begin Self.BaseDate := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdTimeUDPServerBaseDate_R(Self: TIdTimeUDPServer; var T: TDateTime);
begin T := Self.BaseDate; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdTimeUDPServer(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdTimeUDPServer) do
  begin
    RegisterConstructor(@TIdTimeUDPServer.Create, 'Create');
    RegisterPropertyHelper(@TIdTimeUDPServerBaseDate_R,@TIdTimeUDPServerBaseDate_W,'BaseDate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdTimeUDPServer(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdTimeUDPServer(CL);
end;

 
 
{ TPSImport_IdTimeUDPServer }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdTimeUDPServer.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdTimeUDPServer(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdTimeUDPServer.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdTimeUDPServer(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
