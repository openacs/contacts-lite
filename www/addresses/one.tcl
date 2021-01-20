# packages/contacts/www/addresses/one.tcl

ad_page_contract {
  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-17
  @cvs-id $Id$
} {
    address_id:integer,notnull
    contact_id:integer,notnull
}  -validate {
    address_exists -requires {address_id} {
	if {![db_0or1row address_exists {}]} {
	    ad_complain "Address $address_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
  context_bar:onevalue
  addresses:onerow
}

set context_bar [ad_context_bar [list ".?contact_id=$contact_id" "Address Info"] "One Address"]
set user_id [ad_verify_and_get_user_id]

set contact_write_p [ad_permission_p $contact_id "write"]

db_1row address_select {
} -column_array addresses


