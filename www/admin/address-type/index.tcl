ad_page_contract {

    Displays a list of Address Types

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-04-18
    @cvs-id 
} {
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  address_types:multirow
  title:onevalue
}

set package_id [ad_conn package_id]

set title "Address Types Admin"
set context_bar [ad_context_bar $title]

set user_id [ad_verify_and_get_user_id]

## setup a status bar 

db_multirow address_types address_types_select {

}
    
ad_return_template
