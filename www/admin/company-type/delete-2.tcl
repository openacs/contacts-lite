# packages/contacts/www/delete-2.tcl

ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2001-03-21
  @cvs-id $Id$
} {
  company_type_id:integer,notnull
}

db_dml company_type_delete {
    delete from cn_company_types
    where company_type_id = :company_type_id;
}

ad_returnredirect "."

