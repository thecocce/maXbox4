unit uPSI_IdNetworkCalculator;
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
  TPSImport_IdNetworkCalculator = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TIdNetworkCalculator(CL: TPSPascalCompiler);
procedure SIRegister_TIpProperty(CL: TPSPascalCompiler);
procedure SIRegister_IdNetworkCalculator(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_TIdNetworkCalculator(CL: TPSRuntimeClassImporter);
procedure RIRegister_TIpProperty(CL: TPSRuntimeClassImporter);
procedure RIRegister_IdNetworkCalculator(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   IdBaseComponent
  ,IdNetworkCalculator
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_IdNetworkCalculator]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TIdNetworkCalculator(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TIdBaseComponent', 'TIdNetworkCalculator') do
  with CL.AddClassN(CL.FindClass('TIdBaseComponent'),'TIdNetworkCalculator') do
  begin
    RegisterMethod('Function NumIP : integer');
    RegisterMethod('Function StartIP : String');
    RegisterMethod('Function EndIP : String');
    RegisterMethod('Procedure FillIPList');
    RegisterMethod('Constructor Create( AOwner : TComponent)');
    RegisterMethod('Procedure Free;');
    RegisterProperty('ListIP', 'TStrings', iptr);
    RegisterProperty('NetworkClass', 'TNetworkClass', iptr);
    RegisterProperty('NetworkClassAsString', 'String', iptr);
    RegisterProperty('IsAddressRoutable', 'Boolean', iptr);
    RegisterMethod('Function IsAddressInNetwork( Address : String) : Boolean');
    RegisterProperty('NetworkAddress', 'TIpProperty', iptrw);
    RegisterProperty('NetworkMask', 'TIpProperty', iptrw);
    RegisterProperty('NetworkMaskLength', 'cardinal', iptrw);
    RegisterProperty('OnGenIPList', 'TNotifyEvent', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TIpProperty(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TIpProperty') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TIpProperty') do
  begin
    RegisterMethod('Procedure SetAll( One, Two, Three, Four : Byte)');
    RegisterProperty('ByteArray', 'boolean cardinal', iptrw);
    RegisterProperty('AddressType', 'TIdIPAddressType', iptr);
    RegisterProperty('Byte1', 'byte', iptrw);
    RegisterProperty('Byte2', 'Byte', iptrw);
    RegisterProperty('Byte3', 'Byte', iptrw);
    RegisterProperty('Byte4', 'Byte', iptrw);
    RegisterProperty('AsDoubleWord', 'Longword', iptrw);
    RegisterProperty('AsBinaryString', 'String', iptrw);
    RegisterProperty('AsString', 'String', iptrw);
    RegisterProperty('OnChange', 'TNotifyEvent', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_IdNetworkCalculator(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('TNetworkClass', '( ID_NET_CLASS_A, ID_NET_CLASS_B, ID_NET_CLASS_'
   +'C, ID_NET_CLASS_D, ID_NET_CLASS_E )');
 CL.AddConstantN('ID_NC_MASK_LENGTH','LongInt').SetInt( 32);
 //CL.AddConstantN('ID_NETWORKCLASS','').SetString('ID_NET_CLASS_A');
  CL.AddTypeS('TIdIPAddressType', '( IPLocalHost, IPLocalNetwork, IPReserved, I'
   +'PInternetHost, IPPrivateNetwork, IPLoopback, IPMulticast, IPFutureUse, IPG'
   +'lobalBroadcast )');
  SIRegister_TIpProperty(CL);
  SIRegister_TIdNetworkCalculator(CL);
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorOnChange_W(Self: TIdNetworkCalculator; const T: TNotifyEvent);
begin Self.OnChange := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorOnChange_R(Self: TIdNetworkCalculator; var T: TNotifyEvent);
begin T := Self.OnChange; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorOnGenIPList_W(Self: TIdNetworkCalculator; const T: TNotifyEvent);
begin Self.OnGenIPList := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorOnGenIPList_R(Self: TIdNetworkCalculator; var T: TNotifyEvent);
begin T := Self.OnGenIPList; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkMaskLength_W(Self: TIdNetworkCalculator; const T: cardinal);
begin Self.NetworkMaskLength := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkMaskLength_R(Self: TIdNetworkCalculator; var T: cardinal);
begin T := Self.NetworkMaskLength; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkMask_W(Self: TIdNetworkCalculator; const T: TIpProperty);
begin Self.NetworkMask := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkMask_R(Self: TIdNetworkCalculator; var T: TIpProperty);
begin T := Self.NetworkMask; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkAddress_W(Self: TIdNetworkCalculator; const T: TIpProperty);
begin Self.NetworkAddress := T; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkAddress_R(Self: TIdNetworkCalculator; var T: TIpProperty);
begin T := Self.NetworkAddress; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorIsAddressRoutable_R(Self: TIdNetworkCalculator; var T: Boolean);
begin T := Self.IsAddressRoutable; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkClassAsString_R(Self: TIdNetworkCalculator; var T: String);
begin T := Self.NetworkClassAsString; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorNetworkClass_R(Self: TIdNetworkCalculator; var T: TNetworkClass);
begin T := Self.NetworkClass; end;

(*----------------------------------------------------------------------------*)
procedure TIdNetworkCalculatorListIP_R(Self: TIdNetworkCalculator; var T: TStrings);
begin T := Self.ListIP; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyOnChange_W(Self: TIpProperty; const T: TNotifyEvent);
begin Self.OnChange := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyOnChange_R(Self: TIpProperty; var T: TNotifyEvent);
begin T := Self.OnChange; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAsString_W(Self: TIpProperty; const T: String);
begin Self.AsString := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAsString_R(Self: TIpProperty; var T: String);
begin T := Self.AsString; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAsBinaryString_W(Self: TIpProperty; const T: String);
begin Self.AsBinaryString := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAsBinaryString_R(Self: TIpProperty; var T: String);
begin T := Self.AsBinaryString; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAsDoubleWord_W(Self: TIpProperty; const T: Longword);
begin Self.AsDoubleWord := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAsDoubleWord_R(Self: TIpProperty; var T: Longword);
begin T := Self.AsDoubleWord; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte4_W(Self: TIpProperty; const T: Byte);
begin Self.Byte4 := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte4_R(Self: TIpProperty; var T: Byte);
begin T := Self.Byte4; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte3_W(Self: TIpProperty; const T: Byte);
begin Self.Byte3 := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte3_R(Self: TIpProperty; var T: Byte);
begin T := Self.Byte3; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte2_W(Self: TIpProperty; const T: Byte);
begin Self.Byte2 := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte2_R(Self: TIpProperty; var T: Byte);
begin T := Self.Byte2; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte1_W(Self: TIpProperty; const T: byte);
begin Self.Byte1 := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByte1_R(Self: TIpProperty; var T: byte);
begin T := Self.Byte1; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyAddressType_R(Self: TIpProperty; var T: TIdIPAddressType);
begin T := Self.AddressType; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByteArray_W(Self: TIpProperty; const T: boolean; const t1: cardinal);
begin Self.ByteArray[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TIpPropertyByteArray_R(Self: TIpProperty; var T: boolean; const t1: cardinal);
begin T := Self.ByteArray[t1]; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIdNetworkCalculator(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIdNetworkCalculator) do
  begin
    RegisterMethod(@TIdNetworkCalculator.NumIP, 'NumIP');
    RegisterMethod(@TIdNetworkCalculator.StartIP, 'StartIP');
    RegisterMethod(@TIdNetworkCalculator.EndIP, 'EndIP');
    RegisterMethod(@TIdNetworkCalculator.FillIPList, 'FillIPList');
    RegisterConstructor(@TIdNetworkCalculator.Create, 'Create');
    RegisterMethod(@TIdNetworkCalculator.Destroy, 'Free');
    RegisterPropertyHelper(@TIdNetworkCalculatorListIP_R,nil,'ListIP');
    RegisterPropertyHelper(@TIdNetworkCalculatorNetworkClass_R,nil,'NetworkClass');
    RegisterPropertyHelper(@TIdNetworkCalculatorNetworkClassAsString_R,nil,'NetworkClassAsString');
    RegisterPropertyHelper(@TIdNetworkCalculatorIsAddressRoutable_R,nil,'IsAddressRoutable');
    RegisterMethod(@TIdNetworkCalculator.IsAddressInNetwork, 'IsAddressInNetwork');
    RegisterPropertyHelper(@TIdNetworkCalculatorNetworkAddress_R,@TIdNetworkCalculatorNetworkAddress_W,'NetworkAddress');
    RegisterPropertyHelper(@TIdNetworkCalculatorNetworkMask_R,@TIdNetworkCalculatorNetworkMask_W,'NetworkMask');
    RegisterPropertyHelper(@TIdNetworkCalculatorNetworkMaskLength_R,@TIdNetworkCalculatorNetworkMaskLength_W,'NetworkMaskLength');
    RegisterPropertyHelper(@TIdNetworkCalculatorOnGenIPList_R,@TIdNetworkCalculatorOnGenIPList_W,'OnGenIPList');
    RegisterPropertyHelper(@TIdNetworkCalculatorOnChange_R,@TIdNetworkCalculatorOnChange_W,'OnChange');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TIpProperty(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TIpProperty) do
  begin
    RegisterVirtualMethod(@TIpProperty.SetAll, 'SetAll');
    RegisterPropertyHelper(@TIpPropertyByteArray_R,@TIpPropertyByteArray_W,'ByteArray');
    RegisterPropertyHelper(@TIpPropertyAddressType_R,nil,'AddressType');
    RegisterPropertyHelper(@TIpPropertyByte1_R,@TIpPropertyByte1_W,'Byte1');
    RegisterPropertyHelper(@TIpPropertyByte2_R,@TIpPropertyByte2_W,'Byte2');
    RegisterPropertyHelper(@TIpPropertyByte3_R,@TIpPropertyByte3_W,'Byte3');
    RegisterPropertyHelper(@TIpPropertyByte4_R,@TIpPropertyByte4_W,'Byte4');
    RegisterPropertyHelper(@TIpPropertyAsDoubleWord_R,@TIpPropertyAsDoubleWord_W,'AsDoubleWord');
    RegisterPropertyHelper(@TIpPropertyAsBinaryString_R,@TIpPropertyAsBinaryString_W,'AsBinaryString');
    RegisterPropertyHelper(@TIpPropertyAsString_R,@TIpPropertyAsString_W,'AsString');
    RegisterPropertyHelper(@TIpPropertyOnChange_R,@TIpPropertyOnChange_W,'OnChange');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_IdNetworkCalculator(CL: TPSRuntimeClassImporter);
begin
  RIRegister_TIpProperty(CL);
  RIRegister_TIdNetworkCalculator(CL);
end;

 
 
{ TPSImport_IdNetworkCalculator }
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdNetworkCalculator.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_IdNetworkCalculator(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_IdNetworkCalculator.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_IdNetworkCalculator(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
