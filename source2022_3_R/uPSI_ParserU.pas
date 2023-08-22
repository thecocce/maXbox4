unit uPSI_ParserU;
{
  the very last
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
  TPSImport_ParserU = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TUnitParser(CL: TPSPascalCompiler);
procedure SIRegister_TProcList(CL: TPSPascalCompiler);
procedure SIRegister_ParserU(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TUnitParser(CL: TPSRuntimeClassImporter);
procedure RIRegister_TProcList(CL: TPSRuntimeClassImporter);
procedure RIRegister_ParserU(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   uPSUtils
  ,StrUtils
  ,ParserUtils
  ,BigIni
  ,ParserU
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_ParserU]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TUnitParser(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TUnitParser') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TUnitParser') do begin
    RegisterMethod('Constructor Create( const IniFilename : string; aTokenHistoryLength : Integer)');
       RegisterMethod('Procedure Free');
      RegisterProperty('Unitname', 'string', iptrw);
    RegisterProperty('OutputRT', 'string', iptrw);
    RegisterProperty('OutputDT', 'string', iptrw);
    RegisterProperty('WriteDefines', 'boolean', iptrw);
    RegisterProperty('UseUnitAtDT', 'boolean', iptrw);
    RegisterMethod('Procedure ParseUnit( const Input : string)');
    RegisterMethod('Procedure ParserError( Parser : TObject; Kind : TPSParserErrorKind)');
    RegisterMethod('Function UnitNameRT : string');
    RegisterMethod('Function UnitNameCT : string');
    RegisterMethod('Function UnitNameCmp : string');
    RegisterMethod('Procedure SaveToPath( const Path : string)');
    RegisterProperty('Writeln', 'TWriteln', iptrw);
    RegisterProperty('Readln', 'TReadln', iptrw);
    RegisterProperty('SingleUnit', 'Boolean', iptrw);
    RegisterProperty('UnitPrefix', 'string', iptrw);
    RegisterProperty('CompPage', 'String', iptrw);
    RegisterProperty('CompPrefix', 'String', iptrw);
    RegisterProperty('AfterInterfaceDeclaration', 'string', iptrw);
    RegisterProperty('AutoRenameOverloadedMethods', 'Boolean', iptrw);
    RegisterProperty('OutUnitList', 'TStringList', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TProcList(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStringList', 'TProcList') do
  with CL.AddClassN(CL.FindClass('TStringList'),'TProcList') do
  begin
    RegisterProperty('ProcAttr', 'TProcAttr', iptrw);
    RegisterProperty('Name', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_ParserU(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TProcAttrs', '(PublicProc, IsDone, IsHelper )');
  CL.AddTypeS('TProcAttr', 'set of TProcAttrs');
  SIRegister_TProcList(CL);
  CL.AddTypeS('TWriteln', 'Procedure ( const S : string)');
  CL.AddTypeS('TReadln', 'Procedure ( var S : string; const Promote, Caption : string)');
  CL.AddTypeS('TPasToken', 'record ID : TPSPasToken; Data : string; Org : String; row : integer; col : integer; end');
  //CL.AddTypeS('TProcDeclOptions', 'set of ( IsMethod, IsPointer )');
  //CL.AddTypeS('TProcDeclInfo', 'set of (IsVirtual, IsAbstract, IsConstructor, IsDestructor, IsFunction, IsCallHelper )');
  CL.AddTypeS('TTimeMode', '(CompileTime, RunTime )');
  SIRegister_TUnitParser(CL);
 CL.AddConstantN('MaxSearchCount','LongInt').SetInt( 100);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TUnitParserOutUnitList_R(Self: TUnitParser; var T: TStringList);
begin T := Self.OutUnitList; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserAutoRenameOverloadedMethods_W(Self: TUnitParser; const T: Boolean);
begin Self.AutoRenameOverloadedMethods := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserAutoRenameOverloadedMethods_R(Self: TUnitParser; var T: Boolean);
begin T := Self.AutoRenameOverloadedMethods; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserAfterInterfaceDeclaration_W(Self: TUnitParser; const T: string);
begin Self.AfterInterfaceDeclaration := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserAfterInterfaceDeclaration_R(Self: TUnitParser; var T: string);
begin T := Self.AfterInterfaceDeclaration; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserCompPrefix_W(Self: TUnitParser; const T: String);
begin Self.CompPrefix := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserCompPrefix_R(Self: TUnitParser; var T: String);
begin T := Self.CompPrefix; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserCompPage_W(Self: TUnitParser; const T: String);
begin Self.CompPage := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserCompPage_R(Self: TUnitParser; var T: String);
begin T := Self.CompPage; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserUnitPrefix_W(Self: TUnitParser; const T: string);
begin Self.UnitPrefix := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserUnitPrefix_R(Self: TUnitParser; var T: string);
begin T := Self.UnitPrefix; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserSingleUnit_W(Self: TUnitParser; const T: Boolean);
begin Self.SingleUnit := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserSingleUnit_R(Self: TUnitParser; var T: Boolean);
begin T := Self.SingleUnit; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserReadln_W(Self: TUnitParser; const T: TReadln);
begin Self.Readln := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserReadln_R(Self: TUnitParser; var T: TReadln);
begin T := Self.Readln; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserWriteln_W(Self: TUnitParser; const T: TWriteln);
begin Self.Writeln := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserWriteln_R(Self: TUnitParser; var T: TWriteln);
begin T := Self.Writeln; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserUseUnitAtDT_W(Self: TUnitParser; const T: boolean);
Begin Self.UseUnitAtDT := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserUseUnitAtDT_R(Self: TUnitParser; var T: boolean);
Begin T := Self.UseUnitAtDT; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserWriteDefines_W(Self: TUnitParser; const T: boolean);
Begin Self.WriteDefines := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserWriteDefines_R(Self: TUnitParser; var T: boolean);
Begin T := Self.WriteDefines; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserOutputDT_W(Self: TUnitParser; const T: string);
Begin Self.OutputDT := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserOutputDT_R(Self: TUnitParser; var T: string);
Begin T := Self.OutputDT; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserOutputRT_W(Self: TUnitParser; const T: string);
Begin Self.OutputRT := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserOutputRT_R(Self: TUnitParser; var T: string);
Begin T := Self.OutputRT; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserUnitname_W(Self: TUnitParser; const T: string);
Begin Self.Unitname := T; end;

(*----------------------------------------------------------------------------*)
procedure TUnitParserUnitname_R(Self: TUnitParser; var T: string);
Begin T := Self.Unitname; end;

(*----------------------------------------------------------------------------*)
procedure TProcListName_W(Self: TProcList; const T: string);
Begin Self.Name := T; end;

(*----------------------------------------------------------------------------*)
procedure TProcListName_R(Self: TProcList; var T: string);
Begin T := Self.Name; end;

(*----------------------------------------------------------------------------*)
procedure TProcListProcAttr_W(Self: TProcList; const T: TProcAttr);
Begin Self.ProcAttr := T; end;

(*----------------------------------------------------------------------------*)
procedure TProcListProcAttr_R(Self: TProcList; var T: TProcAttr);
Begin T := Self.ProcAttr; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TUnitParser(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TUnitParser) do begin
    RegisterConstructor(@TUnitParser.Create, 'Create');
      RegisterMethod(@TUnitParser.Destroy, 'Free');
      RegisterPropertyHelper(@TUnitParserUnitname_R,@TUnitParserUnitname_W,'Unitname');
    RegisterPropertyHelper(@TUnitParserOutputRT_R,@TUnitParserOutputRT_W,'OutputRT');
    RegisterPropertyHelper(@TUnitParserOutputDT_R,@TUnitParserOutputDT_W,'OutputDT');
    RegisterPropertyHelper(@TUnitParserWriteDefines_R,@TUnitParserWriteDefines_W,'WriteDefines');
    RegisterPropertyHelper(@TUnitParserUseUnitAtDT_R,@TUnitParserUseUnitAtDT_W,'UseUnitAtDT');
    RegisterMethod(@TUnitParser.ParseUnit, 'ParseUnit');
    RegisterMethod(@TUnitParser.ParserError, 'ParserError');
    RegisterMethod(@TUnitParser.UnitNameRT, 'UnitNameRT');
    RegisterMethod(@TUnitParser.UnitNameCT, 'UnitNameCT');
    RegisterMethod(@TUnitParser.UnitNameCmp, 'UnitNameCmp');
    RegisterMethod(@TUnitParser.SaveToPath, 'SaveToPath');
    RegisterPropertyHelper(@TUnitParserWriteln_R,@TUnitParserWriteln_W,'Writeln');
    RegisterPropertyHelper(@TUnitParserReadln_R,@TUnitParserReadln_W,'Readln');
    RegisterPropertyHelper(@TUnitParserSingleUnit_R,@TUnitParserSingleUnit_W,'SingleUnit');
    RegisterPropertyHelper(@TUnitParserUnitPrefix_R,@TUnitParserUnitPrefix_W,'UnitPrefix');
    RegisterPropertyHelper(@TUnitParserCompPage_R,@TUnitParserCompPage_W,'CompPage');
    RegisterPropertyHelper(@TUnitParserCompPrefix_R,@TUnitParserCompPrefix_W,'CompPrefix');
    RegisterPropertyHelper(@TUnitParserAfterInterfaceDeclaration_R,@TUnitParserAfterInterfaceDeclaration_W,'AfterInterfaceDeclaration');
    RegisterPropertyHelper(@TUnitParserAutoRenameOverloadedMethods_R,@TUnitParserAutoRenameOverloadedMethods_W,'AutoRenameOverloadedMethods');
    RegisterPropertyHelper(@TUnitParserOutUnitList_R,nil,'OutUnitList');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TProcList(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TProcList) do
  begin
    RegisterPropertyHelper(@TProcListProcAttr_R,@TProcListProcAttr_W,'ProcAttr');
    RegisterPropertyHelper(@TProcListName_R,@TProcListName_W,'Name');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_ParserU(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TProcList(CL);
  RIRegister_TUnitParser(CL);
end;

 
 
{ TPSImport_ParserU }
(*----------------------------------------------------------------------------*)
procedure TPSImport_ParserU.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_ParserU(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_ParserU.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_ParserU(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
