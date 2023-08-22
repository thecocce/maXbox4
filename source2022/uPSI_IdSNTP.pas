unit uPSI_IdSNTP;
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
  TPSImport_IdSNTP = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdSNTP(CL: TPSPascalCompiler);
procedure SIRegister_IdSNTP(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdSNTP(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdSNTP(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdUDPClient
  ,IdSNTP
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdSNTP]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdSNTP(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdUDPClient', 'TIdSNTP') do
  with CL.AddClassN(CL.FindClass('TIdUDPClient'),'TIdSNTP') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure Free;');
    RegisterMethod('Function SyncTime : Boolean');
    RegisterProperty('AdjustmentTime', 'TDateTime', iptr);
    RegisterProperty('DateTime', 'TDateTime', iptr);
    RegisterProperty('RoundTripDelay', 'TDateTime', iptr);
    RegisterProperty('CheckStratum', 'Boolean', iptrw);
    RegisterProperty('Host', 'String', iptrw);
    RegisterProperty('UserName', 'String', iptrw);
    RegisterProperty('Password', 'String', iptrw);
    RegisterProperty('Port', 'Integer', iptrw);

  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdSNTP(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('NTPMaxInt','Extended').setExtended( 4294967297.0);
  CL.AddTypeS('TNTPGram', 'record Head1 : byte; Head2 : byte; Head3 : byte; Hea'
   +'d4 : byte; RootDelay : longint; RootDispersion : longint; RefID : longint;'
   +' Ref1 : longint; Ref2 : longint; Org1 : longint; Org2 : longint; Rcv1 : lo'
   +'ngint; Rcv2 : longint; Xmit1 : longint; Xmit2 : longint; end');
  CL.AddTypeS('TLr', 'record L1 : byte; L2 : byte; L3 : byte; L4 : byte; end');
  SIRegister_TIdSNTP(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdSNTPCheckStratum_W(Self: TIdSNTP; const T: Boolean);
begin Self.CheckStratum := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdSNTPCheckStratum_R(Self: TIdSNTP; var T: Boolean);
begin T := Self.CheckStratum; end;

(*----------------------------------------------------------------------------*)
procedure TIdSNTPRoundTripDelay_R(Self: TIdSNTP; var T: TDateTime);
begin T := Self.RoundTripDelay; end;

(*----------------------------------------------------------------------------*)
procedure TIdSNTPDateTime_R(Self: TIdSNTP; var T: TDateTime);
begin T := Self.DateTime; end;

(*----------------------------------------------------------------------------*)
procedure TIdSNTPAdjustmentTime_R(Self: TIdSNTP; var T: TDateTime);
begin T := Self.AdjustmentTime; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdSNTP(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdSNTP) do begin
    RegisterConstructor(@TIdSNTP.Create, 'Create');
    RegisterMethod(@TIdSNTP.SyncTime, 'SyncTime');
    RegisterMethod(@TIdSNTP.Destroy, 'Free');
    RegisterPropertyHelper(@TIdSNTPAdjustmentTime_R,nil,'AdjustmentTime');
    RegisterPropertyHelper(@TIdSNTPDateTime_R,nil,'DateTime');
    RegisterPropertyHelper(@TIdSNTPRoundTripDelay_R,nil,'RoundTripDelay');
    RegisterPropertyHelper(@TIdSNTPCheckStratum_R,@TIdSNTPCheckStratum_W,'CheckStratum');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdSNTP(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIdSNTP(CL);
end;

 
 
{ TPSImport_IdSNTP }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdSNTP.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdSNTP(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdSNTP.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdSNTP(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.