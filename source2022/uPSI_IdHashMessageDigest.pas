unit uPSI_IdHashMessageDigest;
{
This file has been generated by UnitParser v0.7, written by M. Knight
in 3.5 for a PKI  - bugfix stream-string
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
  TPSImport_IdHashMessageDigest = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdHashMessageDigest5(CL: TPSPascalCompiler);
procedure SIRegister_TIdHashMessageDigest4(CL: TPSPascalCompiler);
procedure SIRegister_TIdHashMessageDigest2(CL: TPSPascalCompiler);
procedure SIRegister_IdHashMessageDigest(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdHashMessageDigest5(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdHashMessageDigest4(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIdHashMessageDigest2(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdHashMessageDigest(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdGlobal
  //,IdHash
  ,IdHashMessageDigest_max
  //IdHashMessageDigest

  ;


function HashValuestring(const ASrc: string): LongWord; //overload;
begin
  //result:= TIdHashMessageDigest5.HashValue1(Asrc);
end;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdHashMessageDigest]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdHashMessageDigest5(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHashMessageDigest4', 'TIdHashMessageDigest5') do
  with CL.AddClassN(CL.FindClass('TIdHashMessageDigest4'),'TIdHashMessageDigest5') do begin
    RegisterMethod('Constructor Create;');
    RegisterMethod('Procedure Free;');
    RegisterMethod('Function HashValue(const ASrc: string): T4x4LongWordRecord');
    RegisterMethod('Function HashValue1(AStream : TStream): T4x4LongWordRecord');
    RegisterMethod('Function HashValueString(const ASrc: string): T4x4LongWordRecord');
    RegisterMethod('Function HashValueStream(AStream : TStream): T4x4LongWordRecord');
    RegisterMethod('Function AsHex( const AValue : T4x4LongWordRecord) : string');
    RegisterMethod('function hashStreamAsHex(s: TStream): string;');
   end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdHashMessageDigest4(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHashMessageDigest', 'TIdHashMessageDigest4') do
  with CL.AddClassN(CL.FindClass('TIdHashMessageDigest4'),'TIdHashMessageDigest4') do begin
    RegisterMethod('Constructor Create;');
    RegisterMethod('Procedure Free;');
    RegisterMethod('Function HashValue(const ASrc: string): T4x4LongWordRecord');
    RegisterMethod('Function HashValue1(AStream : TStream): T4x4LongWordRecord');
    RegisterMethod('Function AsHex( const AValue : T4x4LongWordRecord) : string');

  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdHashMessageDigest2(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdHashMessageDigest', 'TIdHashMessageDigest2') do
  with CL.AddClassN(CL.FindClass('TIdHashMessageDigest'),'TIdHashMessageDigest2') do begin
      RegisterMethod('Function HashValue(AStream : TStream) : T4x4LongWordRecord');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdHashMessageDigest(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('T4x4LongWordRecord','array[0..3] of LongWord;');
  CL.AddTypeS('T5x4LongWordRecord','array[0..4] of LongWord;');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TIdHashMessageDigest');
  SIRegister_TIdHashMessageDigest2(CL);
  SIRegister_TIdHashMessageDigest4(CL);
  SIRegister_TIdHashMessageDigest5(CL);
  //CL.AddTypeS('T4x4LongWordRecord','array [0..3] of LongWord;');
  //CL.AddTypeS('T5x4LongWordRecord','array [0..4] of LongWord;');

  end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdHashMessageDigest5(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdHashMessageDigest5) do begin
    RegisterConstructor(@TIdHashMessageDigest5.Create, 'Create');
    RegisterMethod(@TIdHashMessageDigest5.Destroy, 'Free');
    RegisterMethod(@TIdHashMessageDigest5.HashValue, 'HashValue');
    RegisterMethod(@TIdHashMessageDigest5.HashValue1, 'HashValue1');
    RegisterMethod(@TIdHashMessageDigest5.HashValue, 'HashValueString');   //alias
    RegisterMethod(@TIdHashMessageDigest5.HashValue1, 'HashValueStream');
    RegisterMethod(@TIdHashMessageDigest5.HashStreamAsHex, 'HashStreamAsHex');
    RegisterMethod(@TIdHashMessageDigest5.AsHex, 'AsHex');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdHashMessageDigest4(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdHashMessageDigest4) do begin
    RegisterConstructor(@TIdHashMessageDigest4.Create, 'Create');
    RegisterMethod(@TIdHashMessageDigest4.Destroy, 'Free');
    RegisterMethod(@TIdHashMessageDigest4.HashValue, 'HashValue');
    RegisterMethod(@TIdHashMessageDigest4.HashValue1, 'HashValue1');
    RegisterMethod(@TIdHashMessageDigest4.AsHex, 'AsHex');

  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdHashMessageDigest2(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdHashMessageDigest2) do begin
    RegisterMethod(@TIdHashMessageDigest2.HashValue, 'HashValue');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdHashMessageDigest(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdHashMessageDigest) do
  RIRegister_TIdHashMessageDigest2(CL);
  RIRegister_TIdHashMessageDigest4(CL);
  RIRegister_TIdHashMessageDigest5(CL);
end;

 
 
{ TPSImport_IdHashMessageDigest }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHashMessageDigest.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdHashMessageDigest(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdHashMessageDigest.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdHashMessageDigest(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
