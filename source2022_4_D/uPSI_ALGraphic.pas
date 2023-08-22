unit uPSI_ALGraphic;
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
  TPSImport_ALGraphic = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_ALGraphic(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_ALGraphic_Routines(S: TPSExec);

procedure Register;

implementation


uses
   Windows
  ,Graphics
  ,ALGraphic
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_ALGraphic]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_ALGraphic(CL: TPSPascalCompiler);
begin
  CL.AddTypeS('NativeInt', 'Integer');
  CL.AddTypeS('NativeUInt', 'Cardinal');
  CL.AddTypeS('TALResamplingFilter', '( sfBox, sfTriangle, sfHermite, sfBell, sfSpline, sfLanczos3, sfMitchell )');
 CL.AddDelphiFunction('Procedure ALStretch( NewWidth, NewHeight : Cardinal; Filter : TALResamplingFilter; Radius : Single; Source, Target : TBitmap);');
 CL.AddDelphiFunction('Procedure ALStretch1( NewWidth, NewHeight : Cardinal; Filter : TALResamplingFilter; Radius : Single; Source : TBitmap);');
 CL.AddDelphiFunction('Procedure ALStrecth2( Source, Target : TBitmap; filter : TALResamplingFilter; Radius : single);');
 CL.AddDelphiFunction('Procedure ALReplaceColor( SrcBitmap : TBitmap; OldColor, NewColor : Tcolor; Tolerance : Integer)');
  CL.AddTypeS('TALAverageColorMosaicKey', 'array of array of Tcolor');
 CL.AddDelphiFunction('Function AlGetAverageColor( aSrcBmp : TBitmap; aRect : Trect) : Tcolor');
 CL.AddDelphiFunction('Function AlGetAverageColorMosaicKey( aSrcBmp : TBitmap; aDestCanvas : Tcanvas; const aMosaicInGrayScale : Boolean; const aMosaicSquareWidth : integer; const aMosaicSquareHeight : integer) : TALAverageColorMosaicKey;');
 CL.AddDelphiFunction('Function AlGetAverageColorMosaicKey1( aSrcBmp : TBitmap) : TALAverageColorMosaicKey;');
 CL.AddDelphiFunction('Procedure AlTrimImage( aSrcBmp : TBitmap; const aTolerance : Integer)');
 CL.AddDelphiFunction('Procedure AlCropImage( aSrcBmp : TBitmap; aCropRect : Trect)');
 CL.AddDelphiFunction('Procedure ALRotateBMP90( aSrcBmp : TBitmap; aDestBmp : Tbitmap)');
 CL.AddDelphiFunction('Procedure ALRotateBMP180( aSrcBmp : TBitmap; aDestBmp : Tbitmap)');
 CL.AddDelphiFunction('Procedure ALRotateBMP270( aSrcBmp : TBitmap; aDestBmp : Tbitmap)');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
Function AlGetAverageColorMosaicKey1_P( aSrcBmp : TBitmap) : TALAverageColorMosaicKey;
Begin Result := ALGraphic.AlGetAverageColorMosaicKey(aSrcBmp); END;

(*----------------------------------------------------------------------------*)
Function AlGetAverageColorMosaicKey_P( aSrcBmp : TBitmap; aDestCanvas : Tcanvas; const aMosaicInGrayScale : Boolean; const aMosaicSquareWidth : integer; const aMosaicSquareHeight : integer) : TALAverageColorMosaicKey;
Begin Result := ALGraphic.AlGetAverageColorMosaicKey(aSrcBmp, aDestCanvas, aMosaicInGrayScale, aMosaicSquareWidth, aMosaicSquareHeight); END;

(*----------------------------------------------------------------------------*)
Procedure ALStrecth2_P( Source, Target : TBitmap; filter : TALResamplingFilter; Radius : single);
Begin ALGraphic.ALStrecth(Source, Target, filter, Radius); END;

(*----------------------------------------------------------------------------*)
Procedure ALStretch1_P( NewWidth, NewHeight : Cardinal; Filter : TALResamplingFilter; Radius : Single; Source : TBitmap);
Begin ALGraphic.ALStretch(NewWidth, NewHeight, Filter, Radius, Source); END;

(*----------------------------------------------------------------------------*)
Procedure ALStretch_P( NewWidth, NewHeight : Cardinal; Filter : TALResamplingFilter; Radius : Single; Source, Target : TBitmap);
Begin ALGraphic.ALStretch(NewWidth, NewHeight, Filter, Radius, Source, Target); END;

(*----------------------------------------------------------------------------*)
procedure RIRegister_ALGraphic_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@ALStretch_P, 'ALStretch', cdRegister);
 S.RegisterDelphiFunction(@ALStretch1_P, 'ALStretch1', cdRegister);
 S.RegisterDelphiFunction(@ALStrecth2_P, 'ALStrecth2', cdRegister);
 S.RegisterDelphiFunction(@ALReplaceColor, 'ALReplaceColor', cdRegister);
 S.RegisterDelphiFunction(@AlGetAverageColor, 'AlGetAverageColor', cdRegister);
 S.RegisterDelphiFunction(@AlGetAverageColorMosaicKey_P, 'AlGetAverageColorMosaicKey', cdRegister);
 S.RegisterDelphiFunction(@AlGetAverageColorMosaicKey1_P, 'AlGetAverageColorMosaicKey1', cdRegister);
 S.RegisterDelphiFunction(@AlTrimImage, 'AlTrimImage', cdRegister);
 S.RegisterDelphiFunction(@AlCropImage, 'AlCropImage', cdRegister);
 S.RegisterDelphiFunction(@ALRotateBMP90, 'ALRotateBMP90', cdRegister);
 S.RegisterDelphiFunction(@ALRotateBMP180, 'ALRotateBMP180', cdRegister);
 S.RegisterDelphiFunction(@ALRotateBMP270, 'ALRotateBMP270', cdRegister);
end;

 
 
{ TPSImport_ALGraphic }
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALGraphic.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_ALGraphic(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_ALGraphic.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  //RIRegister_ALGraphic(ri);
  RIRegister_ALGraphic_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
