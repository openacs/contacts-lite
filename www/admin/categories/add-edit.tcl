# packages/contacts/www/add-edit.tcl

ad_page_contract {
  @author Jon Griffin jon@jongriffin.com
  @creation-date 2002-01-11
  @cvs-id $Id$
} {
    category_id:integer,optional
    {category_name ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]

# get the company types
# note make sure this is subsite aware.

if {[info exists category_id]} {
  ad_require_permission $category_id write
  set page_title "Edit Category"
} else {
  ad_require_permission $package_id create
  set page_title "New Category"
}

set context_bar [list [list "." "Categories Admin"] "$page_title"]

template::form create new_category

if {[template::form is_request new_category] && [info exists category_id]} {

  template::element create new_category category_id \
      -widget hidden \
      -datatype number \
      -value $category_id

  db_1row category_select {
    select c.category_id,
        c.category_name
    from contact_categories c 
    where c.category_id = :category_id
  }
}

template::element create new_category category_name \
    -datatype text \
    -label "Category" \
    -html { size 40 } \
    -value $category_name


#######################################
### start of processing of update/new
#######################################

if [template::form is_valid new_category] {
  set user_id [ad_conn user_id]
  set peeraddr [ad_conn peeraddr]

  if [info exists category_id] {
    db_dml category_update {
      update contact_categories
      set category_name   = :category_name
      where category_id = :category_id
    }
} else {
    db_exec_plsql new_category {
    }
}

  ad_returnredirect "."
}

ad_return_template



