ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-16
  @cvs-id $Id$
} {
  phone_number_id:integer,notnull
  contact_id:integer,notnull
}

#permission::require_permission -object_id $contact_id -privilege delete

db_exec_plsql phone_delete { }

ad_returnredirect "../one?contact_id=$contact_id"

