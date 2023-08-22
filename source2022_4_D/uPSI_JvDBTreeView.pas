unit uPSI_JvDBTreeView;
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
  TPSImport_JvDBTreeView = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TJvDBTreeView(CL: TPSPascalCompiler);
procedure SIRegister_TJvDBTreeNode(CL: TPSPascalCompiler);
procedure SIRegister_TJvDBTreeViewDataLink(CL: TPSPascalCompiler);
procedure SIRegister_TJvCustomDBTreeView(CL: TPSPascalCompiler);
procedure SIRegister_JvDBTreeView(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TJvDBTreeView(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvDBTreeNode(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvDBTreeViewDataLink(CL: TPSRuntimeClassImporter);
procedure RIRegister_TJvCustomDBTreeView(CL: TPSRuntimeClassImporter);
procedure RIRegister_JvDBTreeView(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
  // JclUnitVersioning
  Windows
  ,Messages
  ,CommCtrl
  ,Controls
  ,ExtCtrls
  ,ComCtrls
  ,DB
  ,JvExtComponent
  ,JvDBTreeView
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_JvDBTreeView]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBTreeView(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomDBTreeView', 'TJvDBTreeView') do
  with CL.AddClassN(CL.FindClass('TJvCustomDBTreeView'),'TJvDBTreeView') do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBTreeNode(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TTreeNode', 'TJvDBTreeNode') do
  with CL.AddClassN(CL.FindClass('TTreeNode'),'TJvDBTreeNode') do
  begin
    RegisterMethod('Procedure SetMasterValue( AValue : Variant)');
    RegisterProperty('MasterValue', 'Variant', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvDBTreeViewDataLink(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TDataLink', 'TJvDBTreeViewDataLink') do
  with CL.AddClassN(CL.FindClass('TDataLink'),'TJvDBTreeViewDataLink') do
  begin
    RegisterMethod('Constructor Create( ATreeView : TJvCustomDBTreeView)');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TJvCustomDBTreeView(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TJvCustomTreeView', 'TJvCustomDBTreeView') do
  with CL.AddClassN(CL.FindClass('TJvCustomTreeView'),'TJvCustomDBTreeView') do begin
    RegisterMethod('Constructor Create( AOwner : TComponent)');
     RegisterMethod('Procedure Free');
      RegisterMethod('Procedure DragDrop( Source : TObject; X, Y : Integer)');
    RegisterMethod('Procedure RefreshChild( ANode : TJvDBTreeNode)');
    RegisterMethod('Procedure UpdateTree');
    RegisterMethod('Procedure LinkActive( Value : Boolean)');
    RegisterMethod('Procedure UpdateLock');
    RegisterMethod('Procedure UpdateUnLock( const AUpdateTree : Boolean)');
    RegisterMethod('Function UpdateLocked : Boolean');
    RegisterMethod('Function AddChildNode( const Node : TTreeNode; const Select : Boolean) : TJvDBTreeNode');
    RegisterMethod('Procedure DeleteNode( Node : TTreeNode)');
    RegisterMethod('Function DeleteChildren( ParentNode : TTreeNode) : Boolean');
    RegisterMethod('Function FindNextNode( const Node : TTreeNode) : TTreeNode');
    RegisterMethod('Function FindNode( AMasterValue : Variant) : TJvDBTreeNode');
    RegisterMethod('Function SelectNode( AMasterValue : Variant) : TTreeNode');
    RegisterProperty('DataSource', 'TDataSource', iptrw);
    RegisterProperty('DataLink', 'TJvDBTreeViewDataLink', iptr);
    RegisterProperty('MasterField', 'string', iptrw);
    RegisterProperty('ParentField', 'string', iptrw);
    RegisterProperty('DetailField', 'string', iptrw);
    RegisterProperty('KeyField', 'string', iptrw);
    RegisterProperty('ItemField', 'string', iptrw);
    RegisterProperty('IconField', 'string', iptrw);
    RegisterProperty('StartMasterValue', 'string', iptrw);
    RegisterProperty('GetDetailValue', 'TGetDetailValue', iptrw);
    RegisterProperty('PersistentNode', 'Boolean', iptrw);
    RegisterProperty('SelectedIndex', 'Integer', iptrw);
    RegisterProperty('UseFilter', 'Boolean', iptrw);
    RegisterProperty('Mirror', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_JvDBTreeView(CL: TPSPascalCompiler);
begin
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvDBTreeNode');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TJvDBTreeViewDataLink');
  CL.AddTypeS('TFieldTypes', 'set of TFieldType');
  SIRegister_TJvCustomDBTreeView(CL);
  SIRegister_TJvDBTreeViewDataLink(CL);
  SIRegister_TJvDBTreeNode(CL);
  SIRegister_TJvDBTreeView(CL);
  CL.AddClassN(CL.FindClass('TOBJECT'),'EJvDBTreeViewError');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TJvDBTreeNodeMasterValue_R(Self: TJvDBTreeNode; var T: Variant);
begin T := Self.MasterValue; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewMirror_W(Self: TJvCustomDBTreeView; const T: Boolean);
begin Self.Mirror := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewMirror_R(Self: TJvCustomDBTreeView; var T: Boolean);
begin T := Self.Mirror; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewUseFilter_W(Self: TJvCustomDBTreeView; const T: Boolean);
begin Self.UseFilter := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewUseFilter_R(Self: TJvCustomDBTreeView; var T: Boolean);
begin T := Self.UseFilter; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewSelectedIndex_W(Self: TJvCustomDBTreeView; const T: Integer);
begin Self.SelectedIndex := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewSelectedIndex_R(Self: TJvCustomDBTreeView; var T: Integer);
begin T := Self.SelectedIndex; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewPersistentNode_W(Self: TJvCustomDBTreeView; const T: Boolean);
begin Self.PersistentNode := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewPersistentNode_R(Self: TJvCustomDBTreeView; var T: Boolean);
begin T := Self.PersistentNode; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewGetDetailValue_W(Self: TJvCustomDBTreeView; const T: TGetDetailValue);
begin Self.GetDetailValue := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewGetDetailValue_R(Self: TJvCustomDBTreeView; var T: TGetDetailValue);
begin T := Self.GetDetailValue; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewStartMasterValue_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.StartMasterValue := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewStartMasterValue_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.StartMasterValue; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewIconField_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.IconField := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewIconField_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.IconField; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewItemField_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.ItemField := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewItemField_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.ItemField; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewKeyField_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.KeyField := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewKeyField_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.KeyField; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewDetailField_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.DetailField := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewDetailField_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.DetailField; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewParentField_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.ParentField := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewParentField_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.ParentField; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewMasterField_W(Self: TJvCustomDBTreeView; const T: string);
begin Self.MasterField := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewMasterField_R(Self: TJvCustomDBTreeView; var T: string);
begin T := Self.MasterField; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewDataLink_R(Self: TJvCustomDBTreeView; var T: TJvDBTreeViewDataLink);
begin T := Self.DataLink; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewDataSource_W(Self: TJvCustomDBTreeView; const T: TDataSource);
begin Self.DataSource := T; end;

(*----------------------------------------------------------------------------*)
procedure TJvCustomDBTreeViewDataSource_R(Self: TJvCustomDBTreeView; var T: TDataSource);
begin T := Self.DataSource; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBTreeView(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBTreeView) do
  begin
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBTreeNode(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBTreeNode) do
  begin
    RegisterMethod(@TJvDBTreeNode.SetMasterValue, 'SetMasterValue');
    RegisterPropertyHelper(@TJvDBTreeNodeMasterValue_R,nil,'MasterValue');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvDBTreeViewDataLink(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBTreeViewDataLink) do
  begin
    RegisterConstructor(@TJvDBTreeViewDataLink.Create, 'Create');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TJvCustomDBTreeView(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvCustomDBTreeView) do begin
    RegisterConstructor(@TJvCustomDBTreeView.Create, 'Create');
    RegisterMethod(@TJvCustomDBTreeView.Destroy, 'Free');
    RegisterMethod(@TJvCustomDBTreeView.DragDrop, 'DragDrop');
    RegisterMethod(@TJvCustomDBTreeView.RefreshChild, 'RefreshChild');
    RegisterMethod(@TJvCustomDBTreeView.UpdateTree, 'UpdateTree');
    RegisterVirtualMethod(@TJvCustomDBTreeView.LinkActive, 'LinkActive');
    RegisterMethod(@TJvCustomDBTreeView.UpdateLock, 'UpdateLock');
    RegisterMethod(@TJvCustomDBTreeView.UpdateUnLock, 'UpdateUnLock');
    RegisterMethod(@TJvCustomDBTreeView.UpdateLocked, 'UpdateLocked');
    RegisterMethod(@TJvCustomDBTreeView.AddChildNode, 'AddChildNode');
    RegisterMethod(@TJvCustomDBTreeView.DeleteNode, 'DeleteNode');
    RegisterMethod(@TJvCustomDBTreeView.DeleteChildren, 'DeleteChildren');
    RegisterMethod(@TJvCustomDBTreeView.FindNextNode, 'FindNextNode');
    RegisterMethod(@TJvCustomDBTreeView.FindNode, 'FindNode');
    RegisterMethod(@TJvCustomDBTreeView.SelectNode, 'SelectNode');
    RegisterPropertyHelper(@TJvCustomDBTreeViewDataSource_R,@TJvCustomDBTreeViewDataSource_W,'DataSource');
    RegisterPropertyHelper(@TJvCustomDBTreeViewDataLink_R,nil,'DataLink');
    RegisterPropertyHelper(@TJvCustomDBTreeViewMasterField_R,@TJvCustomDBTreeViewMasterField_W,'MasterField');
    RegisterPropertyHelper(@TJvCustomDBTreeViewParentField_R,@TJvCustomDBTreeViewParentField_W,'ParentField');
    RegisterPropertyHelper(@TJvCustomDBTreeViewDetailField_R,@TJvCustomDBTreeViewDetailField_W,'DetailField');
    RegisterPropertyHelper(@TJvCustomDBTreeViewKeyField_R,@TJvCustomDBTreeViewKeyField_W,'KeyField');
    RegisterPropertyHelper(@TJvCustomDBTreeViewItemField_R,@TJvCustomDBTreeViewItemField_W,'ItemField');
    RegisterPropertyHelper(@TJvCustomDBTreeViewIconField_R,@TJvCustomDBTreeViewIconField_W,'IconField');
    RegisterPropertyHelper(@TJvCustomDBTreeViewStartMasterValue_R,@TJvCustomDBTreeViewStartMasterValue_W,'StartMasterValue');
    RegisterPropertyHelper(@TJvCustomDBTreeViewGetDetailValue_R,@TJvCustomDBTreeViewGetDetailValue_W,'GetDetailValue');
    RegisterPropertyHelper(@TJvCustomDBTreeViewPersistentNode_R,@TJvCustomDBTreeViewPersistentNode_W,'PersistentNode');
    RegisterPropertyHelper(@TJvCustomDBTreeViewSelectedIndex_R,@TJvCustomDBTreeViewSelectedIndex_W,'SelectedIndex');
    RegisterPropertyHelper(@TJvCustomDBTreeViewUseFilter_R,@TJvCustomDBTreeViewUseFilter_W,'UseFilter');
    RegisterPropertyHelper(@TJvCustomDBTreeViewMirror_R,@TJvCustomDBTreeViewMirror_W,'Mirror');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_JvDBTreeView(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TJvDBTreeNode) do
  with CL.Add(TJvDBTreeViewDataLink) do
  RIRegister_TJvCustomDBTreeView(CL);
  RIRegister_TJvDBTreeViewDataLink(CL);
  RIRegister_TJvDBTreeNode(CL);
  RIRegister_TJvDBTreeView(CL);
  with CL.Add(EJvDBTreeViewError) do
end;

 
 
{ TPSImport_JvDBTreeView }
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvDBTreeView.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_JvDBTreeView(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_JvDBTreeView.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_JvDBTreeView(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
