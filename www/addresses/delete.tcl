ad_page_contract {

    Delete Confirmation page for addresses

    @author jon@jongriffin.com
    @creation-date 2002-01-16
    @cvs-id $Id$

} {
   address_id:integer,notnull
}  -validate {
    address_exists -requires {address_id} {
	if {![db_0or1row address_exists { }]} {
	    ad_complain "Address $address_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
    title:onevalue
    one_address:onerow
}

set title "Delete Address"
set context_bar [ad_context_bar]
set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

# make sure they don't perform URL surgery
ad_require_permission $address_id delete

db_1row address_select { } -column_array one_address

 