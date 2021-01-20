ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-16
  @cvs-id $Id$
} {
  address_id:integer,notnull
  contact_id:integer,notnull
}

permission::require_permission -object_id $address_id -privilege delete

db_1row get_contact "select contact_id from cn_addresses where address_id=:address_id" 

db_dml address_delete {
  begin
    delete from acs_permissions
    where object_id = :address_id;

   cn_address.delete(:address_id);
  end;
}

ad_returnredirect "one?contact_id=$contact_id"

