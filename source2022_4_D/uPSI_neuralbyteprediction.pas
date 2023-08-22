unit uPSI_neuralbyteprediction;
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
  TPSImport_neuralbyteprediction = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TEasyLearnAndPredictClass(CL: TPSPascalCompiler);
procedure SIRegister_TClassifier(CL: TPSPascalCompiler);
procedure SIRegister_TLabeledState(CL: TPSPascalCompiler);
procedure SIRegister_TStatePredictionClass(CL: TPSPascalCompiler);
procedure SIRegister_TNeuronGroup(CL: TPSPascalCompiler);
procedure SIRegister_TNeuronGroupBase(CL: TPSPascalCompiler);
procedure SIRegister_neuralbyteprediction(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TEasyLearnAndPredictClass(CL: TPSRuntimeClassImporter);
procedure RIRegister_TClassifier(CL: TPSRuntimeClassImporter);
procedure RIRegister_TLabeledState(CL: TPSRuntimeClassImporter);
procedure RIRegister_TStatePredictionClass(CL: TPSRuntimeClassImporter);
procedure RIRegister_TNeuronGroup(CL: TPSRuntimeClassImporter);
procedure RIRegister_TNeuronGroupBase(CL: TPSRuntimeClassImporter);
procedure RIRegister_neuralbyteprediction(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   neuralabfun
  ,neuralcache
  ,neuralbyteprediction
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_neuralbyteprediction]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TEasyLearnAndPredictClass(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TEasyLearnAndPredictClass') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TEasyLearnAndPredictClass') do
  begin
    RegisterProperty('BytePred', 'TClassifier', iptrw);
    RegisterProperty('FCache', 'TCacheMem', iptrw);
    RegisterMethod('Procedure Initiate( pActionByteLen, pStateByteLen : word; pIncludeZeros : boolean; NumNeuronGroups : integer; pNumberOfSearches : integer; pUseCache : boolean)');
    RegisterMethod('Procedure Predict( var pActions, pCurrentState : array of byte; var pPredictedState : array of byte)');
    RegisterMethod('Function newStateFound( stateFound : array of byte) : extended');
    RegisterMethod('Procedure UpdatePredictionStats( stateFound : array of byte)');
    RegisterMethod('Procedure printRelationTable');
    RegisterMethod('Function GetF( posPredictedState : longint) : single');
    RegisterMethod('Function GetD( posPredictedState : longint) : single');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TClassifier(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TStatePredictionClass', 'TClassifier') do
  with CL.AddClassN(CL.FindClass('TStatePredictionClass'),'TClassifier') do
  begin
    RegisterMethod('Procedure AddClassifier( NumClasses, NumStates : integer)');
    RegisterMethod('Function AddState( pLabel : integer; pState : array of byte) : integer');
    RegisterMethod('Function EvolveNeuronGroup( var NG : TNeuronGroup) : integer');
    RegisterMethod('Function EvolveNeuronGroupAtPos( neuronpos : integer) : integer');
    RegisterMethod('Function NeuronGroupFitness( var NG : TNeuronGroup) : single');
    RegisterMethod('Function MutateNeuronGroup( NG : TNeuronGroup) : TNeuronGroup');
    RegisterMethod('Procedure CreateRandomNeuronGroup( neuronpos, pClass : integer)');
    RegisterMethod('Function PredictClass( PActions : array of byte) : byte');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TLabeledState(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TLabeledState') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TLabeledState') do
  begin
    RegisterProperty('FLabel', 'byte', iptrw);
    RegisterProperty('FTester', 'TRunOperation', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TStatePredictionClass(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TStatePredictionClass') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TStatePredictionClass') do
  begin
    RegisterMethod('Procedure Init( pZerosIncluded : boolean; operationLayerSize : longint; pNumberOfSearches : longint)');
    RegisterMethod('Function NeuronsToString( evaluation : integer) : string');
    RegisterMethod('Procedure CleanAndLoadNeuronsFromString( var str : string)');
    RegisterMethod('Procedure DefragAndAddNeuronsFromString( var str : string)');
    RegisterMethod('Procedure ClearAll');
    RegisterMethod('Procedure RemoveNeuronsAtPos( neuronPos : longint)');
    RegisterMethod('Procedure RemoveAllNeurons');
    RegisterMethod('Procedure UpdatePredictionStats( var PActions : array of byte; var pCurrentStates, pFoundStates : array of byte)');
    RegisterMethod('Procedure CreateNewNeuronsOnError( PActions, pred, PCurrentStates, PNextStates : array of byte)');
    RegisterMethod('Procedure Prediction( PActions, PCurrentStates : array of byte; var PNextStates : array of byte; var pRelationProbability : array of single; var pVictoryIndex : array of longint)');
    RegisterMethod('Procedure PredictionProbability( PActions, PCurrentStates : array of byte; var PNextStates : array of byte; var pRelationProbability : array of single; var pVictoryIndex : array of longint)');
    RegisterMethod('Procedure DefineLens( pActionByteLen, pStateByteLen : word)');
    RegisterMethod('Procedure ClearNeuronVictories');
    RegisterMethod('Procedure UpdateNeuronVictories( var pFoundStates, pPredictedStates : array of byte; var pVictoryIndex : array of longint)');
    RegisterMethod('Procedure Dump');
    RegisterMethod('Function GetF( neuronPos : longint) : single');
    RegisterMethod('Function GetD( neuronPos : longint) : single');
    RegisterMethod('Function NeuronToHumanReadableString( pos : longint) : string');
    RegisterMethod('Function NeuronToUniqueString( pos : longint) : string');
    RegisterMethod('Function getVictoriousNeuronsCnt( ) : integer');
    RegisterMethod('Procedure deleteRarelyUsedNeuros( minPredictions : integer)');
    RegisterMethod('Procedure deleteNeverWinningNeurons( minVictories : integer)');
    RegisterMethod('Procedure deleteDuplicateNeurons( )');
    RegisterMethod('Function Defrag( ) : integer');
    RegisterProperty('FGeneralize', 'boolean', iptrw);
    RegisterProperty('FUseBelief', 'boolean', iptrw);
    RegisterProperty('FCS', 'TCreateOperationSettings', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TNeuronGroup(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TNeuronGroupBase', 'TNeuronGroup') do
  with CL.AddClassN(CL.FindClass('TNeuronGroupBase'),'TNeuronGroup') do
  begin
    RegisterProperty('TestNeuronLayer', 'TTestsClass', iptrw);
    RegisterProperty('OperationNeuronLayer', 'TOperation', iptrw);
    RegisterMethod('Procedure Clear');
    RegisterMethod('Function GetUniqueString : string');
    RegisterMethod('Function GetHumanReadableString : string');
    RegisterMethod('Function ToString( ) : string');
    RegisterMethod('Function Filled( ) : boolean');
    RegisterMethod('Procedure LoadFromString( str : string)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TNeuronGroupBase(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TOBJECT', 'TNeuronGroupBase') do
  with CL.AddClassN(CL.FindClass('TOBJECT'),'TNeuronGroupBase') do
  begin
    RegisterProperty('PredictionPos', 'integer', iptrw);
    RegisterProperty('Vitories', 'integer', iptrw);
    RegisterProperty('LastVictory', 'integer', iptrw);
    RegisterProperty('WrongNeuronPredictionCnt', 'integer', iptrw);
    RegisterProperty('CorrectNeuronPredictionCnt', 'integer', iptrw);
    RegisterProperty('WrongPredictionAtWin', 'integer', iptrw);
    RegisterProperty('CorrectPredictionAtWin', 'integer', iptrw);
    RegisterMethod('Function GetF : single');
    RegisterMethod('Function GetD : single');
    RegisterMethod('Function ToString( ) : string');
    RegisterMethod('Procedure Clear');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_neuralbyteprediction(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TNeuralCountings', 'array of longint');
  SIRegister_TNeuronGroupBase(CL);
  SIRegister_TNeuronGroup(CL);
  CL.AddTypeS('TNeuralNetwork', 'array of TNeuronGroup');
  SIRegister_TStatePredictionClass(CL);
  SIRegister_TLabeledState(CL);
  SIRegister_TClassifier(CL);
  SIRegister_TEasyLearnAndPredictClass(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TEasyLearnAndPredictClassFCache_W(Self: TEasyLearnAndPredictClass; const T: TCacheMem);
Begin Self.FCache := T; end;

(*----------------------------------------------------------------------------*)
procedure TEasyLearnAndPredictClassFCache_R(Self: TEasyLearnAndPredictClass; var T: TCacheMem);
Begin T := Self.FCache; end;

(*----------------------------------------------------------------------------*)
procedure TEasyLearnAndPredictClassBytePred_W(Self: TEasyLearnAndPredictClass; const T: TClassifier);
Begin Self.BytePred := T; end;

(*----------------------------------------------------------------------------*)
procedure TEasyLearnAndPredictClassBytePred_R(Self: TEasyLearnAndPredictClass; var T: TClassifier);
Begin T := Self.BytePred; end;

(*----------------------------------------------------------------------------*)
procedure TLabeledStateFTester_W(Self: TLabeledState; const T: TRunOperation);
Begin Self.FTester := T; end;

(*----------------------------------------------------------------------------*)
procedure TLabeledStateFTester_R(Self: TLabeledState; var T: TRunOperation);
Begin T := Self.FTester; end;

(*----------------------------------------------------------------------------*)
procedure TLabeledStateFLabel_W(Self: TLabeledState; const T: byte);
Begin Self.FLabel := T; end;

(*----------------------------------------------------------------------------*)
procedure TLabeledStateFLabel_R(Self: TLabeledState; var T: byte);
Begin T := Self.FLabel; end;

(*----------------------------------------------------------------------------*)
procedure TStatePredictionClassFCS_W(Self: TStatePredictionClass; const T: TCreateOperationSettings);
Begin Self.FCS := T; end;

(*----------------------------------------------------------------------------*)
procedure TStatePredictionClassFCS_R(Self: TStatePredictionClass; var T: TCreateOperationSettings);
Begin T := Self.FCS; end;

(*----------------------------------------------------------------------------*)
procedure TStatePredictionClassFUseBelief_W(Self: TStatePredictionClass; const T: boolean);
Begin Self.FUseBelief := T; end;

(*----------------------------------------------------------------------------*)
procedure TStatePredictionClassFUseBelief_R(Self: TStatePredictionClass; var T: boolean);
Begin T := Self.FUseBelief; end;

(*----------------------------------------------------------------------------*)
procedure TStatePredictionClassFGeneralize_W(Self: TStatePredictionClass; const T: boolean);
Begin Self.FGeneralize := T; end;

(*----------------------------------------------------------------------------*)
procedure TStatePredictionClassFGeneralize_R(Self: TStatePredictionClass; var T: boolean);
Begin T := Self.FGeneralize; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupOperationNeuronLayer_W(Self: TNeuronGroup; const T: TOperation);
Begin Self.OperationNeuronLayer := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupOperationNeuronLayer_R(Self: TNeuronGroup; var T: TOperation);
Begin T := Self.OperationNeuronLayer; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupTestNeuronLayer_W(Self: TNeuronGroup; const T: TTestsClass);
Begin Self.TestNeuronLayer := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupTestNeuronLayer_R(Self: TNeuronGroup; var T: TTestsClass);
Begin T := Self.TestNeuronLayer; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseCorrectPredictionAtWin_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.CorrectPredictionAtWin := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseCorrectPredictionAtWin_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.CorrectPredictionAtWin; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseWrongPredictionAtWin_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.WrongPredictionAtWin := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseWrongPredictionAtWin_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.WrongPredictionAtWin; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseCorrectNeuronPredictionCnt_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.CorrectNeuronPredictionCnt := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseCorrectNeuronPredictionCnt_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.CorrectNeuronPredictionCnt; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseWrongNeuronPredictionCnt_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.WrongNeuronPredictionCnt := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseWrongNeuronPredictionCnt_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.WrongNeuronPredictionCnt; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseLastVictory_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.LastVictory := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseLastVictory_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.LastVictory; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseVitories_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.Vitories := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBaseVitories_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.Vitories; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBasePredictionPos_W(Self: TNeuronGroupBase; const T: integer);
Begin Self.PredictionPos := T; end;

(*----------------------------------------------------------------------------*)
procedure TNeuronGroupBasePredictionPos_R(Self: TNeuronGroupBase; var T: integer);
Begin T := Self.PredictionPos; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TEasyLearnAndPredictClass(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEasyLearnAndPredictClass) do
  begin
    RegisterPropertyHelper(@TEasyLearnAndPredictClassBytePred_R,@TEasyLearnAndPredictClassBytePred_W,'BytePred');
    RegisterPropertyHelper(@TEasyLearnAndPredictClassFCache_R,@TEasyLearnAndPredictClassFCache_W,'FCache');
    RegisterMethod(@TEasyLearnAndPredictClass.Initiate, 'Initiate');
    RegisterMethod(@TEasyLearnAndPredictClass.Predict, 'Predict');
    RegisterMethod(@TEasyLearnAndPredictClass.newStateFound, 'newStateFound');
    RegisterMethod(@TEasyLearnAndPredictClass.UpdatePredictionStats, 'UpdatePredictionStats');
    RegisterMethod(@TEasyLearnAndPredictClass.printRelationTable, 'printRelationTable');
    RegisterMethod(@TEasyLearnAndPredictClass.GetF, 'GetF');
    RegisterMethod(@TEasyLearnAndPredictClass.GetD, 'GetD');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TClassifier(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TClassifier) do
  begin
    RegisterMethod(@TClassifier.AddClassifier, 'AddClassifier');
    RegisterMethod(@TClassifier.AddState, 'AddState');
    RegisterMethod(@TClassifier.EvolveNeuronGroup, 'EvolveNeuronGroup');
    RegisterMethod(@TClassifier.EvolveNeuronGroupAtPos, 'EvolveNeuronGroupAtPos');
    RegisterMethod(@TClassifier.NeuronGroupFitness, 'NeuronGroupFitness');
    RegisterMethod(@TClassifier.MutateNeuronGroup, 'MutateNeuronGroup');
    RegisterMethod(@TClassifier.CreateRandomNeuronGroup, 'CreateRandomNeuronGroup');
    RegisterMethod(@TClassifier.PredictClass, 'PredictClass');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TLabeledState(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TLabeledState) do
  begin
    RegisterPropertyHelper(@TLabeledStateFLabel_R,@TLabeledStateFLabel_W,'FLabel');
    RegisterPropertyHelper(@TLabeledStateFTester_R,@TLabeledStateFTester_W,'FTester');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TStatePredictionClass(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TStatePredictionClass) do
  begin
    RegisterMethod(@TStatePredictionClass.Init, 'Init');
    RegisterMethod(@TStatePredictionClass.NeuronsToString, 'NeuronsToString');
    RegisterMethod(@TStatePredictionClass.CleanAndLoadNeuronsFromString, 'CleanAndLoadNeuronsFromString');
    RegisterMethod(@TStatePredictionClass.DefragAndAddNeuronsFromString, 'DefragAndAddNeuronsFromString');
    RegisterMethod(@TStatePredictionClass.ClearAll, 'ClearAll');
    RegisterMethod(@TStatePredictionClass.RemoveNeuronsAtPos, 'RemoveNeuronsAtPos');
    RegisterMethod(@TStatePredictionClass.RemoveAllNeurons, 'RemoveAllNeurons');
    RegisterMethod(@TStatePredictionClass.UpdatePredictionStats, 'UpdatePredictionStats');
    RegisterMethod(@TStatePredictionClass.CreateNewNeuronsOnError, 'CreateNewNeuronsOnError');
    RegisterMethod(@TStatePredictionClass.Prediction, 'Prediction');
    RegisterMethod(@TStatePredictionClass.PredictionProbability, 'PredictionProbability');
    RegisterMethod(@TStatePredictionClass.DefineLens, 'DefineLens');
    RegisterMethod(@TStatePredictionClass.ClearNeuronVictories, 'ClearNeuronVictories');
    RegisterMethod(@TStatePredictionClass.UpdateNeuronVictories, 'UpdateNeuronVictories');
    RegisterMethod(@TStatePredictionClass.Dump, 'Dump');
    RegisterMethod(@TStatePredictionClass.GetF, 'GetF');
    RegisterMethod(@TStatePredictionClass.GetD, 'GetD');
    RegisterMethod(@TStatePredictionClass.NeuronToHumanReadableString, 'NeuronToHumanReadableString');
    RegisterMethod(@TStatePredictionClass.NeuronToUniqueString, 'NeuronToUniqueString');
    RegisterMethod(@TStatePredictionClass.getVictoriousNeuronsCnt, 'getVictoriousNeuronsCnt');
    RegisterMethod(@TStatePredictionClass.deleteRarelyUsedNeuros, 'deleteRarelyUsedNeuros');
    RegisterMethod(@TStatePredictionClass.deleteNeverWinningNeurons, 'deleteNeverWinningNeurons');
    RegisterMethod(@TStatePredictionClass.deleteDuplicateNeurons, 'deleteDuplicateNeurons');
    RegisterMethod(@TStatePredictionClass.Defrag, 'Defrag');
    RegisterPropertyHelper(@TStatePredictionClassFGeneralize_R,@TStatePredictionClassFGeneralize_W,'FGeneralize');
    RegisterPropertyHelper(@TStatePredictionClassFUseBelief_R,@TStatePredictionClassFUseBelief_W,'FUseBelief');
    RegisterPropertyHelper(@TStatePredictionClassFCS_R,@TStatePredictionClassFCS_W,'FCS');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TNeuronGroup(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TNeuronGroup) do
  begin
    RegisterPropertyHelper(@TNeuronGroupTestNeuronLayer_R,@TNeuronGroupTestNeuronLayer_W,'TestNeuronLayer');
    RegisterPropertyHelper(@TNeuronGroupOperationNeuronLayer_R,@TNeuronGroupOperationNeuronLayer_W,'OperationNeuronLayer');
    RegisterMethod(@TNeuronGroup.Clear, 'Clear');
    RegisterMethod(@TNeuronGroup.GetUniqueString, 'GetUniqueString');
    RegisterMethod(@TNeuronGroup.GetHumanReadableString, 'GetHumanReadableString');
    RegisterMethod(@TNeuronGroup.ToString, 'ToString');
    RegisterMethod(@TNeuronGroup.Filled, 'Filled');
    RegisterMethod(@TNeuronGroup.LoadFromString, 'LoadFromString');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TNeuronGroupBase(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TNeuronGroupBase) do
  begin
    RegisterPropertyHelper(@TNeuronGroupBasePredictionPos_R,@TNeuronGroupBasePredictionPos_W,'PredictionPos');
    RegisterPropertyHelper(@TNeuronGroupBaseVitories_R,@TNeuronGroupBaseVitories_W,'Vitories');
    RegisterPropertyHelper(@TNeuronGroupBaseLastVictory_R,@TNeuronGroupBaseLastVictory_W,'LastVictory');
    RegisterPropertyHelper(@TNeuronGroupBaseWrongNeuronPredictionCnt_R,@TNeuronGroupBaseWrongNeuronPredictionCnt_W,'WrongNeuronPredictionCnt');
    RegisterPropertyHelper(@TNeuronGroupBaseCorrectNeuronPredictionCnt_R,@TNeuronGroupBaseCorrectNeuronPredictionCnt_W,'CorrectNeuronPredictionCnt');
    RegisterPropertyHelper(@TNeuronGroupBaseWrongPredictionAtWin_R,@TNeuronGroupBaseWrongPredictionAtWin_W,'WrongPredictionAtWin');
    RegisterPropertyHelper(@TNeuronGroupBaseCorrectPredictionAtWin_R,@TNeuronGroupBaseCorrectPredictionAtWin_W,'CorrectPredictionAtWin');
    RegisterMethod(@TNeuronGroupBase.GetF, 'GetF');
    RegisterMethod(@TNeuronGroupBase.GetD, 'GetD');
    RegisterMethod(@TNeuronGroupBase.ToString, 'ToString');
    RegisterMethod(@TNeuronGroupBase.Clear, 'Clear');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_neuralbyteprediction(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TNeuronGroupBase(CL);
  RIRegister_TNeuronGroup(CL);
  RIRegister_TStatePredictionClass(CL);
  RIRegister_TLabeledState(CL);
  RIRegister_TClassifier(CL);
  RIRegister_TEasyLearnAndPredictClass(CL);
end;

 
 
{ TPSImport_neuralbyteprediction }
(*----------------------------------------------------------------------------*)
procedure TPSImport_neuralbyteprediction.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_neuralbyteprediction(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_neuralbyteprediction.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_neuralbyteprediction(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
