# packages/contacts/www/delete-2.tcl

ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2001-03-21
  @cvs-id $Id$
} {
  phone_type_id:integer,notnull
}

db_dml phone_type_delete {
    delete from cn_phone_types
    where phone_type_id = :phone_type_id;
}

ad_returnredirect "."

