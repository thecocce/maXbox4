unit uPSI_IdTCPStream;
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
  TPSImport_IdTCPStream = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdTCPStream(CL: TPSPascalCompiler);
procedure SIRegister_IdTCPStream(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdTCPStream(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdTCPStream(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdTCPConnection
  ,IdTCPStream
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdTCPStream]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdTCPStream(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStream', 'TIdTCPStream') do
  with CL.AddClassN(CL.FindClass('TStream'),'TIdTCPStream') do
  begin
    RegisterMethod('Constructor Create( AConnection : TIdTCPConnection)');
    RegisterProperty('Connection', 'TIdTCPConnection', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdTCPStream(CL: TPSPascalCompiler);
begin
  SIRegister_TIdTCPStream(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdTCPStreamConnection_R(Self: TIdTCPStream; var T: TIdTCPConnection);
begin T := Self.Connection; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdTCPStream(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdTCPStream) do
  begin
    RegisterConstructor(@TIdTCPStream.Create, 'Create');
    RegisterPropertyHelper(@TIdTCPStreamConnection_R,nil,'Connection');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdTCPStream(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdTCPStream(CL);
end;

 
 
{ TPSImport_IdTCPStream }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdTCPStream.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdTCPStream(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdTCPStream.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdTCPStream(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.