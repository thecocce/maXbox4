unit uPSI_IdEchoUDP;
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
  TPSImport_IdEchoUDP = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdEchoUDP(CL: TPSPascalCompiler);
procedure SIRegister_IdEchoUDP(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdEchoUDP(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdEchoUDP(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdAssignedNumbers
  ,IdUDPBase
  ,IdUDPClient
  ,IdEchoUDP
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdEchoUDP]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdEchoUDP(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPClient', 'TIdEchoUDP') do
  with CL.AddClassN(CL.FindClass('TIdUDPClient'),'TIdEchoUDP') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Function Echo( AText : String) : String');
    RegisterProperty('EchoTime', 'Cardinal', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdEchoUDP(CL: TPSPascalCompiler);
begin
  SIRegister_TIdEchoUDP(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdEchoUDPEchoTime_R(Self: TIdEchoUDP; var T: Cardinal);
begin T := Self.EchoTime; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdEchoUDP(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdEchoUDP) do
  begin
    RegisterConstructor(@TIdEchoUDP.Create, 'Create');
    RegisterMethod(@TIdEchoUDP.Echo, 'Echo');
    RegisterPropertyHelper(@TIdEchoUDPEchoTime_R,nil,'EchoTime');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdEchoUDP(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdEchoUDP(CL);
end;

 
 
{ TPSImport_IdEchoUDP }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdEchoUDP.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdEchoUDP(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdEchoUDP.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdEchoUDP(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.