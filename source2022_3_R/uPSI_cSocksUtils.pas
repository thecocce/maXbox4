unit uPSI_cSocksUtils;
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
  TPSImport_cSocksUtils = class(TPSPlugin)
  public
    procedure CompileImport1(CompExec: TPSScript); override;
    procedure ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter); override;
  end;
 
 
{ compile-time registration functions }
procedure SIRegister_cSocksUtils(CL: TPSPascalCompiler);

{ run-time registration functions }
procedure RIRegister_cSocksUtils_Routines(S: TPSExec);
procedure RIRegister_cSocksUtils(CL: TPSRuntimeClassImporter);

procedure Register;

implementation


uses
   cSocketLib
  ,cSocksUtils
  ;
 
 
procedure Register;
begin
  RegisterComponents('Pascal Script', [TPSImport_cSocksUtils]);
end;

(* === compile-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure SIRegister_cSocksUtils(CL: TPSPascalCompiler);
begin
 CL.AddConstantN('SOCKS_DEFAULTPORT','LongInt').SetInt( 1080);
 CL.AddConstantN('SOCKS_DEFAULTPORT_STR','String').SetString( '1080');
  CL.AddClassN(CL.FindClass('TOBJECT'),'ESocks');
 CL.AddConstantN('SOCKS4_MSG_VERSION','LongInt').SetInt( 4);
 CL.AddConstantN('SOCKS4_REQ_CODE_CONNECT','LongInt').SetInt( 1);
 CL.AddConstantN('SOCKS4_REQ_CODE_BIND','LongInt').SetInt( 2);
 CL.AddConstantN('SOCKS4_RESP_CODE_GRANTED','LongInt').SetInt( 90);
 CL.AddConstantN('SOCKS4_RESP_CODE_FAILED','LongInt').SetInt( 91);
 CL.AddConstantN('SOCKS4_RESP_CODE_NO_IDENTD','LongInt').SetInt( 92);
 CL.AddConstantN('SOCKS4_RESP_CODE_IDENTD_MISMATCH','LongInt').SetInt( 93);
 CL.AddDelphiFunction('Function Socks4ErrorDescription( const Code : Integer) : String');
  CL.AddTypeS('TSocks4Message', 'record Version : Byte; Code : Byte; DestPort :'
   +' Word; DestIP : LongWord; end');
  CL.AddTypeS('PSocks4Message', '^TSocks4Message // will not work');
 CL.AddDelphiFunction('Procedure PopulateSocks4Message( var Msg : TSocks4Message; const Code : Byte; const IP : TIP4Addr; const Port : Word)');
 CL.AddDelphiFunction('Function Socks4Request( const Code : Byte; const IP : TIP4Addr; const Port : Word; const UserID : AnsiString) : AnsiString');
 CL.AddDelphiFunction('Function Socks4ConnectRequest( const IP : TIP4Addr; const Port : Word; const UserID : AnsiString) : AnsiString');
 CL.AddDelphiFunction('Function Socks4BindRequest( const IP : TIP4Addr; const Port : Word; const UserID : AnsiString) : AnsiString');
 CL.AddDelphiFunction('Function Socks4aRequest( const Code : Byte; const Domain : AnsiString; const Port : Word; const UserID : AnsiString) : AnsiString');
 CL.AddDelphiFunction('Function Socks4aConnectRequest( const Domain : AnsiString; const Port : Word; const UserID : AnsiString) : AnsiString');
 CL.AddDelphiFunction('Procedure PopulateSocks4ErrorResponse( var Msg : TSocks4Message; const Code : Byte)');
 CL.AddDelphiFunction('Function IsGrantedSocks4ResponseCode( const Code : Byte) : Boolean');
 CL.AddConstantN('SOCKS5_MSG_VERSION','LongInt').SetInt( 5);
  CL.AddTypeS('TSocks5Greeting', 'record Version : Byte; Methods : Byte; Method'
   +'1 : Byte; end');
  CL.AddTypeS('PSocks5Greeting', '^TSocks5Greeting // will not work');
 CL.AddConstantN('SOCKS5_METHOD_NOAUTH','LongInt').SetInt( 0);
 CL.AddConstantN('SOCKS5_METHOD_GSSAPI','LongInt').SetInt( 1);
 CL.AddConstantN('SOCKS5_METHOD_USERPASS','LongInt').SetInt( 2);
 CL.AddConstantN('SOCKS5_METHOD_RESERVED0','LongInt').SetInt( 3);
 CL.AddConstantN('SOCKS5_METHOD_PRIVATE0','LongWord').SetUInt( $80);
 CL.AddConstantN('SOCKS5_METHOD_INVALID','LongWord').SetUInt( $FF);
 CL.AddDelphiFunction('Procedure PopulateSocks5Greeting( var Greeting : TSocks5Greeting; const Method : Byte)');
 CL.AddDelphiFunction('Procedure PopulateSocks5GreetingNoAuth( var Greeting : TSocks5Greeting)');
 CL.AddDelphiFunction('Procedure PopulateSocks5GreetingUserPass( var Greeting : TSocks5Greeting)');
  CL.AddTypeS('TSocks5GreetingResponse', 'record Version : Byte; Method : Byte;'
   +' end');
  CL.AddTypeS('PSocks5GreetingResponse', '^TSocks5GreetingResponse // will not '
   +'work');
 CL.AddDelphiFunction('Procedure PopulateSocks5GreetingResponse( var Response : TSocks5GreetingResponse; const Method : Byte)');
 CL.AddDelphiFunction('Function Socks5GreetingResponse( const Method : Byte) : AnsiString');
 CL.AddConstantN('SOCKS5_USERPASS_VERSION','LongInt').SetInt( 1);
 CL.AddConstantN('SOCKS5_USERPASS_MAX_MSG_SIZE','LongInt').SetInt( 513);
 CL.AddConstantN('SOCKS5_USERPASS_STATUS_OK','LongInt').SetInt( 0);
 CL.AddConstantN('SOCKS5_USERPASS_STATUS_FAIL','LongInt').SetInt( 1);
 CL.AddDelphiFunction('Function Socks5UserPassMessage( const Username, Password : AnsiString) : AnsiString');
  CL.AddTypeS('TSocks5UserPassResponse', 'record Version : Byte; Status : Byte;'
   +' end');
  CL.AddTypeS('PSocks5UserPassResponse', '^TSocks5UserPassResponse // will not '
   +'work');
 CL.AddDelphiFunction('Procedure PopulateSocks5UserPassResponse( var Response : TSocks5UserPassResponse; const Status : Byte)');
 CL.AddConstantN('SOCKS5_REQ_CODE_CONNECT','LongInt').SetInt( 1);
 CL.AddConstantN('SOCKS5_REQ_CODE_BIND','LongInt').SetInt( 2);
 CL.AddConstantN('SOCKS5_REQ_CODE_UDP_ASSOCIATE','LongInt').SetInt( 3);
 CL.AddConstantN('SOCKS5_RESP_CODE_Success','LongInt').SetInt( 0);
 CL.AddConstantN('SOCKS5_RESP_CODE_GeneralServerFailure','LongInt').SetInt( 1);
 CL.AddConstantN('SOCKS5_RESP_CODE_ConnectionNotAllowed','LongInt').SetInt( 2);
 CL.AddConstantN('SOCKS5_RESP_CODE_NetworkUnreachable','LongInt').SetInt( 3);
 CL.AddConstantN('SOCKS5_RESP_CODE_HostUnreachable','LongInt').SetInt( 4);
 CL.AddConstantN('SOCKS5_RESP_CODE_ConnectionRefused','LongInt').SetInt( 5);
 CL.AddConstantN('SOCKS5_RESP_CODE_TTLExpired','LongInt').SetInt( 6);
 CL.AddConstantN('SOCKS5_RESP_CODE_CommandNotSupported','LongInt').SetInt( 7);
 CL.AddConstantN('SOCKS5_RESP_CODE_AddressTypeNotSupported','LongInt').SetInt( 8);
 CL.AddConstantN('SOCKS5_ADDR_TYPE_IP4','LongInt').SetInt( 1);
 CL.AddConstantN('SOCKS5_ADDR_TYPE_DOMAIN','LongInt').SetInt( 3);
 CL.AddConstantN('SOCKS5_ADDR_TYPE_IP6','LongInt').SetInt( 4);
 CL.AddConstantN('SOCKS5_ADDRMSG_MAX_MSG_SIZE','LongInt').SetInt( 296);
 CL.AddDelphiFunction('Function Socks5ErrorDescription( const Code : Integer) : String');
  CL.AddTypeS('TSocks5IP4Message', 'record Version : Byte; Code : Byte; Reserve'
   +'d : Byte; AddrType : Byte; IP4Addr : TIP4Addr; Port : Word; end');
  CL.AddTypeS('PSocks5IP4Message', '^TSocks5IP4Message // will not work');
 CL.AddDelphiFunction('Procedure PopulateSocks5IP4Message( var Msg : TSocks5IP4Message; const Command : Byte; const Addr : TIP4Addr; const NetPort : Word)');
 CL.AddDelphiFunction('Procedure PopulateSocks5IP4ErrorReply( var Msg : TSocks5IP4Message; const ResponseCode : Byte)');
  CL.AddTypeS('TSocks5IP6Message', 'record Version : Byte; Code : Byte; Reserve'
   +'d : Byte; AddrType : Byte; IP6Addr : TIP6Addr; Port : Word; end');
  CL.AddTypeS('PSocks5IP6Message', '^TSocks5IP6Message // will not work');
 CL.AddDelphiFunction('Procedure PopulateSocks5IP6Message( var Msg : TSocks5IP6Message; const Command : Byte; const Addr : TIP6Addr; const NetPort : Word)');
 CL.AddDelphiFunction('Procedure PopulateSocks5IP6ErrorReply( var Msg : TSocks5IP6Message; const ResponseCode : Byte)');
  CL.AddTypeS('TSocks5DomainMessageHeader', 'record Version : Byte; Code : Byte'
   +'; Reserved : Byte; AddrType : Byte; NameLen : Byte; end');
  CL.AddTypeS('PSocks5DomainMessageHeader', '^TSocks5DomainMessageHeader // wil'
   +'l not work');
 CL.AddDelphiFunction('Procedure PopulateSocks5DomainMessageHeader( var MsgHdr : TSocks5DomainMessageHeader; const Command : Byte; const Domain : AnsiString)');
 CL.AddDelphiFunction('Function Socks5DomainRequest( const Command : Byte; const Domain : AnsiString; const NetPort : Word) : AnsiString');
  CL.AddTypeS('TSocks5ResponseHeader', 'record Version : Byte; Code : Byte; Res'
   +'erved : Byte; AddrType : Byte; Addr1 : Byte; end');
  CL.AddTypeS('PSocks5ResponseHeader', '^TSocks5ResponseHeader // will not work');
 CL.AddDelphiFunction('Function Socks5ResponseSize( const Header : PSocks5ResponseHeader) : Integer');
 CL.AddConstantN('SOCKS5_MAX_MSG_SIZE','socks5size').SetString( SOCKS5_USERPASS_MAX_MSG_SIZE);
 CL.AddDelphiFunction('Procedure SelfTest');
end;

(* === run-time registration functions === *)
(*----------------------------------------------------------------------------*)
procedure RIRegister_cSocksUtils_Routines(S: TPSExec);
begin
 S.RegisterDelphiFunction(@Socks4ErrorDescription, 'Socks4ErrorDescription', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks4Message, 'PopulateSocks4Message', cdRegister);
 S.RegisterDelphiFunction(@Socks4Request, 'Socks4Request', cdRegister);
 S.RegisterDelphiFunction(@Socks4ConnectRequest, 'Socks4ConnectRequest', cdRegister);
 S.RegisterDelphiFunction(@Socks4BindRequest, 'Socks4BindRequest', cdRegister);
 S.RegisterDelphiFunction(@Socks4aRequest, 'Socks4aRequest', cdRegister);
 S.RegisterDelphiFunction(@Socks4aConnectRequest, 'Socks4aConnectRequest', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks4ErrorResponse, 'PopulateSocks4ErrorResponse', cdRegister);
 S.RegisterDelphiFunction(@IsGrantedSocks4ResponseCode, 'IsGrantedSocks4ResponseCode', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5Greeting, 'PopulateSocks5Greeting', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5GreetingNoAuth, 'PopulateSocks5GreetingNoAuth', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5GreetingUserPass, 'PopulateSocks5GreetingUserPass', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5GreetingResponse, 'PopulateSocks5GreetingResponse', cdRegister);
 S.RegisterDelphiFunction(@Socks5GreetingResponse, 'Socks5GreetingResponse', cdRegister);
 S.RegisterDelphiFunction(@Socks5UserPassMessage, 'Socks5UserPassMessage', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5UserPassResponse, 'PopulateSocks5UserPassResponse', cdRegister);
 S.RegisterDelphiFunction(@Socks5ErrorDescription, 'Socks5ErrorDescription', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5IP4Message, 'PopulateSocks5IP4Message', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5IP4ErrorReply, 'PopulateSocks5IP4ErrorReply', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5IP6Message, 'PopulateSocks5IP6Message', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5IP6ErrorReply, 'PopulateSocks5IP6ErrorReply', cdRegister);
 S.RegisterDelphiFunction(@PopulateSocks5DomainMessageHeader, 'PopulateSocks5DomainMessageHeader', cdRegister);
 S.RegisterDelphiFunction(@Socks5DomainRequest, 'Socks5DomainRequest', cdRegister);
 S.RegisterDelphiFunction(@Socks5ResponseSize, 'Socks5ResponseSize', cdRegister);
 S.RegisterDelphiFunction(@SelfTest, 'SelfTest', cdRegister);
end;

(*----------------------------------------------------------------------------*)
procedure RIRegister_cSocksUtils(CL: TPSRuntimeClassImporter);
begin
  with CL.Add(ESocks) do
end;

 
 
{ TPSImport_cSocksUtils }
(*----------------------------------------------------------------------------*)
procedure TPSImport_cSocksUtils.CompileImport1(CompExec: TPSScript);
begin
  SIRegister_cSocksUtils(CompExec.Comp);
end;
(*----------------------------------------------------------------------------*)
procedure TPSImport_cSocksUtils.ExecImport1(CompExec: TPSScript; const ri: TPSRuntimeClassImporter);
begin
  RIRegister_cSocksUtils(ri);
  RIRegister_cSocksUtils_Routines(CompExec.Exec); // comment it if no routines
end;
(*----------------------------------------------------------------------------*)
 
 
end.
