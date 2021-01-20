# packages/contacts/www/one.tcl

ad_page_contract {
  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-17
  @cvs-id $Id$
} {
    contact_id:integer,notnull
}  -validate {
    contact_exists -requires {contact_id} {
	if {![db_0or1row contact_exists {
	    select 1 from contacts where contact_id = :contact_id
	}]} {
	    ad_complain "Contact $contact_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
  context_bar:onevalue
  contact:onerow
  addresses:multirow
}

set context_bar [ad_context_bar "Contact Info"]
set user_id [ad_conn user_id]

set contact_admin_p [group::member_p -group_name "Employees"]
set admin $contact_admin_p

if { $admin ne "1" } {
        set contact_write_p [permission::permission_p -object_id $contact_id -privilege "write"]
} else {
        set contact_write_p 1
}

db_1row contact_select {
} -column_array contact

db_multirow addresses get_addresses {
}

db_multirow phones get_phones {
}

