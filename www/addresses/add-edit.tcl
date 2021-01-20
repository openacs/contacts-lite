# packages/contacts/www/add-edit.tcl

ad_page_contract {
  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-11
  @cvs-id $Id$
} {
    contact_id:integer,notnull
    {family_name ""}
    {given_name ""}
    address_id:integer,notnull,optional
    {delivery_address ""}
    {postal_code ""}
    {municipality ""}
    {region ""}
    {country_code ""}
    {address_type_id ""}
    {notes ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]
set user_id [ad_conn user_id]
set peeraddr [ad_conn peeraddr]

# get the company types
# note make sure this is subsite aware.

set address_types [db_list_of_lists get_address_types ""]
set countries [db_list_of_lists get_countries ""]
set states [db_list_of_lists get_states ""]

db_1row get_contact { } 

if {![ad_form_new_p -key address_id]} {
#  ad_require_permission $contact_id write
  set context_bar [ad_context_bar [list "./?contact_id=$contact_id" "Addresses"] "Edit Address"]
} else {
#  ad_require_permission $package_id create
  set context_bar [ad_context_bar [list "./?contact_id=$contact_id" "Addresses"] "New Address"]
}

ad_form -name new_address -form {
    address_id:key

    {family_name:text(inform)
	{label " "}
	{value {$pretty_name}}}

    {contact_id:text(hidden)
	{value {$contact_id}}}

    {delivery_address:text(textarea)
	{label "Address"}
	{html {rows 2 cols 40} }
	{value {$delivery_address}}}

    {municipality:text(text)
	{html {size 40}}
	{label "City"}
	{value { [string trim $municipality ]}}}

    {region:text(select)
	{label "State"}
	{options {$states}}
	{value {$region}}}

    {postal_code:text(text)
	{label "Zip"}
	{html { size 20 }}
	{value { [string trim $postal_code] }}}

    {country_code:text(select)
	{label "Country"}
	{options { {"UNITED STATES" "US"} $countries }}
	{value {$country_code}}}

    {address_type_id:text(select)
	{label "Address Type"}
	{options {$address_types}}
	{value {$address_type_id}}}
} -select_query_name address_select -new_data {
    db_exec_plsql new_address { }
    ad_returnredirect "../one?contact_id=$contact_id"
    ad_script_abort

} -edit_data {
    db_exec_plsql address_update { }
    ad_returnredirect "../one?contact_id=$contact_id"
    ad_script_abort
}

ad_return_template



