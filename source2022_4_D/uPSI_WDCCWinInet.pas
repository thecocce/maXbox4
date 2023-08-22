unit uPSI_WDCCWinInet;
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
  TPSImport_WDCCWinInet = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TWinINetGetThread(CL: TPSPascalCompiler);
procedure SIRegister_WDCCWinInet(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_WDCCWinInet_Routines(S: TPSExec);
procedure RIRegister_TWinINetGetThread(CL: TPSRuntimeClassImporter);
procedure RIRegister_WDCCWinInet(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Messages
  ,WDCCWinInet
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_WDCCWinInet]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TWinINetGetThread(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TThread', 'TWinINetGetThread') do
  with CL.AddClassN(CL.FindClass('TThread'),'TWinINetGetThread') do
  begin
    RegisterMethod('Constructor Create( const Url : string; Stream : TStream; CallBack : TuWinInetProcCallBack; HWND : HWND);');
    RegisterMethod('Procedure Execute');
    RegisterMethod('Procedure Free;');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_WDCCWinInet(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('WM_UWININET_THREAD_FINISHED','LongInt').SetInt( WM_USER + 669);
 CL.AddConstantN('WM_UWININET_THREAD_CANCELLED','LongInt').SetInt( WM_USER + 670);
 CL.AddTypeS('TuWinInetProcCallBack', 'Procedure ( BytesRead : Integer)');
  SIRegister_TWinINetGetThread(CL);
 CL.AddDelphiFunction('Function wdc_GetRemoteFileSize( const Url : string) : Integer');
 CL.AddDelphiFunction('Procedure wdc_WinInet_HttpGet( const Url : string; Stream : TStream; CallBack : TuWinInetProcCallBack);');
 CL.AddDelphiFunction('Function wdc_WinInet_HttpGet2( const Url : string; CallBack : TuWinInetProcCallBack) : string;');
 CL.AddDelphiFunction('Function wdc_GetWinInetError( ErrorCode : Cardinal) : string');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
Function WinInet_HttpGet2_P( const Url : string; CallBack : TuWinInetProcCallBack) : string;
Begin Result := WDCCWinInet.WinInet_HttpGet(Url, CallBack); END;

(*----------------------------------------------------------------------------*)
Procedure WinInet_HttpGet_P( const Url : string; Stream : TStream; CallBack : TuWinInetProcCallBack);
Begin WDCCWinInet.WinInet_HttpGet(Url, Stream, CallBack); END;

(*----------------------------------------------------------------------------*)
Function TWinINetGetThreadCreate_P(Self: TClass; CreateNewInstance: Boolean;  const Url : string; Stream : TStream; CallBack : TuWinInetProcCallBack; HWND : HWND):TObject;
Begin Result := TWinINetGetThread.Create(Url, Stream, CallBack, HWND); END;

(*----------------------------------------------------------------------------*)
procedure RIRegister_WDCCWinInet_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@GetRemoteFileSize, 'wdc_GetRemoteFileSize', cdRegister);
 S.RegisterDelphiFunction(@WinInet_HttpGet, 'wdc_WinInet_HttpGet', cdRegister);
 S.RegisterDelphiFunction(@WinInet_HttpGet2_P, 'wdc_WinInet_HttpGet2', cdRegister);
 S.RegisterDelphiFunction(@GetWinInetError, 'wdc_GetWinInetError', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TWinINetGetThread(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TWinINetGetThread) do
  begin
    RegisterConstructor(@TWinINetGetThreadCreate_P, 'Create');
    RegisterMethod(@TWinINetGetThread.Execute, 'Execute');
    RegisterMethod(@TWinINetGetThread.Destroy, 'Free');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_WDCCWinInet(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TWinINetGetThread(CL);
end;

 
 
{ TPSImport_WDCCWinInet }
(*----------------------------------------------------------------------------*)
procedure TPSImport_WDCCWinInet.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_WDCCWinInet(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_WDCCWinInet.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_WDCCWinInet(ri);
  RIRegister_WDCCWinInet_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
