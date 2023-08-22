unit uPSI_JvRgbToHtml;
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
  TPSImport_JvRgbToHtml = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvRgbToHtml(CL: TPSPascalCompiler);
procedure SIRegister_JvRgbToHtml(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_JvRgbToHtml_Routines(S: TPSExec);
procedure RIRegister_TJvRgbToHtml(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvRgbToHtml(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   Windows
  ,Graphics
  ,JvComponent
  ,JvRgbToHtml
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvRgbToHtml]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvRgbToHtml(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvComponent', 'TJvRgbToHtml') do
  with CL.AddClassN(CL.FindClass('TJvComponent'),'TJvRgbToHtml') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterProperty('RgbColor', 'TColor', iptrw);
    RegisterProperty('HtmlColor', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvRgbToHtml(CL: TPSPascalCompiler);
begin
  SIRegister_TJvRgbToHtml(CL);
 CL.AddDelphiFunction('Function RgbToHtml( Value : TColor) : string');
 CL.AddDelphiFunction('function HtmlToRgb(const Value: string): TColor;');

 end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvRgbToHtmlHtmlColor_W(Self: TJvRgbToHtml; const T: string);
begin Self.HtmlColor := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvRgbToHtmlHtmlColor_R(Self: TJvRgbToHtml; var T: string);
begin T := Self.HtmlColor; end;

(*----------------------------------------------------------------------------*)
procedure TJvRgbToHtmlRgbColor_W(Self: TJvRgbToHtml; const T: TColor);
begin Self.RgbColor := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvRgbToHtmlRgbColor_R(Self: TJvRgbToHtml; var T: TColor);
begin T := Self.RgbColor; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvRgbToHtml_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@RgbToHtml, 'RgbToHtml', cdRegister);
 S.RegisterDelphiFunction(@HtmltoRgb, 'HtmlToRgb', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvRgbToHtml(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvRgbToHtml) do begin
    RegisterConstructor(@TJvRgbToHtml.Create, 'Create');
    RegisterPropertyHelper(@TJvRgbToHtmlRgbColor_R,@TJvRgbToHtmlRgbColor_W,'RgbColor');
    RegisterPropertyHelper(@TJvRgbToHtmlHtmlColor_R,@TJvRgbToHtmlHtmlColor_W,'HtmlColor');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvRgbToHtml(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TJvRgbToHtml(CL);
end;

 
 
{ TPSImport_JvRgbToHtml }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvRgbToHtml.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvRgbToHtml(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvRgbToHtml.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvRgbToHtml(ri);
  RIRegister_JvRgbToHtml_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
