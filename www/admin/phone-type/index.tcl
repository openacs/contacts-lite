ad_page_contract {

    Displays a list of Company Types

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-04-16
    @cvs-id 
} {
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  phone_types:multirow
  title:onevalue
}

set package_id [ad_conn package_id]

set context_bar [ad_context_bar "Admin Phone Types"]
set title "Phone Types Admin"
set user_id [ad_verify_and_get_user_id]

## setup a status bar 

db_multirow phone_types phone_types_select {

}
    
ad_return_template
