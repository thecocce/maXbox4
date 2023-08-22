unit uPSI_JvTransLED;
{
This file has been generated by UnitParser v0.7, written by M. Knight
   LED BOX
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
  TPSImport_JvTransLED = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvTransLED(CL: TPSPascalCompiler);
procedure SIRegister_JvTransLED(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvTransLED(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvTransLED(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Graphics
  ,JvComponent
  ,JvTransLED
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvTransLED]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvTransLED(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvGraphicControl', 'TJvTransLED') do
  with CL.AddClassN(CL.FindClass('TJvGraphicControl'),'TJvTransLED') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure SetBounds( ALeft, ATop, AWidth, AHeight : Integer)');
    RegisterProperty('Color', 'TColor', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvTransLED(CL: TPSPascalCompiler);
begin
  SIRegister_TJvTransLED(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvTransLEDColor_W(Self: TJvTransLED; const T: TColor);
begin Self.Color := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvTransLEDColor_R(Self: TJvTransLED; var T: TColor);
begin T := Self.Color; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvTransLED(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvTransLED) do
  begin
    RegisterConstructor(@TJvTransLED.Create, 'Create');
    RegisterMethod(@TJvTransLED.SetBounds, 'SetBounds');
    RegisterPropertyHelper(@TJvTransLEDColor_R,@TJvTransLEDColor_W,'Color');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvTransLED(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TJvTransLED(CL);
end;

 
 
{ TPSImport_JvTransLED }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvTransLED.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvTransLED(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvTransLED.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvTransLED(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
