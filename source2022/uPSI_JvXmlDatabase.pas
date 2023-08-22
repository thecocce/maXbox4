unit uPSI_JvXmlDatabase;
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
  TPSImport_JvXmlDatabase = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvXMLDatabase(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQuery(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQueryParser(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQueryAssignement(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQueryCondition(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQueryOrder(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQueryColumn(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLQueryTable(CL: TPSPascalCompiler);
procedure SIRegister_TJvXMLTable(CL: TPSPascalCompiler);
procedure SIRegister_JvXmlDatabase(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvXMLDatabase(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQuery(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQueryParser(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQueryAssignement(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQueryCondition(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQueryOrder(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQueryColumn(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLQueryTable(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvXMLTable(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvXmlDatabase(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
  // JclUnitVersioning
  Contnrs
  ,Math
  ,DateUtils
  ,JvTypes
  ,JvComponentBase
  ,JvSimpleXml
  //,JclSimpleXml

  ,JvXmlDatabase
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvXmlDatabase]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLDatabase(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvComponent', 'TJvXMLDatabase') do
  with CL.AddClassN(CL.FindClass('TJvComponent'),'TJvXMLDatabase') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure Free');
    RegisterMethod('Procedure SaveTables');
    RegisterMethod('Function Query( const AQuery : string) : TJvXMLQuery');
    RegisterProperty('TablesPath', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQuery(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQuery') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQuery') do begin
    RegisterMethod('Constructor Create( AOwner : TJvXMLDatabase)');
    RegisterMethod('Procedure Free');
   RegisterProperty('Results', 'TJvSimpleXMLElem', iptr);
    RegisterProperty('LastId', 'Integer', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQueryParser(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQueryParser') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQueryParser') do begin
    RegisterMethod('Constructor Create');
     RegisterMethod('Procedure Free');
     RegisterMethod('Procedure Parse( const AQuery : string)');
    RegisterMethod('Function CheckConditions( AXMLElem : TJvSimpleXMLElem) : Boolean');
    RegisterMethod('Procedure LimitTable( var ATable : TJvSimpleXMLElem)');
    RegisterMethod('Procedure OrderTable( var ATable : TJvSimpleXMLElem)');
    RegisterMethod('Procedure UpdateRow( ARow : TJvSimpleXMLElem)');
    RegisterProperty('Instruction', 'TJvXMLInstruction', iptrw);
    RegisterProperty('Tables', 'TJvXMLQueryTable Integer', iptr);
    RegisterProperty('TablesCount', 'Integer', iptr);
    RegisterProperty('Columns', 'TJvXMLQueryColumn Integer', iptr);
    RegisterProperty('ColumnsCount', 'Integer', iptr);
    RegisterProperty('Condition', 'TJvXMLQueryCondition Integer', iptr);
    RegisterProperty('ConditionsCount', 'Integer', iptr);
    RegisterProperty('Value', 'string Integer', iptr);
    RegisterProperty('ValuesCount', 'Integer', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQueryAssignement(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQueryAssignement') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQueryAssignement') do begin
    RegisterProperty('Column', 'string', iptrw);
    RegisterProperty('ValueKind', 'TJvXMLSetKind', iptrw);
    RegisterProperty('SecondKind', 'TJvXMLSetKind', iptrw);
    RegisterProperty('SetOperator', 'TJvXMLSetOperator', iptrw);
    RegisterProperty('Value', 'string', iptrw);
    RegisterProperty('SecondValue', 'string', iptrw);
    RegisterMethod('Constructor Create( AValue : string)');
    RegisterMethod('Procedure UpdateElem( AElement : TJvSimpleXMLElem)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQueryCondition(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQueryCondition') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQueryCondition') do begin
    RegisterProperty('Condition', 'string', iptrw);
    RegisterProperty('SQLOperator', 'TJvXMLSQLOperator', iptrw);
    RegisterMethod('Constructor Create( AOperator : TJvXMLSQLOperator; const ACondition : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQueryOrder(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQueryOrder') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQueryOrder') do
  begin
    RegisterProperty('Column', 'string', iptrw);
    RegisterProperty('Ascending', 'Boolean', iptrw);
    RegisterProperty('Convertion', 'TJvXMLOrderConvertion', iptrw);
    RegisterMethod('Constructor Create( const AValue : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQueryColumn(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQueryColumn') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQueryColumn') do
  begin
    RegisterProperty('Name', 'string', iptrw);
    RegisterProperty('Table', 'string', iptrw);
    RegisterMethod('Constructor Create( const AValue : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLQueryTable(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLQueryTable') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLQueryTable') do
  begin
    RegisterProperty('Name', 'string', iptrw);
    RegisterProperty('Alias', 'string', iptrw);
    RegisterMethod('Constructor Create( const AValue : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvXMLTable(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TObject', 'TJvXMLTable') do
  with CL.AddClassN(CL.FindClass('TObject'),'TJvXMLTable') do
  begin
    RegisterProperty('XML', 'TJvSimpleXML', iptrw);
    RegisterProperty('Locked', 'Boolean', iptrw);
    RegisterProperty('FileName', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvXmlDatabase(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvXMLDatabase');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvXMLQuery');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvXMLQueryParser');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvXMLDatabaseException');
  SIRegister_TJvXMLTable(CL);
  SIRegister_TJvXMLQueryTable(CL);
  SIRegister_TJvXMLQueryColumn(CL);
  CL.AddTypeS('TJvXMLOrderConvertion', '( ocNone, ocDate, ocInteger, ocFloat )');
  SIRegister_TJvXMLQueryOrder(CL);
  CL.AddTypeS('TJvXMLSQLOperator', '( opEquals, opGreater, opSmaller, opGreater'
   +'Equals, opSmallerEquals, opLike, opNot, opOr, opAnd, opXor, opLeftParenthe'
   +'sis, opRightParenthesis, opConstant, opColumn, opNull, opNone )');
  SIRegister_TJvXMLQueryCondition(CL);
  CL.AddTypeS('TJvXMLSetKind', '( skConstant, skColumn )');
  CL.AddTypeS('TJvXMLSetOperator', '( soNone, soAdd, soMultiply, soDivide, soSubstract )');
  SIRegister_TJvXMLQueryAssignement(CL);
  CL.AddTypeS('TJvXMLInstruction', '( xiSelect, xiUpdate, xiInsert, xiDelete )');
  SIRegister_TJvXMLQueryParser(CL);
  SIRegister_TJvXMLQuery(CL);
  SIRegister_TJvXMLDatabase(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvXMLDatabaseTablesPath_W(Self: TJvXMLDatabase; const T: string);
begin Self.TablesPath := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLDatabaseTablesPath_R(Self: TJvXMLDatabase; var T: string);
begin T := Self.TablesPath; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryLastId_R(Self: TJvXMLQuery; var T: Integer);
begin T := Self.LastId; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryResults_R(Self: TJvXMLQuery; var T: TJvSimpleXMLElem);
begin T := Self.Results; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserValuesCount_R(Self: TJvXMLQueryParser; var T: Integer);
begin T := Self.ValuesCount; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserValue_R(Self: TJvXMLQueryParser; var T: string; const t1: Integer);
begin T := Self.Value[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserConditionsCount_R(Self: TJvXMLQueryParser; var T: Integer);
begin T := Self.ConditionsCount; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserCondition_R(Self: TJvXMLQueryParser; var T: TJvXMLQueryCondition; const t1: Integer);
begin T := Self.Condition[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserColumnsCount_R(Self: TJvXMLQueryParser; var T: Integer);
begin T := Self.ColumnsCount; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserColumns_R(Self: TJvXMLQueryParser; var T: TJvXMLQueryColumn; const t1: Integer);
begin T := Self.Columns[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserTablesCount_R(Self: TJvXMLQueryParser; var T: Integer);
begin T := Self.TablesCount; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserTables_R(Self: TJvXMLQueryParser; var T: TJvXMLQueryTable; const t1: Integer);
begin T := Self.Tables[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserInstruction_W(Self: TJvXMLQueryParser; const T: TJvXMLInstruction);
begin Self.Instruction := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryParserInstruction_R(Self: TJvXMLQueryParser; var T: TJvXMLInstruction);
begin T := Self.Instruction; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementSecondValue_W(Self: TJvXMLQueryAssignement; const T: string);
Begin Self.SecondValue := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementSecondValue_R(Self: TJvXMLQueryAssignement; var T: string);
Begin T := Self.SecondValue; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementValue_W(Self: TJvXMLQueryAssignement; const T: string);
Begin Self.Value := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementValue_R(Self: TJvXMLQueryAssignement; var T: string);
Begin T := Self.Value; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementSetOperator_W(Self: TJvXMLQueryAssignement; const T: TJvXMLSetOperator);
Begin Self.SetOperator := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementSetOperator_R(Self: TJvXMLQueryAssignement; var T: TJvXMLSetOperator);
Begin T := Self.SetOperator; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementSecondKind_W(Self: TJvXMLQueryAssignement; const T: TJvXMLSetKind);
Begin Self.SecondKind := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementSecondKind_R(Self: TJvXMLQueryAssignement; var T: TJvXMLSetKind);
Begin T := Self.SecondKind; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementValueKind_W(Self: TJvXMLQueryAssignement; const T: TJvXMLSetKind);
Begin Self.ValueKind := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementValueKind_R(Self: TJvXMLQueryAssignement; var T: TJvXMLSetKind);
Begin T := Self.ValueKind; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementColumn_W(Self: TJvXMLQueryAssignement; const T: string);
Begin Self.Column := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryAssignementColumn_R(Self: TJvXMLQueryAssignement; var T: string);
Begin T := Self.Column; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryConditionSQLOperator_W(Self: TJvXMLQueryCondition; const T: TJvXMLSQLOperator);
Begin Self.SQLOperator := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryConditionSQLOperator_R(Self: TJvXMLQueryCondition; var T: TJvXMLSQLOperator);
Begin T := Self.SQLOperator; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryConditionCondition_W(Self: TJvXMLQueryCondition; const T: string);
Begin Self.Condition := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryConditionCondition_R(Self: TJvXMLQueryCondition; var T: string);
Begin T := Self.Condition; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryOrderConvertion_W(Self: TJvXMLQueryOrder; const T: TJvXMLOrderConvertion);
Begin Self.Convertion := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryOrderConvertion_R(Self: TJvXMLQueryOrder; var T: TJvXMLOrderConvertion);
Begin T := Self.Convertion; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryOrderAscending_W(Self: TJvXMLQueryOrder; const T: Boolean);
Begin Self.Ascending := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryOrderAscending_R(Self: TJvXMLQueryOrder; var T: Boolean);
Begin T := Self.Ascending; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryOrderColumn_W(Self: TJvXMLQueryOrder; const T: string);
Begin Self.Column := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryOrderColumn_R(Self: TJvXMLQueryOrder; var T: string);
Begin T := Self.Column; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryColumnTable_W(Self: TJvXMLQueryColumn; const T: string);
Begin Self.Table := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryColumnTable_R(Self: TJvXMLQueryColumn; var T: string);
Begin T := Self.Table; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryColumnName_W(Self: TJvXMLQueryColumn; const T: string);
Begin Self.Name := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryColumnName_R(Self: TJvXMLQueryColumn; var T: string);
Begin T := Self.Name; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryTableAlias_W(Self: TJvXMLQueryTable; const T: string);
Begin Self.Alias := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryTableAlias_R(Self: TJvXMLQueryTable; var T: string);
Begin T := Self.Alias; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryTableName_W(Self: TJvXMLQueryTable; const T: string);
Begin Self.Name := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLQueryTableName_R(Self: TJvXMLQueryTable; var T: string);
Begin T := Self.Name; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLTableFileName_W(Self: TJvXMLTable; const T: string);
Begin Self.FileName := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLTableFileName_R(Self: TJvXMLTable; var T: string);
Begin T := Self.FileName; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLTableLocked_W(Self: TJvXMLTable; const T: Boolean);
Begin Self.Locked := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLTableLocked_R(Self: TJvXMLTable; var T: Boolean);
Begin T := Self.Locked; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLTableXML_W(Self: TJvXMLTable; const T: TJvSimpleXML);
Begin Self.XML := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvXMLTableXML_R(Self: TJvXMLTable; var T: TJvSimpleXML);
Begin T := Self.XML; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLDatabase(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLDatabase) do begin
    RegisterConstructor(@TJvXMLDatabase.Create, 'Create');
    RegisterMethod(@TJvXMLDatabase.Destroy, 'Free');
    RegisterMethod(@TJvXMLDatabase.SaveTables, 'SaveTables');
    RegisterMethod(@TJvXMLDatabase.Query, 'Query');
    RegisterPropertyHelper(@TJvXMLDatabaseTablesPath_R,@TJvXMLDatabaseTablesPath_W,'TablesPath');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQuery(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQuery) do begin
    RegisterConstructor(@TJvXMLQuery.Create, 'Create');
    RegisterMethod(@TJvXMLQuery.Destroy, 'Free');
    RegisterPropertyHelper(@TJvXMLQueryResults_R,nil,'Results');
    RegisterPropertyHelper(@TJvXMLQueryLastId_R,nil,'LastId');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQueryParser(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQueryParser) do begin
    RegisterConstructor(@TJvXMLQueryParser.Create, 'Create');
    RegisterMethod(@TJvXMLQueryParser.Destroy, 'Free');
    RegisterMethod(@TJvXMLQueryParser.Parse, 'Parse');
    RegisterMethod(@TJvXMLQueryParser.CheckConditions, 'CheckConditions');
    RegisterMethod(@TJvXMLQueryParser.LimitTable, 'LimitTable');
    RegisterMethod(@TJvXMLQueryParser.OrderTable, 'OrderTable');
    RegisterMethod(@TJvXMLQueryParser.UpdateRow, 'UpdateRow');
    RegisterPropertyHelper(@TJvXMLQueryParserInstruction_R,@TJvXMLQueryParserInstruction_W,'Instruction');
    RegisterPropertyHelper(@TJvXMLQueryParserTables_R,nil,'Tables');
    RegisterPropertyHelper(@TJvXMLQueryParserTablesCount_R,nil,'TablesCount');
    RegisterPropertyHelper(@TJvXMLQueryParserColumns_R,nil,'Columns');
    RegisterPropertyHelper(@TJvXMLQueryParserColumnsCount_R,nil,'ColumnsCount');
    RegisterPropertyHelper(@TJvXMLQueryParserCondition_R,nil,'Condition');
    RegisterPropertyHelper(@TJvXMLQueryParserConditionsCount_R,nil,'ConditionsCount');
    RegisterPropertyHelper(@TJvXMLQueryParserValue_R,nil,'Value');
    RegisterPropertyHelper(@TJvXMLQueryParserValuesCount_R,nil,'ValuesCount');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQueryAssignement(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQueryAssignement) do
  begin
    RegisterPropertyHelper(@TJvXMLQueryAssignementColumn_R,@TJvXMLQueryAssignementColumn_W,'Column');
    RegisterPropertyHelper(@TJvXMLQueryAssignementValueKind_R,@TJvXMLQueryAssignementValueKind_W,'ValueKind');
    RegisterPropertyHelper(@TJvXMLQueryAssignementSecondKind_R,@TJvXMLQueryAssignementSecondKind_W,'SecondKind');
    RegisterPropertyHelper(@TJvXMLQueryAssignementSetOperator_R,@TJvXMLQueryAssignementSetOperator_W,'SetOperator');
    RegisterPropertyHelper(@TJvXMLQueryAssignementValue_R,@TJvXMLQueryAssignementValue_W,'Value');
    RegisterPropertyHelper(@TJvXMLQueryAssignementSecondValue_R,@TJvXMLQueryAssignementSecondValue_W,'SecondValue');
    RegisterConstructor(@TJvXMLQueryAssignement.Create, 'Create');
    RegisterMethod(@TJvXMLQueryAssignement.UpdateElem, 'UpdateElem');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQueryCondition(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQueryCondition) do
  begin
    RegisterPropertyHelper(@TJvXMLQueryConditionCondition_R,@TJvXMLQueryConditionCondition_W,'Condition');
    RegisterPropertyHelper(@TJvXMLQueryConditionSQLOperator_R,@TJvXMLQueryConditionSQLOperator_W,'SQLOperator');
    RegisterConstructor(@TJvXMLQueryCondition.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQueryOrder(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQueryOrder) do
  begin
    RegisterPropertyHelper(@TJvXMLQueryOrderColumn_R,@TJvXMLQueryOrderColumn_W,'Column');
    RegisterPropertyHelper(@TJvXMLQueryOrderAscending_R,@TJvXMLQueryOrderAscending_W,'Ascending');
    RegisterPropertyHelper(@TJvXMLQueryOrderConvertion_R,@TJvXMLQueryOrderConvertion_W,'Convertion');
    RegisterConstructor(@TJvXMLQueryOrder.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQueryColumn(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQueryColumn) do
  begin
    RegisterPropertyHelper(@TJvXMLQueryColumnName_R,@TJvXMLQueryColumnName_W,'Name');
    RegisterPropertyHelper(@TJvXMLQueryColumnTable_R,@TJvXMLQueryColumnTable_W,'Table');
    RegisterConstructor(@TJvXMLQueryColumn.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLQueryTable(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLQueryTable) do
  begin
    RegisterPropertyHelper(@TJvXMLQueryTableName_R,@TJvXMLQueryTableName_W,'Name');
    RegisterPropertyHelper(@TJvXMLQueryTableAlias_R,@TJvXMLQueryTableAlias_W,'Alias');
    RegisterConstructor(@TJvXMLQueryTable.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvXMLTable(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLTable) do
  begin
    RegisterPropertyHelper(@TJvXMLTableXML_R,@TJvXMLTableXML_W,'XML');
    RegisterPropertyHelper(@TJvXMLTableLocked_R,@TJvXMLTableLocked_W,'Locked');
    RegisterPropertyHelper(@TJvXMLTableFileName_R,@TJvXMLTableFileName_W,'FileName');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvXmlDatabase(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvXMLDatabase) do
  with CL.Add(TJvXMLQuery) do
  with CL.Add(TJvXMLQueryParser) do
  with CL.Add(TJvXMLDatabaseException) do
  RIRegister_TJvXMLTable(CL);
  RIRegister_TJvXMLQueryTable(CL);
  RIRegister_TJvXMLQueryColumn(CL);
  RIRegister_TJvXMLQueryOrder(CL);
  RIRegister_TJvXMLQueryCondition(CL);
  RIRegister_TJvXMLQueryAssignement(CL);
  RIRegister_TJvXMLQueryParser(CL);
  RIRegister_TJvXMLQuery(CL);
  RIRegister_TJvXMLDatabase(CL);
end;

 
 
{ TPSImport_JvXmlDatabase }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvXmlDatabase.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvXmlDatabase(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvXmlDatabase.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvXmlDatabase(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
