ad_page_contract {

    Delete Confirmation page for Phone Types
    
    @author jon@jongriffin.com
    @creation-date 2002-01-16
    @cvs-id $Id$

    $Log$
    Revision 1.2  2021/01/20 21:17:08  gustafn
    improve Tcl code
    - brace expressions
    - prefer current idioms

    Revision 1.1  2021/01/20 18:35:37  gustafn
    New package as provided by Jon Griffin


} {
   phone_type_id:integer,notnull
}  -validate {
    phone_type_exists -requires {phone_type_id} {
	if {![db_0or1row phone_type_exists {

	}]} {
	    ad_complain "Phone Type $phone_type_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
    title:onevalue
    one_phone_type:onerow
}

set title "Delete Phone Type"
set context_bar [list [list "." "Phone Type Admin"] "$title"]
set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

db_1row phone_type_select { *SQL* } -column_array one_phone_type

 
