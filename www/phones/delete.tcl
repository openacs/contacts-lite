ad_page_contract {

    Delete Confirmation page for Phone Numbers

    @author jon@jongriffin.com
    @creation-date 2002-01-16
    @cvs-id $Id$

} {
   phone_number_id:integer,notnull
}  -validate {
    phone_exists -requires {phone_number_id} {
	if {![db_0or1row phone_exists {
	    select 1 from cn_phone_numbers where phone_number_id = :phone_number_id
	}]} {
	    ad_complain "phone $phone_number_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
    title:onevalue
    one_phone:onerow
    contact_id:onevalue
}

set title "Delete Phone Number"
set context_bar [ad_context_bar]
set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

# make sure they don't perform URL surgery
#permission::require_permission -object_id $phone_number_id -privilege delete

db_1row phone_select {
    select phone_number_id,
        phone_number,
	contact_id
    from cn_phone_numbers
    where phone_number_id = :phone_number_id
} -column_array one_phone

 