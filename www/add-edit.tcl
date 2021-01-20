# packages/contacts/www/add-edit.tcl

ad_page_contract {
  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-11
  @cvs-id $Id$
} {
    contact_id:integer,notnull,optional
    {middle_name ""}
    {family_name ""}
    {given_name ""}
    {formatted_name ""}
    {preferred_given_name ""}
    {affix ""}
    {suffix ""}
    {title ""}
    {email ""}
    {company_name  ""}
    {company_type_id  ""}
    {category_id  ""}
    {notes ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]
set user_id [ad_conn user_id]
set peeraddr [ad_conn peeraddr]

if { [info exists contact_id] && $contact_id ne "" } {
set link "<a href='addresses/.?contact_id=$contact_id'><b>Edit Addresses</b></a><br/>"
set phono_link "<a href='phones/.?contact_id=$contact_id'><b>Edit Phones</b></a>"
} else {
    set link ""
    set phono_link ""
}

# get the company types
# note make sure this is subsite aware.

#query company_types multilist "select company_type_name, company_type_id from company_types"
#query categories multilist "select category_name, category_id from contact_categories"
set company_types [db_list_of_lists get_company_types ""]
set categories [db_list_of_lists get_categories ""] 

if { ![ad_form_new_p -key contact_id]} {
#  ad_require_permission $contact_id write
  set page_title "Edit Contact"
  set context_bar [ad_context_bar [list "." "Contact Info"] [list "one?contact_id=$contact_id" "Contact Info"] $page_title]
} else {
#  ad_require_permission $package_id create
  set page_title "New Contact"
  set context_bar [ad_context_bar [list "." "Contacts"] $page_title ]
}

ad_form -name new_contact -form {
    contact_id:key

    {affix:text(text),optional
	{label "Affix" }
	{html { size 20 }} 
	{value {$affix }}}

    {given_name:text(text) 
	{label "First Name" }
	{html { size 40 }} 
	{value {[string trim $given_name]}}}
    
    {middle_name:text(text),optional
	{label "Middle"}
	{html { size 30 } }
	{value {$middle_name}}}

    {family_name:text(text)
        {label "Last Name" }
	{html { size 40 } }
	{value {$family_name}}}

    {formatted_name:text(text)
	{label "Formatted Name" }
	{html { size 40 } }
	{value {$formatted_name}}}

    {preferred_given_name:text(text)
	{label "Preferred Name" }
	{html { size 40 } }
	{value {$preferred_given_name}}}

    {suffix:text(text),optional
	{label "Suffix" }
	{html { size 20 } }
	{value {$suffix}}}

    {email:text(text) 
	{label "Email" }
	{html { size 40 }} 
	{value {$email}}}

    {spacer3:text(inform) 
	{label " "} 
	{value {}}}

    {title:text(text),optional
	{label "Title" }
	{html { size 40 }} 
	{value {$title}}}

    {company_name:text(text) 
	{label "Company Name" }
	{html { size 40 } }
	{value {$company_name}}}

    {company_type_id:text(select) 
	{label "Company Type" }
	{options {$company_types }}
	{value { $company_type_id}}}
    
    {category_id:text(select) 
	{label "Contact Category" }
	{options {$categories}}
	{value {$category_id}}}
    
    {spacer1:text(inform) 
	{label " " }
	{value {&nbsp;}}}

    {notes:text(textarea) 
	{label "Notes" }
	{html { cols 40 rows 5 } }
	{value {$notes}}}

	{spacer2:text(inform) 
	    {label " " }
	    {value {}}}
	
	{address_link:text(inform) 
	    {label " " }
	    {value {$link}}}

	{phone_link:text(inform) 
	    {label " "}
	    {value {$phono_link}}}
    

} -select_query_name contact_select -new_data {
    db_exec_plsql new_contact { }
    ad_returnredirect "./one?contact_id=$contact_id"
    ad_script_abort
} -edit_data {
    db_exec_plsql set_contact { }
    ad_returnredirect "./one?contact_id=$contact_id"
    ad_script_abort
} 

ad_return_template



