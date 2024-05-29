CLASS zcl_xe3_badi_mfgorder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_cobadicfl_mfgorder_hdr_init .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_xe3_badi_mfgorder IMPLEMENTATION.

  METHOD if_cobadicfl_mfgorder_hdr_init~modify_header.

    manufacturingorder_changed-custom_fields = manufacturingorder-custom_fields.

    "Initialize custom fields which are filled in this implementation
    CLEAR manufacturingorder_changed-yy1_a_fitfor1_ord.

    SELECT * FROM zxe3_fitfor_v2
        WHERE werks = @manufacturingorder-productionplant
        AND produced_pro = @manufacturingorder-material
        INTO TABLE @DATA(lt_fitfor).

    IF create_mode = abap_true. "New order is created
      IF lt_fitfor IS NOT INITIAL.
        manufacturingorder_changed-yy1_a_fitfor1_ord = 'X'.
      ELSE.
        manufacturingorder_changed-yy1_a_fitfor1_ord = ''.
      ENDIF.

    ELSE. "Existing order is changed
      IF lt_fitfor IS NOT INITIAL.
        manufacturingorder_changed-yy1_a_fitfor1_ord = 'X'.
      ELSE.
        manufacturingorder_changed-yy1_a_fitfor1_ord = ''.
      ENDIF.

    ENDIF.

    "Activate changes by providing internal key
    manufacturingorder_changed-manufacturingorder = manufacturingorder-manufacturingorder.

  ENDMETHOD.
ENDCLASS.
