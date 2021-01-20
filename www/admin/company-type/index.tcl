ad_page_contract {

    Displays a list of Company Types

    @author Jon Griffin jon@jongriffin.com
    @creation-date 2002-01-24
    @cvs-id 
} {
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  company_names_types:multirow
  title:onevalue
}

set package_id [ad_conn package_id]

set title "Contacts Admin"
set user_id [ad_verify_and_get_user_id]
set context_bar [list "Admin Company Type"]

## setup a status bar 

db_multirow company_types company_types_select {
    select  company_type_id,company_type_name
    from cn_company_types
    order by company_type_name
}
    
ad_return_template
