ad_page_contract {

    Displays a list of Addresses

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-01-12
    @cvs-id $Id$
} {
    contact_id:integer,notnull
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  addresses:multirow
  contact_id:onevalue
  title:onevalue
  contacts:onerow
}

set package_id [ad_conn package_id]

set context_bar [ad_context_bar "Address"]
set title "Addresses"
set user_id [ad_conn user_id]

set addresses_create_p [permission::permission_p -object_id $package_id -privilege create]
set admin_p [permission::permission_p -object_id $package_id -privilege admin]

db_multirow addresses addresses_select { }

db_1row contact_info { } -column_array contacts

ad_return_template
