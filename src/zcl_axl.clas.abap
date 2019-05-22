class ZCL_AXL definition
  public
  final
  create public .

public section.
methods create_log.
protected section.
private section.
ENDCLASS.



CLASS ZCL_AXL IMPLEMENTATION.
method create_log.

 daTa(LO_LOG) = cf_reca_message_list=>CREATE(
*      exporting
*        ID_OBJECT       = 'RECA'    " See Table BALOBJ
*        ID_SUBOBJECT    = 'MISC'    " See Table BALSUB
*        ID_EXTNUMBER    =     " External ID of Log
*        ID_DELDATE      =     " Expiration Date
*        IF_DELNOTBEFORE = ABAP_FALSE    " Keep Log Until Expiration Date
*      receiving
*        RO_INSTANCE     =     " Message Collector
    ).

  message S002(38).

  LO_LOG->ADD_SYMSG(
*    exporting
*      IF_CUMULATE  =     " Cumulation of Messages
*      ID_DETLEVEL  =     " Level of Detail (0..9)
*      ID_PROBCLASS =     " Problem class
*      ID_TABNAME   =     " Table Name
*      ID_FIELDNAME =     " Field Name
*      ID_VALUE     =     " Value
*      ID_INDEX     =     " Line Index
*      ID_INTRENO   =     " INTRENO of Calling Program
*      ID_CUSTACT   =     " IMG Activity
*      ID_CONTEXT   =     " Enhanced Navigation Data (Maximum 75 Characters)
*    importing
*      ES_MESSAGE   =     " Message data
  ).

  LO_LOG->STORE(
*    exporting
*      IF_IN_UPDATE_TASK = ABAP_TRUE    " Call update program using "IN UPDATE TASK"
*    exceptions
*      ERROR             = 1
*      OTHERS            = 2
  ).
  if sy-subrc <> 0.
*   message id sy-msgid type sy-msgty number sy-msgno
*              with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  endif.




ENDMETHOD.
ENDCLASS.
