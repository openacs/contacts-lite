ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-16
  @cvs-id $Id$
} {
  address_id:integer,notnull
}

ad_require_permission $address_id delete

db_1row get_contact { } 

db_exec_plsql address_delete { }

ad_returnredirect "../one?contact_id=$contact_id"

