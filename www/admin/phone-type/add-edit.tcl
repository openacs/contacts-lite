# packages/contacts/www/admin/phone-type/add-edit.tcl

ad_page_contract {
  @author Jon Griffin <jon@jongriffin.com)
  @creation-date 2002-04-16
  @cvs-id 
} {
    phone_type_id:integer,optional
    {description ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]

# get the company types
# note make sure this is subsite aware.

if {[info exists company_type_id]} {
  set page_title "Edit Phone Type"
} else {
  set page_title "New Phone Type"
}

set context_bar [list [list "." "Admin"] "$page_title"]

template::form create new_phone_type_name

if {[template::form is_request new_phone_type_name] && [info exists phone_type_id]} {

  template::element create new_phone_type_name phone_type_id \
      -widget hidden \
      -datatype number \
      -value $phone_type_id

  db_1row phone_name_select {
  }
}

template::element create new_phone_type_name description \
    -datatype text \
    -label "Description" \
    -html { size 40 } \
    -value $description


#######################################
### start of processing of update/new
#######################################

if [template::form is_valid new_phone_type_name] {
  set user_id [ad_conn user_id]
  set peeraddr [ad_conn peeraddr]

  if [info exists phone_type_id] {
    db_dml phone_set {
    }
} else {
    set phone_type_id [db_nextval acs_object_id_seq]
    
    db_dml new_phone_type_name {
    }
}

  ad_returnredirect "."
}

ad_return_template



