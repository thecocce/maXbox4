unit uPSI_JvDBGridExport;
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
  TPSImport_JvDBGridExport = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvDBGridXMLExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvDBGridCSVExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvDBGridHTMLExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvCustomDBGridTextExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvDBGridExcelExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvDBGridWordExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvCustomDBGridOleExport(CL: TPSPascalCompiler);
procedure SIRegister_TJvCustomDBGridExport(CL: TPSPascalCompiler);
procedure SIRegister_JvDBGridExport(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_JvDBGridExport_Routines(S: TPSExec);
procedure RIRegister_TJvDBGridXMLExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvDBGridCSVExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvDBGridHTMLExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvCustomDBGridTextExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvDBGridExcelExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvDBGridWordExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvCustomDBGridOleExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvCustomDBGridExport(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvDBGridExport(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   JclUnitVersioning
  ,Windows
  ,DB
  ,DBGrids
  ,JvComponentBase
  ,JvSimpleXml
  ,JvTypes
  ,JvDBGridExport
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvDBGridExport]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBGridXMLExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridTextExport', 'TJvDBGridXMLExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridTextExport'),'TJvDBGridXMLExport') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBGridCSVExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridTextExport', 'TJvDBGridCSVExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridTextExport'),'TJvDBGridCSVExport') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterProperty('Separator', 'string', iptrw);
    RegisterProperty('Destination', 'TExportDestination', iptrw);
    RegisterProperty('ExportSeparator', 'TExportSeparator', iptrw);
    RegisterProperty('ShowColumnName', 'Boolean', iptrw);
    RegisterProperty('QuoteEveryTime', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBGridHTMLExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridTextExport', 'TJvDBGridHTMLExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridTextExport'),'TJvDBGridHTMLExport') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Function GenerateHTMLText : string');
    RegisterProperty('IncludeColumnHeader', 'Boolean', iptrw);
    RegisterProperty('Header', 'TStrings', iptrw);
    RegisterProperty('Footer', 'TStrings', iptrw);
    RegisterProperty('DocTitle', 'string', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvCustomDBGridTextExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridExport', 'TJvCustomDBGridTextExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridExport'),'TJvCustomDBGridTextExport') do
  begin
    RegisterProperty('Encoding', 'TEncoding', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBGridExcelExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridOleExport', 'TJvDBGridExcelExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridOleExport'),'TJvDBGridExcelExport') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterProperty('Close', 'TOleServerClose', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('Orientation', 'TWordOrientation', iptrw);
    RegisterProperty('AutoFit', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBGridWordExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridOleExport', 'TJvDBGridWordExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridOleExport'),'TJvDBGridWordExport') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterProperty('Close', 'TOleServerClose', iptrw);
    RegisterProperty('WordFormat', 'TJvWordGridFormat', iptrw);
    RegisterProperty('Visible', 'Boolean', iptrw);
    RegisterProperty('Orientation', 'TWordOrientation', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvCustomDBGridOleExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBGridExport', 'TJvCustomDBGridOleExport') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBGridExport'),'TJvCustomDBGridOleExport') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvCustomDBGridExport(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvComponent', 'TJvCustomDBGridExport') do
  with CL.AddClassN(CL.FindClass('TJvComponent'),'TJvCustomDBGridExport') do
  begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Function ExportGrid : Boolean');
    RegisterProperty('Caption', 'string', iptrw);
    RegisterProperty('UseFieldGetText', 'Boolean', iptrw);
    RegisterProperty('Grid', 'TDBGrid', iptrw);
    RegisterProperty('FileName', 'TFileName', iptrw);
    RegisterProperty('Silent', 'Boolean', iptrw);
    RegisterProperty('OnProgress', 'TJvExportProgressEvent', iptrw);
    RegisterProperty('OnException', 'TNotifyEvent', iptrw);
    RegisterProperty('LastExceptionMessage', 'string', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvDBGridExport(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TExportDestination', '( edFile, edClipboard )');
  CL.AddTypeS('TExportSeparator', '( esTab, esSemiColon, esComma, esSpace, esPi'
   +'pe )');
  CL.AddTypeS('TWordOrientation', '( woPortrait, woLandscape )');
  CL.AddClassN(CL.FindClass('TOBJECT'),'EJvExportDBGridException');
  CL.AddTypeS('TOleServerClose', '( scNever, scNewInstance, scAlways )');
  CL.AddTypeS('TRecordColumn', 'record Visible : Boolean; Exportable : Boolean;'
   +' ColumnName : string; Column : TColumn; Field : TField; end');
 CL.AddConstantN('wdDoNotSaveChanges','LongInt').SetInt( 0);
 CL.AddConstantN('wdTableFormatGrid1','LongWord').SetUInt( TJvWordGridFormat ( $10 ));
 CL.AddConstantN('wdTableFormatGrid2','LongWord').SetUInt( TJvWordGridFormat ( $11 ));
 CL.AddConstantN('wdTableFormatGrid3','LongWord').SetUInt( TJvWordGridFormat ( $12 ));
 CL.AddConstantN('wdTableFormatGrid4','LongWord').SetUInt( TJvWordGridFormat ( $13 ));
 CL.AddConstantN('wdTableFormatGrid5','LongWord').SetUInt( TJvWordGridFormat ( $14 ));
 CL.AddConstantN('wdTableFormatGrid6','LongWord').SetUInt( TJvWordGridFormat ( $15 ));
 CL.AddConstantN('wdTableFormatGrid7','LongWord').SetUInt( TJvWordGridFormat ( $16 ));
 CL.AddConstantN('wdTableFormatGrid8','LongWord').SetUInt( TJvWordGridFormat ( $17 ));
 CL.AddConstantN('xlPortrait','LongWord').SetUInt( $01);
 CL.AddConstantN('xlLandscape','LongWord').SetUInt( $02);
  CL.AddTypeS('TJvExportProgressEvent', 'Procedure ( Sender : TObject; Min, Max'
   +', Position : Cardinal; const AText : string; var AContinue : Boolean)');
  SIRegister_TJvCustomDBGridExport(CL);
  //CL.AddTypeS('TJvCustomDBGridExportClass', 'class of TJvCustomDBGridExport');
  SIRegister_TJvCustomDBGridOleExport(CL);
  SIRegister_TJvDBGridWordExport(CL);
  SIRegister_TJvDBGridExcelExport(CL);
  SIRegister_TJvCustomDBGridTextExport(CL);
  SIRegister_TJvDBGridHTMLExport(CL);
  SIRegister_TJvDBGridCSVExport(CL);
  SIRegister_TJvDBGridXMLExport(CL);
 CL.AddDelphiFunction('Function WordGridFormatIdentToInt( const Ident : string; var Value : Longint) : Boolean');
 CL.AddDelphiFunction('Function IntToWordGridFormatIdent( Value : Longint; var Ident : string) : Boolean');
 CL.AddDelphiFunction('Procedure GetWordGridFormatValues( Proc : TGetStrProc)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportQuoteEveryTime_W(Self: TJvDBGridCSVExport; const T: Boolean);
begin Self.QuoteEveryTime := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportQuoteEveryTime_R(Self: TJvDBGridCSVExport; var T: Boolean);
begin T := Self.QuoteEveryTime; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportShowColumnName_W(Self: TJvDBGridCSVExport; const T: Boolean);
begin Self.ShowColumnName := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportShowColumnName_R(Self: TJvDBGridCSVExport; var T: Boolean);
begin T := Self.ShowColumnName; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportExportSeparator_W(Self: TJvDBGridCSVExport; const T: TExportSeparator);
begin Self.ExportSeparator := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportExportSeparator_R(Self: TJvDBGridCSVExport; var T: TExportSeparator);
begin T := Self.ExportSeparator; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportDestination_W(Self: TJvDBGridCSVExport; const T: TExportDestination);
begin Self.Destination := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportDestination_R(Self: TJvDBGridCSVExport; var T: TExportDestination);
begin T := Self.Destination; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportSeparator_W(Self: TJvDBGridCSVExport; const T: string);
begin Self.Separator := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridCSVExportSeparator_R(Self: TJvDBGridCSVExport; var T: string);
begin T := Self.Separator; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportDocTitle_W(Self: TJvDBGridHTMLExport; const T: string);
begin Self.DocTitle := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportDocTitle_R(Self: TJvDBGridHTMLExport; var T: string);
begin T := Self.DocTitle; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportFooter_W(Self: TJvDBGridHTMLExport; const T: TStrings);
begin Self.Footer := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportFooter_R(Self: TJvDBGridHTMLExport; var T: TStrings);
begin T := Self.Footer; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportHeader_W(Self: TJvDBGridHTMLExport; const T: TStrings);
begin Self.Header := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportHeader_R(Self: TJvDBGridHTMLExport; var T: TStrings);
begin T := Self.Header; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportIncludeColumnHeader_W(Self: TJvDBGridHTMLExport; const T: Boolean);
begin Self.IncludeColumnHeader := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridHTMLExportIncludeColumnHeader_R(Self: TJvDBGridHTMLExport; var T: Boolean);
begin T := Self.IncludeColumnHeader; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridTextExportEncoding_W(Self: TJvCustomDBGridTextExport; const T: TEncoding);
begin Self.Encoding := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridTextExportEncoding_R(Self: TJvCustomDBGridTextExport; var T: TEncoding);
begin T := Self.Encoding; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportAutoFit_W(Self: TJvDBGridExcelExport; const T: Boolean);
begin Self.AutoFit := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportAutoFit_R(Self: TJvDBGridExcelExport; var T: Boolean);
begin T := Self.AutoFit; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportOrientation_W(Self: TJvDBGridExcelExport; const T: TWordOrientation);
begin Self.Orientation := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportOrientation_R(Self: TJvDBGridExcelExport; var T: TWordOrientation);
begin T := Self.Orientation; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportVisible_W(Self: TJvDBGridExcelExport; const T: Boolean);
begin Self.Visible := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportVisible_R(Self: TJvDBGridExcelExport; var T: Boolean);
begin T := Self.Visible; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportClose_W(Self: TJvDBGridExcelExport; const T: TOleServerClose);
begin Self.Close := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridExcelExportClose_R(Self: TJvDBGridExcelExport; var T: TOleServerClose);
begin T := Self.Close; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportOrientation_W(Self: TJvDBGridWordExport; const T: TWordOrientation);
begin Self.Orientation := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportOrientation_R(Self: TJvDBGridWordExport; var T: TWordOrientation);
begin T := Self.Orientation; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportVisible_W(Self: TJvDBGridWordExport; const T: Boolean);
begin Self.Visible := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportVisible_R(Self: TJvDBGridWordExport; var T: Boolean);
begin T := Self.Visible; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportWordFormat_W(Self: TJvDBGridWordExport; const T: TJvWordGridFormat);
begin Self.WordFormat := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportWordFormat_R(Self: TJvDBGridWordExport; var T: TJvWordGridFormat);
begin T := Self.WordFormat; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportClose_W(Self: TJvDBGridWordExport; const T: TOleServerClose);
begin Self.Close := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvDBGridWordExportClose_R(Self: TJvDBGridWordExport; var T: TOleServerClose);
begin T := Self.Close; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportLastExceptionMessage_R(Self: TJvCustomDBGridExport; var T: string);
begin T := Self.LastExceptionMessage; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportOnException_W(Self: TJvCustomDBGridExport; const T: TNotifyEvent);
begin Self.OnException := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportOnException_R(Self: TJvCustomDBGridExport; var T: TNotifyEvent);
begin T := Self.OnException; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportOnProgress_W(Self: TJvCustomDBGridExport; const T: TJvExportProgressEvent);
begin Self.OnProgress := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportOnProgress_R(Self: TJvCustomDBGridExport; var T: TJvExportProgressEvent);
begin T := Self.OnProgress; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportSilent_W(Self: TJvCustomDBGridExport; const T: Boolean);
begin Self.Silent := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportSilent_R(Self: TJvCustomDBGridExport; var T: Boolean);
begin T := Self.Silent; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportFileName_W(Self: TJvCustomDBGridExport; const T: TFileName);
begin Self.FileName := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportFileName_R(Self: TJvCustomDBGridExport; var T: TFileName);
begin T := Self.FileName; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportGrid_W(Self: TJvCustomDBGridExport; const T: TDBGrid);
begin Self.Grid := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportGrid_R(Self: TJvCustomDBGridExport; var T: TDBGrid);
begin T := Self.Grid; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportUseFieldGetText_W(Self: TJvCustomDBGridExport; const T: Boolean);
begin Self.UseFieldGetText := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportUseFieldGetText_R(Self: TJvCustomDBGridExport; var T: Boolean);
begin T := Self.UseFieldGetText; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportCaption_W(Self: TJvCustomDBGridExport; const T: string);
begin Self.Caption := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBGridExportCaption_R(Self: TJvCustomDBGridExport; var T: string);
begin T := Self.Caption; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvDBGridExport_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@WordGridFormatIdentToInt, 'WordGridFormatIdentToInt', cdRegister);
 S.RegisterDelphiFunction(@IntToWordGridFormatIdent, 'IntToWordGridFormatIdent', cdRegister);
 S.RegisterDelphiFunction(@GetWordGridFormatValues, 'GetWordGridFormatValues', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBGridXMLExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBGridXMLExport) do
  begin
    RegisterConstructor(@TJvDBGridXMLExport.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBGridCSVExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBGridCSVExport) do
  begin
    RegisterConstructor(@TJvDBGridCSVExport.Create, 'Create');
    RegisterPropertyHelper(@TJvDBGridCSVExportSeparator_R,@TJvDBGridCSVExportSeparator_W,'Separator');
    RegisterPropertyHelper(@TJvDBGridCSVExportDestination_R,@TJvDBGridCSVExportDestination_W,'Destination');
    RegisterPropertyHelper(@TJvDBGridCSVExportExportSeparator_R,@TJvDBGridCSVExportExportSeparator_W,'ExportSeparator');
    RegisterPropertyHelper(@TJvDBGridCSVExportShowColumnName_R,@TJvDBGridCSVExportShowColumnName_W,'ShowColumnName');
    RegisterPropertyHelper(@TJvDBGridCSVExportQuoteEveryTime_R,@TJvDBGridCSVExportQuoteEveryTime_W,'QuoteEveryTime');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBGridHTMLExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBGridHTMLExport) do
  begin
    RegisterConstructor(@TJvDBGridHTMLExport.Create, 'Create');
    RegisterMethod(@TJvDBGridHTMLExport.GenerateHTMLText, 'GenerateHTMLText');
    RegisterPropertyHelper(@TJvDBGridHTMLExportIncludeColumnHeader_R,@TJvDBGridHTMLExportIncludeColumnHeader_W,'IncludeColumnHeader');
    RegisterPropertyHelper(@TJvDBGridHTMLExportHeader_R,@TJvDBGridHTMLExportHeader_W,'Header');
    RegisterPropertyHelper(@TJvDBGridHTMLExportFooter_R,@TJvDBGridHTMLExportFooter_W,'Footer');
    RegisterPropertyHelper(@TJvDBGridHTMLExportDocTitle_R,@TJvDBGridHTMLExportDocTitle_W,'DocTitle');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvCustomDBGridTextExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvCustomDBGridTextExport) do
  begin
    RegisterPropertyHelper(@TJvCustomDBGridTextExportEncoding_R,@TJvCustomDBGridTextExportEncoding_W,'Encoding');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBGridExcelExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBGridExcelExport) do
  begin
    RegisterConstructor(@TJvDBGridExcelExport.Create, 'Create');
    RegisterPropertyHelper(@TJvDBGridExcelExportClose_R,@TJvDBGridExcelExportClose_W,'Close');
    RegisterPropertyHelper(@TJvDBGridExcelExportVisible_R,@TJvDBGridExcelExportVisible_W,'Visible');
    RegisterPropertyHelper(@TJvDBGridExcelExportOrientation_R,@TJvDBGridExcelExportOrientation_W,'Orientation');
    RegisterPropertyHelper(@TJvDBGridExcelExportAutoFit_R,@TJvDBGridExcelExportAutoFit_W,'AutoFit');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBGridWordExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBGridWordExport) do
  begin
    RegisterConstructor(@TJvDBGridWordExport.Create, 'Create');
    RegisterPropertyHelper(@TJvDBGridWordExportClose_R,@TJvDBGridWordExportClose_W,'Close');
    RegisterPropertyHelper(@TJvDBGridWordExportWordFormat_R,@TJvDBGridWordExportWordFormat_W,'WordFormat');
    RegisterPropertyHelper(@TJvDBGridWordExportVisible_R,@TJvDBGridWordExportVisible_W,'Visible');
    RegisterPropertyHelper(@TJvDBGridWordExportOrientation_R,@TJvDBGridWordExportOrientation_W,'Orientation');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvCustomDBGridOleExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvCustomDBGridOleExport) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvCustomDBGridExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvCustomDBGridExport) do
  begin
    RegisterConstructor(@TJvCustomDBGridExport.Create, 'Create');
    RegisterMethod(@TJvCustomDBGridExport.ExportGrid, 'ExportGrid');
    RegisterPropertyHelper(@TJvCustomDBGridExportCaption_R,@TJvCustomDBGridExportCaption_W,'Caption');
    RegisterPropertyHelper(@TJvCustomDBGridExportUseFieldGetText_R,@TJvCustomDBGridExportUseFieldGetText_W,'UseFieldGetText');
    RegisterPropertyHelper(@TJvCustomDBGridExportGrid_R,@TJvCustomDBGridExportGrid_W,'Grid');
    RegisterPropertyHelper(@TJvCustomDBGridExportFileName_R,@TJvCustomDBGridExportFileName_W,'FileName');
    RegisterPropertyHelper(@TJvCustomDBGridExportSilent_R,@TJvCustomDBGridExportSilent_W,'Silent');
    RegisterPropertyHelper(@TJvCustomDBGridExportOnProgress_R,@TJvCustomDBGridExportOnProgress_W,'OnProgress');
    RegisterPropertyHelper(@TJvCustomDBGridExportOnException_R,@TJvCustomDBGridExportOnException_W,'OnException');
    RegisterPropertyHelper(@TJvCustomDBGridExportLastExceptionMessage_R,nil,'LastExceptionMessage');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvDBGridExport(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EJvExportDBGridException) do
  RIRegister_TJvCustomDBGridExport(CL);
  RIRegister_TJvCustomDBGridOleExport(CL);
  RIRegister_TJvDBGridWordExport(CL);
  RIRegister_TJvDBGridExcelExport(CL);
  RIRegister_TJvCustomDBGridTextExport(CL);
  RIRegister_TJvDBGridHTMLExport(CL);
  RIRegister_TJvDBGridCSVExport(CL);
  RIRegister_TJvDBGridXMLExport(CL);
end;

 
 
{ TPSImport_JvDBGridExport }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvDBGridExport.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvDBGridExport(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvDBGridExport.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvDBGridExport(ri);
  RIRegister_JvDBGridExport_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
