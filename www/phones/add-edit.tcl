ad_page_contract {
  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-17
  @cvs-id $Id$
} {
    contact_id:integer,notnull,optional
    phone_number_id:integer,notnull,optional
    {phone_number ""}
    {best_contact_time  ""}
    {phone_type_id ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]
set user_id [ad_conn user_id]
set peeraddr [ad_conn peeraddr]

set phone_types [db_list_of_lists get_phone_types ""]
set contact_name [db_1row get_contact_name ""]

if { [ad_form_new_p -key phone_id]} {
#  ad_require_permission $contact_id write
  set context_bar [ad_context_bar [list "." "Contacts"] [list "one?contact_id=$contact_id" "Contact Info"] "Edit Phone"]
} else {
#  ad_require_permission $package_id create
  set context_bar [ad_context_bar [list "." "Contacts"] [list "one?contact_id=$contact_id" "Contact Info"] "New Phone"]
}

ad_form -name new_phone -form {
    phone_number_id:key
    
    {contact_id:text(hidden)
	{value {$contact_id}}}

    {pretty_name:text(inform)
	{label " "} 
	{value {<i>$contact_info</i>}}}

    {spacer1:text(inform)
	{label " " }
	{value {&nbsp;}}}

    {phone_number:text(text)
	{label "Phone #"}
	{html { size 20 } }
	{value {$phone_number}}}

    {best_contact_time:text(text)
	{label "Best Contact Time"}
	{html { size 10 } }
	{value {$best_contact_time}}}

    {phone_type_id:text(select)
	{label "Type"}
	{options  {$phone_types}}
	{value {$phone_type_id}}}
} -select_query_name phone_select -new_data {
    db_exec_plsql new_phone { }
    ad_returnredirect "../one?contact_id=$contact_id"
    ad_script_abort
} -edit_data {
    db_dml set_phone { }
    ad_returnredirect "../one?contact_id=$contact_id"
    ad_script_abort
}

ad_return_template



