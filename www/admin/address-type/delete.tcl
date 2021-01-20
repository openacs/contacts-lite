ad_page_contract {

    Delete Confirmation page for Address Type

    @author jon@jongriffin.com
    @creation-date 2002-04-18
    @cvs-id $Id$

} {
   address_type_id:integer,notnull
}  -validate {
    address_type_exists -requires {address_type_id} {
	if {![db_0or1row address_type_exists {

	}]} {
	    ad_complain "Address Type $address_type_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
    title:onevalue
    one_company_type:onerow
}

set title "Delete Address Type"
set context_bar [list [list "." "Address Admin"] "$title"]
set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

db_1row address_type_select {

} -column_array one_address_type

 
