
/////////////////////////////////////////////////////////
//                                                     //
//              Bold for Delphi                        //
//    Copyright (c) 1996-2002 Boldsoft AB              //
//              (c) 2002-2005 Borland Software Corp    //
//                                                     //
/////////////////////////////////////////////////////////


unit BoldPropagatorConstants;

interface

uses
  messages,
  SysUtils,
  BoldDefs;

const
  BM_PRIORITY_CHANGED = WM_USER + 1;
  BM_THRD_DOWORK = WM_USER + 2;
  BM_THRD_UNREGISTER = WM_USER + 3;
  BM_THRD_REGISTER = WM_USER + 4;
  BM_UNREGISTER_CLIENT = WM_USER + 10;
  BM_QUEUE_NOT_EMPTY = WM_USER + 12;
  BM_UNMARSHAL_INTERFACE = WM_USER + 13;
  BM_EXTEND_LEASE = WM_USER + 14;

  BM_PROPAGATOR_CLIENT_REGISTERED = WM_USER + 15;
  BM_PROPAGATOR_CLIENT_UNREGISTERED = WM_USER + 16;
  BM_PROPAGATOR_CLIENT_DISCONNECTED = WM_USER + 17;
  BM_PROPAGATOR_CLIENT_LEASE_EXTENDED = WM_USER + 18;
  BM_PROPAGATOR_CLIENT_LEASE_CHANGED = WM_USER + 20;
  BM_REMOVE_CLIENT_QUEUE = WM_USER + 21;

  BM_UPDATE_CLIENT_INFO = WM_USER + 22;
  BM_REQUEST_CLIENT_INFO = WM_USER + 23;
  BM_UPDATE_GLOBAL_INFO = WM_USER + 24;
  BM_REQUEST_GLOBAL_INFO = WM_USER + 25;

  BM_PROPAGATOR_DISPLAY_UPDATE_REQUEST = WM_USER + 26;
  BM_PROPAGATOR_DISPLAY_STARTDEQUEUE = WM_USER + 27;
  BM_PROPAGATOR_DISPLAY_DONEDEQUEUE = WM_USER + 28;

  E_ENQUEUER_NOT_ENABLED = 101;
  E_CLIENT_NOT_REGISTERED = 102;
  E_INVALID_PARAMETER = 100;
  W_CLIENT_NOT_RECEIVING = 103;


  BOLD_START_CLIENTID = 1;

  {events that can be subscribed to}
  BOLD_PROPAGATOR_CLIENT_UNREGISTERED = 45;
  BOLD_PROPAGATOR_CLIENT_LIST_NOT_EMPTY = 46;
  BOLD_PROPAGATOR_CLIENT_LIST_EMPTY = 47;
  BOLD_PROPAGATOR_CLIENT_LEASE_CHANGED = 48;
  BOLD_PROPAGATOR_CLIENT_REGISTERED = 49;
  BOLD_PROPAGATOR_CLIENT_LEASE_EXPIRED = 50;
  BOLD_PROPAGATOR_CLIENT_LEASE_EXTENDED = 51;
  BOLD_PROPAGATOR_CLIENT_REMOVED = 52;
  BOLD_PROPAGATOR_CLIENT_CONNECTION_LOST = 53;
  {requested events}
  breUpdateDisplay = 150;
  breClearClientQueue = 151;
  breReleaseClientLocks = 152;
  breClientRemoved = 153;

  MINIMAL_CLIENT_INFO_LIST_GROWTH = 100;
  MINIMAL_FREE_CLIENTID_COUNT = 100;
  DEFAULT_LEASE_DURATION = 1000*60*5;
  DEFAULT_EXTEND_LEASE_AFTER = 80;
  DEFAULT_POLLING_INTERVAL = 1000*5;
  TIMEOUT = 1000;
  DEFAULT_THREADPOOLSIZE = 15;
  DEFAULT_LOGFILESIZE = 0;
  DEFAULT_ENABLELOGGING = FALSE;
  DEFAULT_DISCONNECT_CLIENTS_ON_SENDFAILURE = True;

  {COM object export handles' object names}
  CLIENT_HANDLER_OBJECT_NAME = 'BoldPropagatorClientHandler';
  ENQUEUER_OBJECT_NAME = 'BoldPropagatorEventPropagator';

type
  PBoldClientInfoRecord = ^TBoldClientInfoRecord;

  TBoldClientInfoRecord = record
    ClientId: TBoldClientId;
    RegistrationTime: TTimeStamp;
    LeaseTimeOut: TTimeStamp;
  end;

implementation

end.
