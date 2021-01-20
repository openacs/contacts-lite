# packages/contacts/www/delete-2.tcl

ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2001-03-21
  @cvs-id $Id$
} {
  address_type_id:integer,notnull
}

db_dml address_type_delete {
    delete from cn_address_types
    where address_type_id = :address_type_id;
}

ad_returnredirect "."

