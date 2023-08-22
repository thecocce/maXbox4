unit uPSI_Dlgs;
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
  TPSImport_Dlgs = class(TPSPlugin)
  protected
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_Dlgs(CL: TPSPascalCompiler);

{ run-time registration functions }

procedure Register;

implementation


uses
   Dlgs
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_Dlgs]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_Dlgs(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('ctlFirst','LongWord').SetUInt( $0400);
 CL.AddConstantN('ctlLast','LongWord').SetUInt( $04ff);
 CL.AddConstantN('psh1','LongWord').SetUInt( $0400);
 CL.AddConstantN('psh2','LongWord').SetUInt( $0401);
 CL.AddConstantN('psh3','LongWord').SetUInt( $0402);
 CL.AddConstantN('psh4','LongWord').SetUInt( $0403);
 CL.AddConstantN('psh5','LongWord').SetUInt( $0404);
 CL.AddConstantN('psh6','LongWord').SetUInt( $0405);
 CL.AddConstantN('psh7','LongWord').SetUInt( $0406);
 CL.AddConstantN('psh8','LongWord').SetUInt( $0407);
 CL.AddConstantN('psh9','LongWord').SetUInt( $0408);
 CL.AddConstantN('psh10','LongWord').SetUInt( $0409);
 CL.AddConstantN('psh11','LongWord').SetUInt( $040a);
 CL.AddConstantN('psh12','LongWord').SetUInt( $040b);
 CL.AddConstantN('psh13','LongWord').SetUInt( $040c);
 CL.AddConstantN('psh14','LongWord').SetUInt( $040d);
 CL.AddConstantN('psh15','LongWord').SetUInt( $040e);
 CL.AddConstantN('pshHelp','').SetString( psh15);
 CL.AddConstantN('psh16','LongWord').SetUInt( $040f);
 CL.AddConstantN('chx1','LongWord').SetUInt( $0410);
 CL.AddConstantN('chx2','LongWord').SetUInt( $0411);
 CL.AddConstantN('chx3','LongWord').SetUInt( $0412);
 CL.AddConstantN('chx4','LongWord').SetUInt( $0413);
 CL.AddConstantN('chx5','LongWord').SetUInt( $0414);
 CL.AddConstantN('chx6','LongWord').SetUInt( $0415);
 CL.AddConstantN('chx7','LongWord').SetUInt( $0416);
 CL.AddConstantN('chx8','LongWord').SetUInt( $0417);
 CL.AddConstantN('chx9','LongWord').SetUInt( $0418);
 CL.AddConstantN('chx10','LongWord').SetUInt( $0419);
 CL.AddConstantN('chx11','LongWord').SetUInt( $041a);
 CL.AddConstantN('chx12','LongWord').SetUInt( $041b);
 CL.AddConstantN('chx13','LongWord').SetUInt( $041c);
 CL.AddConstantN('chx14','LongWord').SetUInt( $041d);
 CL.AddConstantN('chx15','LongWord').SetUInt( $041e);
 CL.AddConstantN('chx16','LongWord').SetUInt( $041f);
 CL.AddConstantN('rad1','LongWord').SetUInt( $0420);
 CL.AddConstantN('rad2','LongWord').SetUInt( $0421);
 CL.AddConstantN('rad3','LongWord').SetUInt( $0422);
 CL.AddConstantN('rad4','LongWord').SetUInt( $0423);
 CL.AddConstantN('rad5','LongWord').SetUInt( $0424);
 CL.AddConstantN('rad6','LongWord').SetUInt( $0425);
 CL.AddConstantN('rad7','LongWord').SetUInt( $0426);
 CL.AddConstantN('rad8','LongWord').SetUInt( $0427);
 CL.AddConstantN('rad9','LongWord').SetUInt( $0428);
 CL.AddConstantN('rad10','LongWord').SetUInt( $0429);
 CL.AddConstantN('rad11','LongWord').SetUInt( $042a);
 CL.AddConstantN('rad12','LongWord').SetUInt( $042b);
 CL.AddConstantN('rad13','LongWord').SetUInt( $042c);
 CL.AddConstantN('rad14','LongWord').SetUInt( $042d);
 CL.AddConstantN('rad15','LongWord').SetUInt( $042e);
 CL.AddConstantN('rad16','LongWord').SetUInt( $042f);
 CL.AddConstantN('grp1','LongWord').SetUInt( $0430);
 CL.AddConstantN('grp2','LongWord').SetUInt( $0431);
 CL.AddConstantN('grp3','LongWord').SetUInt( $0432);
 CL.AddConstantN('grp4','LongWord').SetUInt( $0433);
 CL.AddConstantN('frm1','LongWord').SetUInt( $0434);
 CL.AddConstantN('frm2','LongWord').SetUInt( $0435);
 CL.AddConstantN('frm3','LongWord').SetUInt( $0436);
 CL.AddConstantN('frm4','LongWord').SetUInt( $0437);
 CL.AddConstantN('rct1','LongWord').SetUInt( $0438);
 CL.AddConstantN('rct2','LongWord').SetUInt( $0439);
 CL.AddConstantN('rct3','LongWord').SetUInt( $043a);
 CL.AddConstantN('rct4','LongWord').SetUInt( $043b);
 CL.AddConstantN('ico1','LongWord').SetUInt( $043c);
 CL.AddConstantN('ico2','LongWord').SetUInt( $043d);
 CL.AddConstantN('ico3','LongWord').SetUInt( $043e);
 CL.AddConstantN('ico4','LongWord').SetUInt( $043f);
 CL.AddConstantN('stc1','LongWord').SetUInt( $0440);
 CL.AddConstantN('stc2','LongWord').SetUInt( $0441);
 CL.AddConstantN('stc3','LongWord').SetUInt( $0442);
 CL.AddConstantN('stc4','LongWord').SetUInt( $0443);
 CL.AddConstantN('stc5','LongWord').SetUInt( $0444);
 CL.AddConstantN('stc6','LongWord').SetUInt( $0445);
 CL.AddConstantN('stc7','LongWord').SetUInt( $0446);
 CL.AddConstantN('stc8','LongWord').SetUInt( $0447);
 CL.AddConstantN('stc9','LongWord').SetUInt( $0448);
 CL.AddConstantN('stc10','LongWord').SetUInt( $0449);
 CL.AddConstantN('stc11','LongWord').SetUInt( $044a);
 CL.AddConstantN('stc12','LongWord').SetUInt( $044b);
 CL.AddConstantN('stc13','LongWord').SetUInt( $044c);
 CL.AddConstantN('stc14','LongWord').SetUInt( $044d);
 CL.AddConstantN('stc15','LongWord').SetUInt( $044e);
 CL.AddConstantN('stc16','LongWord').SetUInt( $044f);
 CL.AddConstantN('stc17','LongWord').SetUInt( $0450);
 CL.AddConstantN('stc18','LongWord').SetUInt( $0451);
 CL.AddConstantN('stc19','LongWord').SetUInt( $0452);
 CL.AddConstantN('stc20','LongWord').SetUInt( $0453);
 CL.AddConstantN('stc21','LongWord').SetUInt( $0454);
 CL.AddConstantN('stc22','LongWord').SetUInt( $0455);
 CL.AddConstantN('stc23','LongWord').SetUInt( $0456);
 CL.AddConstantN('stc24','LongWord').SetUInt( $0457);
 CL.AddConstantN('stc25','LongWord').SetUInt( $0458);
 CL.AddConstantN('stc26','LongWord').SetUInt( $0459);
 CL.AddConstantN('stc27','LongWord').SetUInt( $045a);
 CL.AddConstantN('stc28','LongWord').SetUInt( $045b);
 CL.AddConstantN('stc29','LongWord').SetUInt( $045c);
 CL.AddConstantN('stc30','LongWord').SetUInt( $045d);
 CL.AddConstantN('stc31','LongWord').SetUInt( $045e);
 CL.AddConstantN('stc32','LongWord').SetUInt( $045f);
 CL.AddConstantN('lst1','LongWord').SetUInt( $0460);
 CL.AddConstantN('lst2','LongWord').SetUInt( $0461);
 CL.AddConstantN('lst3','LongWord').SetUInt( $0462);
 CL.AddConstantN('lst4','LongWord').SetUInt( $0463);
 CL.AddConstantN('lst5','LongWord').SetUInt( $0464);
 CL.AddConstantN('lst6','LongWord').SetUInt( $0465);
 CL.AddConstantN('lst7','LongWord').SetUInt( $0466);
 CL.AddConstantN('lst8','LongWord').SetUInt( $0467);
 CL.AddConstantN('lst9','LongWord').SetUInt( $0468);
 CL.AddConstantN('lst10','LongWord').SetUInt( $0469);
 CL.AddConstantN('lst11','LongWord').SetUInt( $046a);
 CL.AddConstantN('lst12','LongWord').SetUInt( $046b);
 CL.AddConstantN('lst13','LongWord').SetUInt( $046c);
 CL.AddConstantN('lst14','LongWord').SetUInt( $046d);
 CL.AddConstantN('lst15','LongWord').SetUInt( $046e);
 CL.AddConstantN('lst16','LongWord').SetUInt( $046f);
 CL.AddConstantN('cmb1','LongWord').SetUInt( $0470);
 CL.AddConstantN('cmb2','LongWord').SetUInt( $0471);
 CL.AddConstantN('cmb3','LongWord').SetUInt( $0472);
 CL.AddConstantN('cmb4','LongWord').SetUInt( $0473);
 CL.AddConstantN('cmb5','LongWord').SetUInt( $0474);
 CL.AddConstantN('cmb6','LongWord').SetUInt( $0475);
 CL.AddConstantN('cmb7','LongWord').SetUInt( $0476);
 CL.AddConstantN('cmb8','LongWord').SetUInt( $0477);
 CL.AddConstantN('cmb9','LongWord').SetUInt( $0478);
 CL.AddConstantN('cmb10','LongWord').SetUInt( $0479);
 CL.AddConstantN('cmb11','LongWord').SetUInt( $047a);
 CL.AddConstantN('cmb12','LongWord').SetUInt( $047b);
 CL.AddConstantN('cmb13','LongWord').SetUInt( $047c);
 CL.AddConstantN('cmb14','LongWord').SetUInt( $047d);
 CL.AddConstantN('cmb15','LongWord').SetUInt( $047e);
 CL.AddConstantN('cmb16','LongWord').SetUInt( $047f);
 CL.AddConstantN('edt1','LongWord').SetUInt( $0480);
 CL.AddConstantN('edt2','LongWord').SetUInt( $0481);
 CL.AddConstantN('edt3','LongWord').SetUInt( $0482);
 CL.AddConstantN('edt4','LongWord').SetUInt( $0483);
 CL.AddConstantN('edt5','LongWord').SetUInt( $0484);
 CL.AddConstantN('edt6','LongWord').SetUInt( $0485);
 CL.AddConstantN('edt7','LongWord').SetUInt( $0486);
 CL.AddConstantN('edt8','LongWord').SetUInt( $0487);
 CL.AddConstantN('edt9','LongWord').SetUInt( $0488);
 CL.AddConstantN('edt10','LongWord').SetUInt( $0489);
 CL.AddConstantN('edt11','LongWord').SetUInt( $048a);
 CL.AddConstantN('edt12','LongWord').SetUInt( $048b);
 CL.AddConstantN('edt13','LongWord').SetUInt( $048c);
 CL.AddConstantN('edt14','LongWord').SetUInt( $048d);
 CL.AddConstantN('edt15','LongWord').SetUInt( $048e);
 CL.AddConstantN('edt16','LongWord').SetUInt( $048f);
 CL.AddConstantN('scr1','LongWord').SetUInt( $0490);
 CL.AddConstantN('scr2','LongWord').SetUInt( $0491);
 CL.AddConstantN('scr3','LongWord').SetUInt( $0492);
 CL.AddConstantN('scr4','LongWord').SetUInt( $0493);
 CL.AddConstantN('scr5','LongWord').SetUInt( $0494);
 CL.AddConstantN('scr6','LongWord').SetUInt( $0495);
 CL.AddConstantN('scr7','LongWord').SetUInt( $0496);
 CL.AddConstantN('scr8','LongWord').SetUInt( $0497);
 CL.AddConstantN('FILEOPENORD','LongInt').SetInt( 1536);
 CL.AddConstantN('MULTIFILEOPENORD','LongInt').SetInt( 1537);
 CL.AddConstantN('PRINTDLGORD','LongInt').SetInt( 1538);
 CL.AddConstantN('PRNSETUPDLGORD','LongInt').SetInt( 1539);
 CL.AddConstantN('FINDDLGORD','LongInt').SetInt( 1540);
 CL.AddConstantN('REPLACEDLGORD','LongInt').SetInt( 1541);
 CL.AddConstantN('FONTDLGORD','LongInt').SetInt( 1542);
 CL.AddConstantN('FORMATDLGORD31','LongInt').SetInt( 1543);
 CL.AddConstantN('FORMATDLGORD30','LongInt').SetInt( 1544);
 CL.AddConstantN('PAGESETUPDLGORD','LongInt').SetInt( 1546);
 CL.AddConstantN('NEWFILEOPENORD','LongInt').SetInt( 1547);
  CL.AddTypeS('tagCRGB', 'record bRed : BYTE; bGreen : BYTE; bBlue : BYTE; bExt'
   +'ra : BYTE; end');
  CL.AddTypeS('CRGB', 'tagCRGB');
end;

(* === run-time registration functions === *)
 
 
{ TPSImport_Dlgs }
(*----------------------------------------------------------------------------*)
procedure TPSImport_Dlgs.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_Dlgs(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_Dlgs.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_Dlgs(ri);
end;
(*----------------------------------------------------------------------------*)
 
 
end.
