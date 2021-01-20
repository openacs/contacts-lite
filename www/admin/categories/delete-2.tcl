# packages/contacts/www/delete-2.tcl

ad_page_contract {

  @author Jon Griffin jon@jongriffin.com
  @creation-date 2001-03-21
  @cvs-id $Id$
} {
  category_id:integer,notnull
}

db_dml category_delete {
  begin
    delete from acs_permissions
    where object_id = :category_id;

    contact_category.delete(:category_id);
  end;
}

ad_returnredirect "."

