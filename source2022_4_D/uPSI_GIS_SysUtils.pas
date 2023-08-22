unit uPSI_GIS_SysUtils;
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
  TPSImport_GIS_SysUtils = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_TTextureData(CL: TPSPascalCompiler);
procedure SIRegister_TGroupsStore(CL: TPSPascalCompiler);
procedure SIRegister_TPointStore(CL: TPSPascalCompiler);
procedure SIRegister_TEarthRoot(CL: TPSPascalCompiler);
procedure SIRegister_GIS_SysUtils(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_GIS_SysUtils_Routines(S: TPSExec);
procedure RIRegister_TTextureData(CL: TPSRuntimeClassImporter);
procedure RIRegister_TGroupsStore(CL: TPSRuntimeClassImporter);
procedure RIRegister_TPointStore(CL: TPSRuntimeClassImporter);
procedure RIRegister_TEarthRoot(CL: TPSRuntimeClassImporter);
procedure RIRegister_GIS_SysUtils(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   LCLIntf
  ,LCLType
  ,LMessages
  ,Graphics
  ,ExtCtrls
  ,Dialogs
  ,GR32
  ,FileUtil
  ,XGR32_Color
  ,XGR32_Bmp32Func
  ,math
  ,GIS_Resource
  ,GIS_SysUtils
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_GIS_SysUtils]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_TTextureData(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TEarthRoot', 'TTextureData') do
  with CL.AddClassN(CL.FindClass('TEarthRoot'),'TTextureData') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure LoadFromStream( aStream : TStream)');
    RegisterMethod('Procedure LoadFromFile( const sFilename : TFilename)');
    RegisterMethod('Procedure MapPoint( iLong, iLat, TexX, TexY : Double)');
    RegisterMethod('Procedure Delete');
    RegisterMethod('Function IsTextureOK : Boolean');
    RegisterMethod('Function LLToTextureXY( ptLL : TPointLL) : TPoint');
    RegisterMethod('Function TextureXYToLL( ptXY : TPoint) : TPointLL');
    RegisterProperty('TextureStream', 'TBitmap32', iptr);
    RegisterProperty('TransparentColor', 'TColor', iptrw);
    RegisterProperty('Width', 'integer', iptr);
    RegisterProperty('Height', 'integer', iptr);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TGroupsStore(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TEarthRoot', 'TGroupsStore') do
  with CL.AddClassN(CL.FindClass('TEarthRoot'),'TGroupsStore') do
  begin
    RegisterMethod('Constructor Create');
    RegisterMethod('Procedure Insert( iIndex : Integer; PointStore : TPointStore)');
    RegisterMethod('Procedure Delete( iIndex : Integer)');
    RegisterMethod('Procedure Add( PointStore : TPointStore)');
    RegisterMethod('Function AddNew : TPointStore');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Procedure Move( iFrom, iTo : integer)');
    RegisterMethod('Function Clone : TGroupsStore');
    RegisterMethod('Function Centroid : TPointLL');
    RegisterMethod('Function GroupStoreMER : TMER');
    RegisterProperty('Group', 'TPointStore integer', iptrw);
    SetDefaultPropery('Group');
    RegisterProperty('Count', 'Integer', iptrw);
    RegisterProperty('StoreHeight', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TPointStore(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TEarthRoot', 'TPointStore') do
  with CL.AddClassN(CL.FindClass('TEarthRoot'),'TPointStore') do
  begin
    RegisterProperty('Flags', 'TPointStoreFlagsSet', iptrw);
    RegisterMethod('Function ObjectInstanceSize : integer');
    RegisterMethod('Procedure Insert( iIndex : Integer; ptLL : TPointLL)');
    RegisterMethod('Procedure Delete( iIndex : Integer)');
    RegisterMethod('Procedure Clear');
    RegisterMethod('Function Add( ptLL : TPointLL) : integer');
    RegisterMethod('Function PointStoreMER : TMER');
    RegisterMethod('Function Clone : TPointStore');
    RegisterMethod('Procedure Move( iFrom, iTo : integer)');
    RegisterMethod('Function PointInPolygon( iLong, iLat : Double) : Boolean');
    RegisterMethod('Function PointOnPolyline( iLong, iLat, iTolerance : Double) : Boolean');
    RegisterMethod('Function Centroid : TPointLL');
    RegisterMethod('Procedure Translate( dx, dy, dz : Double)');
    RegisterMethod('Procedure Refresh');
    RegisterMethod('Function Point3DArray( CacheArray : Boolean) : DynArray');
    RegisterProperty('AsDD', 'TPointDD Integer', iptrw);
    RegisterProperty('AsLL', 'TPointLL Integer', iptrw);
    SetDefaultPropery('AsLL');
    RegisterProperty('As3D', 'TPoint3D integer', iptr);
    RegisterProperty('Count', 'Integer', iptrw);
    RegisterProperty('StoreHeight', 'Boolean', iptrw);
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_TEarthRoot(CL: TPSPascalCompiler);
begin
  //with RegClassS(CL,'TPersistent', 'TEarthRoot') do
  with CL.AddClassN(CL.FindClass('TPersistent'),'TEarthRoot') do
  begin
    RegisterMethod('Function PrintableClassName : string');
    RegisterMethod('Procedure RedrawObject');
    RegisterMethod('Procedure BeginUpdate');
    RegisterMethod('Procedure EndUpdate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure SIRegister_GIS_SysUtils(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('TG_FILEVERSION3000','LongWord').SetUInt( $1003);
 CL.AddConstantN('TG_FILEVERSION1002','LongWord').SetUInt( $1002);
 CL.AddConstantN('TG_FILEVERSION1001','LongWord').SetUInt( $1001);
 CL.AddConstantN('TG_FILEVERSION405','LongWord').SetUInt( $0405);
 CL.AddConstantN('TG_FILEVERSION400','LongWord').SetUInt( $0400);
 CL.AddConstantN('TG_FILEVERSION300','LongWord').SetUInt( $0300);
 CL.AddConstantN('TG_FILEVERSION301','LongWord').SetUInt( $0301);
 CL.AddConstantN('TG_FILEVERSION','').SetString( TG_FILEVERSION3000);
 CL.AddConstantN('TG_METADATA_VERSION','').SetString( TG_FILEVERSION3000);
 CL.AddConstantN('LocalPI','Extended').setExtended( 3.14159265358979323846);
 CL.AddConstantN('GMAXPOINTS','LongInt').SetInt( ( 1024 * 128 ));
 CL.AddConstantN('GMINALTITUDE','Extended').setExtended( 0.001);
 CL.AddConstantN('GMAXALTITUDE','Extended').setExtended( 10000000000.0);
 CL.AddConstantN('GMAXSCALEFACTOR','Extended').setExtended( 1000.0);
 CL.AddConstantN('GMINSCALEFACTOR','Extended').setExtended( 0.00000003);
 CL.AddConstantN('Earth_RESOLUTION_Max','Extended').setExtended( 1500.0);
 CL.AddConstantN('GU_NAUTICALMILE','').SetString( GU_MINUTE);
 CL.AddConstantN('GFOV_ANGLE','Extended').setExtended( 1.0);
 CL.AddConstantN('GEPSILON','Extended').setExtended( 1E-10);
 CL.AddConstantN('GMaxDouble','Extended').setExtended( 10000000000000000000000000000000.0);
 CL.AddConstantN('FixText','String').SetString( '../');
  CL.AddTypeS('TSpheroidData', 'record a : Double; f : Double; end');
  CL.AddTypeS('TSpheroid', '( Airy1830, Australian1965, Bessel1841, Clarke1866,'
   +' Clarke1880, Everest1830, GRS1967, GRS1980, Helmert1906, Hough, Internatio'
   +'nal1920, Krassovsky1940, SouthAmerican1969, WGS60, WGS66, WGS72, WGS84 )');
  CL.AddClassN(CL.FindClass('TOBJECT'),'EEarthException');
  CL.AddTypeS('TEarthDegree', 'Extended');
  CL.AddTypeS('TEarthUnitTypes', '( euDegree, euMinute, euNauticalMile, euKilom'
   +'eter, euMile, euSecond, euThird, euHundreth, euThousanth, euMeter, euCenti'
   +'Meter, euFathom, euYard, euFoot, euInch, euEarthUnit, euPixel )');
  CL.AddTypeS('THeightUnitTypes', '( huEarthUnit, huNauticalMile, huKilometer, '
   +'huMile, huMeter, huCentiMeter, huFathom, huYard, huFoot, huInch )');
  CL.AddTypeS('TGISProgressMessage', '( pmMessage, pmStart, pmEnd, pmPercent, p'
   +'mError )');
  CL.AddTypeS('TEarthPOZ', 'record eSF : Extended; CenterXY : TPointDouble; iRo'
   +'tX : Double; iRotY : Double; iRotZ : Double; end');
  CL.AddTypeS('TEarthBrushStyle', '( gbsSolid, gbsClear, gbsHorizontal, gbsVert'
   +'ical, gbsFDiagonal, gbsBDiagonal, gbsCross, gbsDiagCross, gbsPattern1, gbs'
   +'Pattern2, gbsPattern3, gbsPattern4, gbsPattern5, gbsPattern6, gbsPattern7,'
   +' gbsPattern8, gbsPattern9, gbsPattern10, gbsPattern11, gbsPattern12, gbsPa'
   +'ttern13, gbsPattern14, gbsPattern15, gbsPattern16, gbsPattern17, gbsPatter'
   +'n18, gbsPattern19, gbsPattern20, gbsPattern21, gbsPattern22, gbsPattern23,'
   +' gbsPattern24, gbsPattern25, gbsPattern26, gbsPattern27, gbsPattern28, gbs'
   +'Pattern29, gbsPattern30, gbsPattern31, gbsPattern32, gbsPattern33, gbsPatt'
   +'ern34, gbsPattern35, gbsPattern36, gbsPattern37, gbsPattern38, gbsPattern3'
   +'9, gbsPattern40, gbsPattern41, gbsPattern42, gbsPattern43, gbsPattern44, g'
   +'bsPattern45, gbsPattern46, gbsPattern47, gbsPattern48, gbsPattern49, gbsPa'
   +'ttern50 )');
  CL.AddTypeS('TEarthObjectState', '( osNew, osClosed, osHidden, osDiscardable,'
   +' osBackFace, osFace, osSelected, osValidMER, osRedraw, osDeleted, osClipLe'
   +'ft, osClipTop, osClipRight, osClipBottom, osTiny, osVisible )');
  CL.AddTypeS('TEarthObjectStateSet', 'set of TEarthObjectState');
  SIRegister_TEarthRoot(CL);
  //CL.AddTypeS('TEarthRootClass', 'class of TEarthRoot');
  CL.AddTypeS('TDynArrayRecord', 'record Count : PtrInt; Itemsize : integer; Re'
   +'fCount : PtrInt; end');
  CL.AddTypeS('DynArray', '^TDynArrayRecord // will not work');
  CL.AddTypeS('PDynArray', '^DynArray // will not work');
  CL.AddTypeS('TPointStoreType', '( ptLL, ptLLH )');
  CL.AddTypeS('TPointStoreFlags', '( psLongCount, ps16Bit, psCompressed, psHeig'
   +'ht )');
  CL.AddTypeS('TPointStoreFlagsSet', 'set of TPointStoreFlags');
  CL.AddTypeS('PTPointStore', '^TPointStore // will not work');
  CL.AddTypeS('TUnitsformat', '( UF_DDMMSS, UF_DDMM, UF_DD, UF_DDMMSSTT )');
  CL.AddClassN(CL.FindClass('TOBJECT'),'TGroupsStore');
  SIRegister_TPointStore(CL);
  //CL.AddTypeS('TPointStoreClass', 'class of TPointStore');
  SIRegister_TGroupsStore(CL);
  //CL.AddTypeS('TGroupsStoreClass', 'class of TGroupsStore');
  SIRegister_TTextureData(CL);
 CL.AddDelphiFunction('Function DynArrayCreate( const iItemSize, iCount : integer) : DynArray');
 CL.AddDelphiFunction('Function DynArrayClone( const aDynArray : DynArray) : DynArray');
 CL.AddDelphiFunction('Procedure DynArrayInsert( var aDynArray : DynArray; iIndex : integer)');
 CL.AddDelphiFunction('Procedure DynArrayDelete( var aDynArray : DynArray; iIndex : integer)');
 CL.AddDelphiFunction('Procedure DynArrayMove( var aDynArray : DynArray; iFrom, iTo : integer)');
 CL.AddDelphiFunction('Procedure DynArrayFree( var aDynArray : DynArray)');
 CL.AddDelphiFunction('Procedure DynArraySetLength( var aDynArray : DynArray; iCount : integer)');
 CL.AddDelphiFunction('Function DynArrayPtr( const aDynArray : DynArray; iIndex : integer) : Pointer');
 CL.AddDelphiFunction('Function DynArrayCount( const aDynArray : DynArray) : integer');
 CL.AddDelphiFunction('Function DynArrayAsObject( const aDynArray : DynArray; iIndex : integer) : TObject');
 CL.AddDelphiFunction('Function DynArrayAsInteger( const aDynArray : DynArray; iIndex : integer) : integer');
 CL.AddDelphiFunction('Function DynArrayIndexOfObject( const aDynArray : DynArray; Obj : TObject) : integer');
 CL.AddDelphiFunction('Function DynArraySetAsObject( const aDynArray : DynArray; iIndex : integer; Obj : TObject) : TObject');
 CL.AddDelphiFunction('Function DynArraySetAsInteger( const aDynArray : DynArray; iIndex : integer; Value : integer) : integer');
 CL.AddDelphiFunction('Procedure DynArrayIncReference( const aDynArray : DynArray)');
 CL.AddDelphiFunction('Procedure DynArrayDecReference( const aDynArray : DynArray)');
 CL.AddDelphiFunction('Function PointDouble( const X, Y : integer) : TPointDouble;');
 CL.AddDelphiFunction('Function PointDouble1( const X, Y : Double) : TPointDouble;');
 CL.AddDelphiFunction('Function PointDouble2( const p : TPoint) : TPointDouble;');
 CL.AddDelphiFunction('Function PointD( const p : TPointDouble) : TPoint;');
 CL.AddDelphiFunction('Function PointD1( const X, Y : Double) : TPoint;');
 CL.AddDelphiFunction('Function RectD( const aLeft, aTop, aRight, aBottom : Double) : TRect');
 CL.AddDelphiFunction('Function GRectFloat( const aLeft, aTop, aRight, aBottom : Double) : TGRectFloat');
 CL.AddDelphiFunction('Function PointLLInit : TPointLL');
 CL.AddDelphiFunction('Function PointLL( const iLongX, iLatY : integer) : TPointLL;');
 CL.AddDelphiFunction('Function PointLL1( const iLongX, iLatY : Double) : TPointLL;');
 CL.AddDelphiFunction('Function PointLL2( const iLongX, iLatY, iHeight : integer) : TPointLL');
 CL.AddDelphiFunction('Function PointLLGetLong( const ptLL : TPointLL) : Double');
 CL.AddDelphiFunction('Function PointLLGetLat( const ptLL : TPointLL) : Double');
 CL.AddDelphiFunction('Function PointLLGetHeight( const ptLL : TPointLL) : Double');
 CL.AddDelphiFunction('Function PointLLAsText( const iLong, iLat : Double) : string');
 CL.AddDelphiFunction('Function PointLLAsText2( const ptLL : TPointLL) : string');
 CL.AddDelphiFunction('Function PointLLAsTextU( const iLong, iLat : Double; aUnitsformat : TUnitsformat) : string');
 CL.AddDelphiFunction('Function PointLLAsTextU2( const ptLL : TPointLL; aUnitsformat : TUnitsformat) : string');
 CL.AddDelphiFunction('Function PointLLAsTextFm( const iLong, iLat : Double; sFmt : string) : string');
 CL.AddDelphiFunction('Function PointLLAsTextFm2( const ptLL : TPointLL; sFmt : string) : string');
 CL.AddDelphiFunction('Function PointLLH( iLongX, iLatY, iHeightZ : Double) : TPointLL');
 CL.AddDelphiFunction('Function PointDD( LongX, LatY : TEarthDegree) : TPointDD');
 CL.AddDelphiFunction('Function PointDDH( LongX, LatY, HeightZ : TEarthDegree) : TPointDD');
 CL.AddDelphiFunction('Function Point3D( Long, Lat, Height : Double) : TPoint3D');
 CL.AddDelphiFunction('Function MER( iLong, iLat, iWidth, iHeight : Double) : TMER');
 CL.AddDelphiFunction('Function sIFE( bCond : Boolean; const sLeft, sRight : string) : string');
 CL.AddDelphiFunction('Function StrToExtended( const Text : string) : Extended');
 CL.AddDelphiFunction('Function StrToExtendedDef( const Text : string; Default : Extended) : Extended');
 CL.AddDelphiFunction('Function PointOnLine( iLong, iLat, ax, ay, bx, by, iTolerance : Double) : Boolean');
 CL.AddDelphiFunction('Function PointLLinMER( const ptLL : TPointLL; const MER : TMER) : Boolean');
 CL.AddDelphiFunction('Function MERinMER( const innerMER, outerMER : TMER) : Boolean');
 CL.AddDelphiFunction('Function UnionMER( const MER1, MER2 : TMER) : TMER');
 CL.AddDelphiFunction('Function IsEmptyMER( const aMER : TMER) : Boolean');
 CL.AddDelphiFunction('Function PointsToMER( ptLLArray : array of TPointLL) : TMER');
 CL.AddDelphiFunction('Function PointsToRect( ptArray : array of TPoint) : TRect;');
 CL.AddDelphiFunction('Function PointsDoubleToRect( ptArray : array of TPointDouble) : TRect;');
 CL.AddDelphiFunction('Function EarthUnitsToStr( const aValue : Double; const sFmt : string) : string');
 CL.AddDelphiFunction('Function StrToEarthUnits( const aText : string; const sFmt : string) : Double');
 CL.AddDelphiFunction('Function LLAsString( iLong, iLat : Double) : string');
 CL.AddDelphiFunction('Function LLAsString2( ptLL : TPointLL) : string');
 CL.AddDelphiFunction('Function DecimalToEarthUnits( const Value : Extended) : Extended');
 CL.AddDelphiFunction('Function DecimalToPointLL( const Longitude, Latitude : Extended) : TPointLL');
 CL.AddDelphiFunction('Function EarthUnitsToDecimal( iValue : Extended) : Extended');
 CL.AddDelphiFunction('Function EarthUnitsTo( iValue : Extended; Units : TEarthUnitTypes) : Extended');
 CL.AddDelphiFunction('Function EarthUnitsFrom( const eValue : Extended; Units : TEarthUnitTypes) : Double');
 CL.AddDelphiFunction('Function UnitsToStr( Units : TEarthUnitTypes) : string');
 CL.AddDelphiFunction('Function StrToUnits( const sUnits : string) : TEarthUnitTypes');
 CL.AddDelphiFunction('Function GetUnitsformatForLong( const Unitsformat : TUnitsformat) : string');
 CL.AddDelphiFunction('Function GetUnitsformatForLat( const Unitsformat : TUnitsformat) : string');
 CL.AddDelphiFunction('Function GetUnitsformatMaskForLong( const Unitsformat : TUnitsformat) : string');
 CL.AddDelphiFunction('Function GetUnitsformatMaskForLat( const Unitsformat : TUnitsformat) : string');
 CL.AddDelphiFunction('Function HeightUnitsTo( iValue : Double; Units : THeightUnitTypes) : Extended');
 CL.AddDelphiFunction('Function HeightUnitsFrom( const eValue : Extended; Units : THeightUnitTypes) : Double');
 CL.AddDelphiFunction('Function StrToHUnits( const sUnits : string) : THeightUnitTypes');
 CL.AddDelphiFunction('Function HUnitsToStr( Units : THeightUnitTypes) : string');
 CL.AddDelphiFunction('Function PointLLToV3D( const ptLL : TPointLL) : TV3D');
 CL.AddDelphiFunction('Function V3DtoPointLL( const vec : TV3D) : TPointLL');
 CL.AddDelphiFunction('Function V3D( eX, eY, eZ : Extended) : TV3D');
 CL.AddDelphiFunction('Procedure V3DNormalize( var vec : TV3D)');
 CL.AddDelphiFunction('Function V3DCross( const a, b : TV3D) : TV3D');
 CL.AddDelphiFunction('Function V3DDot( const a, b : TV3D) : Extended');
 CL.AddDelphiFunction('Function V3DAdd( const a, b : TV3D) : TV3D');
 CL.AddDelphiFunction('Function V3DSub( const a, b : TV3D) : TV3D');
 CL.AddDelphiFunction('Function V3DMul( const a, b : TV3D) : TV3D');
 CL.AddDelphiFunction('Function V3DLerp( const lo, hi : TV3D; alpha : Extended) : TV3D');
 CL.AddDelphiFunction('Function V3DMatrixMul( const mat : TGMatrix; const vec : TV3D) : TV3D');
 CL.AddDelphiFunction('Function PointLLMatrixMul( const mat : TGMatrix; const ptLL : TPointLL) : TPointLL');
 CL.AddDelphiFunction('Function Quat( X, Y, Z, W : Extended) : TQuaternion');
 CL.AddDelphiFunction('Procedure QuatNormalize( var Quat : TQuaternion)');
 CL.AddDelphiFunction('Function AxisAngleToQuat( const axis : TV3D; angle : Extended) : TQuaternion');
 CL.AddDelphiFunction('Function EulerToQuat( iRotX, iRotY, iRotZ : Extended) : TQuaternion');
 CL.AddDelphiFunction('Function QuatDot( const q1, q2 : TQuaternion) : Extended');
 CL.AddDelphiFunction('Function QuatMul( const q1, q2 : TQuaternion) : TQuaternion');
 CL.AddDelphiFunction('Function VectorsToQuat( const vec1, vec2 : TV3D) : TQuaternion');
 CL.AddDelphiFunction('Function QuatSlerp( const qLo, qHi : TQuaternion; alpha : Extended) : TQuaternion');
 CL.AddDelphiFunction('Procedure QuatToAxisAngle( const Quat : TQuaternion; var Axis : TV3D; var Angle : Extended)');
 CL.AddDelphiFunction('Procedure QuatToMatrix( const Quat : TQuaternion; var mat : TGMatrix)');
 CL.AddDelphiFunction('Procedure TransposeMatrix( var FromMat, ToMat : TGMatrix)');
 CL.AddDelphiFunction('Procedure ScaleMatrix( var mat : TGMatrix; eSF : Extended)');
 CL.AddDelphiFunction('Function SphericalMod( X : Extended) : Extended');
 CL.AddDelphiFunction('Function Sign( Value : Extended) : Extended');
 CL.AddDelphiFunction('Function LimitFloat( const eValue, eMin, eMax : Extended) : Extended');
 CL.AddDelphiFunction('Function AngleToRadians( iAngle : Extended) : Extended');
 CL.AddDelphiFunction('Function RadiansToAngle( eRad : Extended) : Extended');
 CL.AddDelphiFunction('Function Cross180( iLong : Double) : Boolean');
 CL.AddDelphiFunction('Function Mod180( Value : integer) : Integer');
 CL.AddDelphiFunction('Function Mod180Float( Value : Extended) : Extended');
 CL.AddDelphiFunction('Function MulDivFloat( a, b, d : Extended) : Extended');
 CL.AddDelphiFunction('Function LongDiff( iLong1, iLong2 : Double) : Double');
 CL.AddDelphiFunction('Procedure Bmp_AssignFromPersistent( Source : TPersistent; Bmp : TbitMap)');
 CL.AddDelphiFunction('Function Bmp_CreateFromPersistent( Source : TPersistent) : TbitMap');
 CL.AddDelphiFunction('Function FixFilePath( const Inpath, CheckPath : string) : string');
 CL.AddDelphiFunction('Function UnFixFilePath( const Inpath, CheckPath : string) : string');
 CL.AddDelphiFunction('Procedure FillStringList( sl : TStringList; const aText : string)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
Function PointsDoubleToRect_P( ptArray : array of TPointDouble) : TRect;
Begin Result := GIS_SysUtils.PointsDoubleToRect(ptArray); END;

(*----------------------------------------------------------------------------*)
Function PointsToRect_P( ptArray : array of TPoint) : TRect;
Begin Result := GIS_SysUtils.PointsToRect(ptArray); END;

(*----------------------------------------------------------------------------*)
Function PointLL1_P( const iLongX, iLatY : Double) : TPointLL;
Begin Result := GIS_SysUtils.PointLL(iLongX, iLatY); END;

(*----------------------------------------------------------------------------*)
Function PointLL_P( const iLongX, iLatY : integer) : TPointLL;
Begin Result := GIS_SysUtils.PointLL(iLongX, iLatY); END;

(*----------------------------------------------------------------------------*)
Function PointD1_P( const X, Y : Double) : TPoint;
Begin Result := GIS_SysUtils.PointD(X, Y); END;

(*----------------------------------------------------------------------------*)
Function PointD_P( const p : TPointDouble) : TPoint;
Begin Result := GIS_SysUtils.PointD(p); END;

(*----------------------------------------------------------------------------*)
Function PointDouble2_P( const p : TPoint) : TPointDouble;
Begin Result := GIS_SysUtils.PointDouble(p); END;

(*----------------------------------------------------------------------------*)
Function PointDouble1_P( const X, Y : Double) : TPointDouble;
Begin Result := GIS_SysUtils.PointDouble(X, Y); END;

(*----------------------------------------------------------------------------*)
Function PointDouble_P( const X, Y : integer) : TPointDouble;
Begin Result := GIS_SysUtils.PointDouble(X, Y); END;

(*----------------------------------------------------------------------------*)
procedure TTextureDataHeight_R(Self: TTextureData; var T: integer);
begin T := Self.Height; end;

(*----------------------------------------------------------------------------*)
procedure TTextureDataWidth_R(Self: TTextureData; var T: integer);
begin T := Self.Width; end;

(*----------------------------------------------------------------------------*)
procedure TTextureDataTransparentColor_W(Self: TTextureData; const T: TColor);
begin Self.TransparentColor := T; end;

(*----------------------------------------------------------------------------*)
procedure TTextureDataTransparentColor_R(Self: TTextureData; var T: TColor);
begin T := Self.TransparentColor; end;

(*----------------------------------------------------------------------------*)
procedure TTextureDataTextureStream_R(Self: TTextureData; var T: TBitmap32);
begin T := Self.TextureStream; end;

(*----------------------------------------------------------------------------*)
procedure TGroupsStoreStoreHeight_W(Self: TGroupsStore; const T: Boolean);
begin Self.StoreHeight := T; end;

(*----------------------------------------------------------------------------*)
procedure TGroupsStoreStoreHeight_R(Self: TGroupsStore; var T: Boolean);
begin T := Self.StoreHeight; end;

(*----------------------------------------------------------------------------*)
procedure TGroupsStoreCount_W(Self: TGroupsStore; const T: Integer);
begin Self.Count := T; end;

(*----------------------------------------------------------------------------*)
procedure TGroupsStoreCount_R(Self: TGroupsStore; var T: Integer);
begin T := Self.Count; end;

(*----------------------------------------------------------------------------*)
procedure TGroupsStoreGroup_W(Self: TGroupsStore; const T: TPointStore; const t1: integer);
begin Self.Group[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TGroupsStoreGroup_R(Self: TGroupsStore; var T: TPointStore; const t1: integer);
begin T := Self.Group[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreStoreHeight_W(Self: TPointStore; const T: Boolean);
begin Self.StoreHeight := T; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreStoreHeight_R(Self: TPointStore; var T: Boolean);
begin T := Self.StoreHeight; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreCount_W(Self: TPointStore; const T: Integer);
begin Self.Count := T; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreCount_R(Self: TPointStore; var T: Integer);
begin T := Self.Count; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreAs3D_R(Self: TPointStore; var T: TPoint3D; const t1: integer);
begin T := Self.As3D[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreAsLL_W(Self: TPointStore; const T: TPointLL; const t1: Integer);
begin Self.AsLL[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreAsLL_R(Self: TPointStore; var T: TPointLL; const t1: Integer);
begin T := Self.AsLL[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreAsDD_W(Self: TPointStore; const T: TPointDD; const t1: Integer);
begin Self.AsDD[t1] := T; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreAsDD_R(Self: TPointStore; var T: TPointDD; const t1: Integer);
begin T := Self.AsDD[t1]; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreFlags_W(Self: TPointStore; const T: TPointStoreFlagsSet);
Begin Self.Flags := T; end;

(*----------------------------------------------------------------------------*)
procedure TPointStoreFlags_R(Self: TPointStore; var T: TPointStoreFlagsSet);
Begin T := Self.Flags; end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_GIS_SysUtils_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@DynArrayCreate, 'DynArrayCreate', cdRegister);
 S.RegisterDelphiFunction(@DynArrayClone, 'DynArrayClone', cdRegister);
 S.RegisterDelphiFunction(@DynArrayInsert, 'DynArrayInsert', cdRegister);
 S.RegisterDelphiFunction(@DynArrayDelete, 'DynArrayDelete', cdRegister);
 S.RegisterDelphiFunction(@DynArrayMove, 'DynArrayMove', cdRegister);
 S.RegisterDelphiFunction(@DynArrayFree, 'DynArrayFree', cdRegister);
 S.RegisterDelphiFunction(@DynArraySetLength, 'DynArraySetLength', cdRegister);
 S.RegisterDelphiFunction(@DynArrayPtr, 'DynArrayPtr', cdRegister);
 S.RegisterDelphiFunction(@DynArrayCount, 'DynArrayCount', cdRegister);
 S.RegisterDelphiFunction(@DynArrayAsObject, 'DynArrayAsObject', cdRegister);
 S.RegisterDelphiFunction(@DynArrayAsInteger, 'DynArrayAsInteger', cdRegister);
 S.RegisterDelphiFunction(@DynArrayIndexOfObject, 'DynArrayIndexOfObject', cdRegister);
 S.RegisterDelphiFunction(@DynArraySetAsObject, 'DynArraySetAsObject', cdRegister);
 S.RegisterDelphiFunction(@DynArraySetAsInteger, 'DynArraySetAsInteger', cdRegister);
 S.RegisterDelphiFunction(@DynArrayIncReference, 'DynArrayIncReference', cdRegister);
 S.RegisterDelphiFunction(@DynArrayDecReference, 'DynArrayDecReference', cdRegister);
 S.RegisterDelphiFunction(@PointDouble, 'PointDouble', cdRegister);
 S.RegisterDelphiFunction(@PointDouble1, 'PointDouble1', cdRegister);
 S.RegisterDelphiFunction(@PointDouble2, 'PointDouble2', cdRegister);
 S.RegisterDelphiFunction(@PointD, 'PointD', cdRegister);
 S.RegisterDelphiFunction(@PointD1, 'PointD1', cdRegister);
 S.RegisterDelphiFunction(@RectD, 'RectD', cdRegister);
 S.RegisterDelphiFunction(@GRectFloat, 'GRectFloat', cdRegister);
 S.RegisterDelphiFunction(@PointLLInit, 'PointLLInit', cdRegister);
 S.RegisterDelphiFunction(@PointLL, 'PointLL', cdRegister);
 S.RegisterDelphiFunction(@PointLL1, 'PointLL1', cdRegister);
 S.RegisterDelphiFunction(@PointLL2, 'PointLL2', cdRegister);
 S.RegisterDelphiFunction(@PointLLGetLong, 'PointLLGetLong', cdRegister);
 S.RegisterDelphiFunction(@PointLLGetLat, 'PointLLGetLat', cdRegister);
 S.RegisterDelphiFunction(@PointLLGetHeight, 'PointLLGetHeight', cdRegister);
 S.RegisterDelphiFunction(@PointLLAsText, 'PointLLAsText', cdRegister);
 S.RegisterDelphiFunction(@PointLLAsText2, 'PointLLAsText2', cdRegister);
 S.RegisterDelphiFunction(@PointLLAsTextU, 'PointLLAsTextU', cdRegister);
 S.RegisterDelphiFunction(@PointLLAsTextU2, 'PointLLAsTextU2', cdRegister);
 S.RegisterDelphiFunction(@PointLLAsTextFm, 'PointLLAsTextFm', cdRegister);
 S.RegisterDelphiFunction(@PointLLAsTextFm2, 'PointLLAsTextFm2', cdRegister);
 S.RegisterDelphiFunction(@PointLLH, 'PointLLH', cdRegister);
 S.RegisterDelphiFunction(@PointDD, 'PointDD', cdRegister);
 S.RegisterDelphiFunction(@PointDDH, 'PointDDH', cdRegister);
 S.RegisterDelphiFunction(@Point3D, 'Point3D', cdRegister);
 S.RegisterDelphiFunction(@MER, 'MER', cdRegister);
 S.RegisterDelphiFunction(@sIFE, 'sIFE', cdRegister);
 S.RegisterDelphiFunction(@StrToExtended, 'StrToExtended', cdRegister);
 S.RegisterDelphiFunction(@StrToExtendedDef, 'StrToExtendedDef', cdRegister);
 S.RegisterDelphiFunction(@PointOnLine, 'PointOnLine', cdRegister);
 S.RegisterDelphiFunction(@PointLLinMER, 'PointLLinMER', cdRegister);
 S.RegisterDelphiFunction(@MERinMER, 'MERinMER', cdRegister);
 S.RegisterDelphiFunction(@UnionMER, 'UnionMER', cdRegister);
 S.RegisterDelphiFunction(@IsEmptyMER, 'IsEmptyMER', cdRegister);
 S.RegisterDelphiFunction(@PointsToMER, 'PointsToMER', cdRegister);
 S.RegisterDelphiFunction(@PointsToRect, 'PointsToRect', cdRegister);
 S.RegisterDelphiFunction(@PointsDoubleToRect, 'PointsDoubleToRect', cdRegister);
 S.RegisterDelphiFunction(@EarthUnitsToStr, 'EarthUnitsToStr', cdRegister);
 S.RegisterDelphiFunction(@StrToEarthUnits, 'StrToEarthUnits', cdRegister);
 S.RegisterDelphiFunction(@LLAsString, 'LLAsString', cdRegister);
 S.RegisterDelphiFunction(@LLAsString2, 'LLAsString2', cdRegister);
 S.RegisterDelphiFunction(@DecimalToEarthUnits, 'DecimalToEarthUnits', cdRegister);
 S.RegisterDelphiFunction(@DecimalToPointLL, 'DecimalToPointLL', cdRegister);
 S.RegisterDelphiFunction(@EarthUnitsToDecimal, 'EarthUnitsToDecimal', cdRegister);
 S.RegisterDelphiFunction(@EarthUnitsTo, 'EarthUnitsTo', cdRegister);
 S.RegisterDelphiFunction(@EarthUnitsFrom, 'EarthUnitsFrom', cdRegister);
 S.RegisterDelphiFunction(@UnitsToStr, 'UnitsToStr', cdRegister);
 S.RegisterDelphiFunction(@StrToUnits, 'StrToUnits', cdRegister);
 S.RegisterDelphiFunction(@GetUnitsformatForLong, 'GetUnitsformatForLong', cdRegister);
 S.RegisterDelphiFunction(@GetUnitsformatForLat, 'GetUnitsformatForLat', cdRegister);
 S.RegisterDelphiFunction(@GetUnitsformatMaskForLong, 'GetUnitsformatMaskForLong', cdRegister);
 S.RegisterDelphiFunction(@GetUnitsformatMaskForLat, 'GetUnitsformatMaskForLat', cdRegister);
 S.RegisterDelphiFunction(@HeightUnitsTo, 'HeightUnitsTo', cdRegister);
 S.RegisterDelphiFunction(@HeightUnitsFrom, 'HeightUnitsFrom', cdRegister);
 S.RegisterDelphiFunction(@StrToHUnits, 'StrToHUnits', cdRegister);
 S.RegisterDelphiFunction(@HUnitsToStr, 'HUnitsToStr', cdRegister);
 S.RegisterDelphiFunction(@PointLLToV3D, 'PointLLToV3D', cdRegister);
 S.RegisterDelphiFunction(@V3DtoPointLL, 'V3DtoPointLL', cdRegister);
 S.RegisterDelphiFunction(@V3D, 'V3D', cdRegister);
 S.RegisterDelphiFunction(@V3DNormalize, 'V3DNormalize', cdRegister);
 S.RegisterDelphiFunction(@V3DCross, 'V3DCross', cdRegister);
 S.RegisterDelphiFunction(@V3DDot, 'V3DDot', cdRegister);
 S.RegisterDelphiFunction(@V3DAdd, 'V3DAdd', cdRegister);
 S.RegisterDelphiFunction(@V3DSub, 'V3DSub', cdRegister);
 S.RegisterDelphiFunction(@V3DMul, 'V3DMul', cdRegister);
 S.RegisterDelphiFunction(@V3DLerp, 'V3DLerp', cdRegister);
 S.RegisterDelphiFunction(@V3DMatrixMul, 'V3DMatrixMul', cdRegister);
 S.RegisterDelphiFunction(@PointLLMatrixMul, 'PointLLMatrixMul', cdRegister);
 S.RegisterDelphiFunction(@Quat, 'Quat', cdRegister);
 S.RegisterDelphiFunction(@QuatNormalize, 'QuatNormalize', cdRegister);
 S.RegisterDelphiFunction(@AxisAngleToQuat, 'AxisAngleToQuat', cdRegister);
 S.RegisterDelphiFunction(@EulerToQuat, 'EulerToQuat', cdRegister);
 S.RegisterDelphiFunction(@QuatDot, 'QuatDot', cdRegister);
 S.RegisterDelphiFunction(@QuatMul, 'QuatMul', cdRegister);
 S.RegisterDelphiFunction(@VectorsToQuat, 'VectorsToQuat', cdRegister);
 S.RegisterDelphiFunction(@QuatSlerp, 'QuatSlerp', cdRegister);
 S.RegisterDelphiFunction(@QuatToAxisAngle, 'QuatToAxisAngle', cdRegister);
 S.RegisterDelphiFunction(@QuatToMatrix, 'QuatToMatrix', cdRegister);
 S.RegisterDelphiFunction(@TransposeMatrix, 'TransposeMatrix', cdRegister);
 S.RegisterDelphiFunction(@ScaleMatrix, 'ScaleMatrix', cdRegister);
 S.RegisterDelphiFunction(@SphericalMod, 'SphericalMod', cdRegister);
 S.RegisterDelphiFunction(@Sign, 'Sign', cdRegister);
 S.RegisterDelphiFunction(@LimitFloat, 'LimitFloat', cdRegister);
 S.RegisterDelphiFunction(@AngleToRadians, 'AngleToRadians', cdRegister);
 S.RegisterDelphiFunction(@RadiansToAngle, 'RadiansToAngle', cdRegister);
 S.RegisterDelphiFunction(@Cross180, 'Cross180', cdRegister);
 S.RegisterDelphiFunction(@Mod180, 'Mod180', cdRegister);
 S.RegisterDelphiFunction(@Mod180Float, 'Mod180Float', cdRegister);
 S.RegisterDelphiFunction(@MulDivFloat, 'MulDivFloat', cdRegister);
 S.RegisterDelphiFunction(@LongDiff, 'LongDiff', cdRegister);
 S.RegisterDelphiFunction(@Bmp_AssignFromPersistent, 'Bmp_AssignFromPersistent', cdRegister);
 S.RegisterDelphiFunction(@Bmp_CreateFromPersistent, 'Bmp_CreateFromPersistent', cdRegister);
 S.RegisterDelphiFunction(@FixFilePath, 'FixFilePath', cdRegister);
 S.RegisterDelphiFunction(@UnFixFilePath, 'UnFixFilePath', cdRegister);
 S.RegisterDelphiFunction(@FillStringList, 'FillStringList', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TTextureData(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TTextureData) do
  begin
    RegisterConstructor(@TTextureData.Create, 'Create');
    RegisterMethod(@TTextureData.LoadFromStream, 'LoadFromStream');
    RegisterMethod(@TTextureData.LoadFromFile, 'LoadFromFile');
    RegisterMethod(@TTextureData.MapPoint, 'MapPoint');
    RegisterMethod(@TTextureData.Delete, 'Delete');
    RegisterMethod(@TTextureData.IsTextureOK, 'IsTextureOK');
    RegisterMethod(@TTextureData.LLToTextureXY, 'LLToTextureXY');
    RegisterMethod(@TTextureData.TextureXYToLL, 'TextureXYToLL');
    RegisterPropertyHelper(@TTextureDataTextureStream_R,nil,'TextureStream');
    RegisterPropertyHelper(@TTextureDataTransparentColor_R,@TTextureDataTransparentColor_W,'TransparentColor');
    RegisterPropertyHelper(@TTextureDataWidth_R,nil,'Width');
    RegisterPropertyHelper(@TTextureDataHeight_R,nil,'Height');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TGroupsStore(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TGroupsStore) do
  begin
    RegisterConstructor(@TGroupsStore.Create, 'Create');
    RegisterMethod(@TGroupsStore.Insert, 'Insert');
    RegisterMethod(@TGroupsStore.Delete, 'Delete');
    RegisterMethod(@TGroupsStore.Add, 'Add');
    RegisterMethod(@TGroupsStore.AddNew, 'AddNew');
    RegisterMethod(@TGroupsStore.Clear, 'Clear');
    RegisterMethod(@TGroupsStore.Move, 'Move');
    RegisterMethod(@TGroupsStore.Clone, 'Clone');
    RegisterMethod(@TGroupsStore.Centroid, 'Centroid');
    RegisterMethod(@TGroupsStore.GroupStoreMER, 'GroupStoreMER');
    RegisterPropertyHelper(@TGroupsStoreGroup_R,@TGroupsStoreGroup_W,'Group');
    RegisterPropertyHelper(@TGroupsStoreCount_R,@TGroupsStoreCount_W,'Count');
    RegisterPropertyHelper(@TGroupsStoreStoreHeight_R,@TGroupsStoreStoreHeight_W,'StoreHeight');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TPointStore(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TPointStore) do
  begin
    RegisterPropertyHelper(@TPointStoreFlags_R,@TPointStoreFlags_W,'Flags');
    RegisterMethod(@TPointStore.ObjectInstanceSize, 'ObjectInstanceSize');
    RegisterMethod(@TPointStore.Insert, 'Insert');
    RegisterMethod(@TPointStore.Delete, 'Delete');
    RegisterMethod(@TPointStore.Clear, 'Clear');
    RegisterMethod(@TPointStore.Add, 'Add');
    RegisterMethod(@TPointStore.PointStoreMER, 'PointStoreMER');
    RegisterMethod(@TPointStore.Clone, 'Clone');
    RegisterMethod(@TPointStore.Move, 'Move');
    RegisterMethod(@TPointStore.PointInPolygon, 'PointInPolygon');
    RegisterMethod(@TPointStore.PointOnPolyline, 'PointOnPolyline');
    RegisterMethod(@TPointStore.Centroid, 'Centroid');
    RegisterMethod(@TPointStore.Translate, 'Translate');
    RegisterMethod(@TPointStore.Refresh, 'Refresh');
    RegisterMethod(@TPointStore.Point3DArray, 'Point3DArray');
    RegisterPropertyHelper(@TPointStoreAsDD_R,@TPointStoreAsDD_W,'AsDD');
    RegisterPropertyHelper(@TPointStoreAsLL_R,@TPointStoreAsLL_W,'AsLL');
    RegisterPropertyHelper(@TPointStoreAs3D_R,nil,'As3D');
    RegisterPropertyHelper(@TPointStoreCount_R,@TPointStoreCount_W,'Count');
    RegisterPropertyHelper(@TPointStoreStoreHeight_R,@TPointStoreStoreHeight_W,'StoreHeight');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_TEarthRoot(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(TEarthRoot) do
  begin
    RegisterVirtualMethod(@TEarthRoot.PrintableClassName, 'PrintableClassName');
    RegisterVirtualMethod(@TEarthRoot.RedrawObject, 'RedrawObject');
    RegisterMethod(@TEarthRoot.BeginUpdate, 'BeginUpdate');
    RegisterMethod(@TEarthRoot.EndUpdate, 'EndUpdate');
  end;
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_GIS_SysUtils(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(EEarthException) do
  RIRegister_TEarthRoot(CL);
  with CL.Add(TGroupsStore) do
  RIRegister_TPointStore(CL);
  RIRegister_TGroupsStore(CL);
  RIRegister_TTextureData(CL);
end;

 
 
{ TPSImport_GIS_SysUtils }
(*----------------------------------------------------------------------------*)
procedure TPSImport_GIS_SysUtils.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_GIS_SysUtils(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_GIS_SysUtils.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_GIS_SysUtils(ri);
  RIRegister_GIS_SysUtils_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.