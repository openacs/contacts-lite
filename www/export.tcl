ad_page_contract {

    Outputs csv

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-01-23
    @cvs-id $Id$
} {
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  title:onevalue
  columns:multirow
  categories:multirow
}

set page_title "CSV export"
set context_bar ""

db_multirow categories get_categories {
    select category_id, category_name
    from contact_categories
}

ad_return_template
