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
  categories:multirow
  title:onevalue
}

set package_id [ad_conn package_id]

set title "Categories Admin"
set user_id [ad_verify_and_get_user_id]
set context_bar [list $title]

## setup a status bar 

db_multirow categories categories_select {
    select  category_id,category_name
    from contact_categories
    order by category_name
}
    
ad_return_template
