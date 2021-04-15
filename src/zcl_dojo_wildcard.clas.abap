CLASS zcl_dojo_wildcard DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      mt_wildcards TYPE SORTED TABLE OF zdojo_wildcards WITH UNIQUE KEY varbpl narbpl .

    METHODS check
      IMPORTING
        !iv_varbpl        TYPE zdojo_varbpl
        !iv_narbpl        TYPE zdojo_narbpl
      RETURNING
        VALUE(rs_results) TYPE zdojo_wildcards .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dojo_wildcard IMPLEMENTATION.


  METHOD check.

    LOOP AT mt_wildcards INTO DATA(ls_row).
      IF ls_row-narbpl = iv_varbpl AND ls_row-narbpl = iv_narbpl.
        rs_results = ls_row.
        RETURN.
      ENDIF.
    ENDLOOP.

    LOOP AT mt_wildcards INTO DATA(ls_row_wildcard).
      IF iv_varbpl CP ls_row_wildcard-varbpl AND iv_narbpl CP ls_row_wildcard-narbpl.
        rs_results = ls_row_wildcard.
        RETURN.
      ENDIF.
    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
