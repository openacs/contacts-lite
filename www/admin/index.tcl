ad_page_contract {

    Displays a list of Contacts

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-01-12
    @cvs-id $Id$
} {
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  contacts:multirow
  title:onevalue
}

set package_id [ad_conn package_id]


set title "Contacts Admin"
set user_id [ad_verify_and_get_user_id]

set context_bar  ""
    
ad_return_template
