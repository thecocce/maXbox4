unit uPSI_DbxSocketChannelNative;
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
  TPSImport_DbxSocketChannelNative = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TDBXSocketChannel(CL: TPSPascalCompiler);
procedure SIRegister_DbxSocketChannelNative(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TDBXSocketChannel(CL: TPSRuntimeClassImporter);
procedure RIRegister_DbxSocketChannelNative(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   DBXCommon
  ,DBXChannel
  ,ScktComp
  ,DbxSocketChannelNative
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_DbxSocketChannelNative]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TDBXSocketChannel(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TDBXChannel', 'TDBXSocketChannel') do
  with CL.AddClassN(CL.FindClass('TDBXChannel'),'TDBXSocketChannel') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure Open');
    RegisterMethod('Procedure Close');
    RegisterMethod('Function Read( const Buffer : TBytes; Offset : Integer; Count : Integer) : Integer');
    RegisterMethod('Function Write( const Buffer : TBytes; Offset : Integer; Count : Integer) : Integer');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_DbxSocketChannelNative(CL: TPSPascalCompiler);
begin
  SIRegister_TDBXSocketChannel(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TDBXSocketChannel(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TDBXSocketChannel) do
  begin
    RegisterConstructor(@TDBXSocketChannel.Create, 'Create');
    RegisterMethod(@TDBXSocketChannel.Open, 'Open');
    RegisterMethod(@TDBXSocketChannel.Close, 'Close');
    RegisterMethod(@TDBXSocketChannel.Read, 'Read');
    RegisterMethod(@TDBXSocketChannel.Write, 'Write');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_DbxSocketChannelNative(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TDBXSocketChannel(CL);
end;

 
 
{ TPSImport_DbxSocketChannelNative }
(*----------------------------------------------------------------------------*)
procedure TPSImport_DbxSocketChannelNative.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_DbxSocketChannelNative(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_DbxSocketChannelNative.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_DbxSocketChannelNative(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
