ad_page_contract {

    Delete Confirmation page for Categories

    @author jon@jongriffin.com
    @creation-date 2002-01-16
    @cvs-id $Id$

} {
   company_type_id:integer,notnull
}  -validate {
    company_type_exists -requires {company_type_id} {
	if ![db_0or1row company_type_exists {

	}] {
	    ad_complain "Company Type $company_type_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
    title:onevalue
    one_company_type:onerow
}

set title "Delete Company Type"
set context_bar [list [list "." "Admin"] "$title"]
set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

db_1row company_type_select {

} -column_array one_company_type

 
