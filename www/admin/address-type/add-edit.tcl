# packages/contacts/www/admin/phone-type/add-edit.tcl

ad_page_contract {
  @author Jon Griffin <jon@jongriffin.com)
  @creation-date 2002-04-16
  @cvs-id 
} {
    address_type_id:integer,optional
    {description ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]

# get the company types
# note make sure this is subsite aware.

if {[info exists company_type_id]} {
  set page_title "Edit Address Type"
} else {
  set page_title "New Address Type"
}

set context_bar [list [list "." "Address Admin"] "$page_title"]

template::form create new_address_type_name

if {[template::form is_request new_address_type_name] && [info exists address_type_id]} {

  template::element create new_address_type_name address_type_id \
      -widget hidden \
      -datatype number \
      -value $address_type_id

  db_1row address_name_select {
  }
}

template::element create new_address_type_name description \
    -datatype text \
    -label "Description" \
    -html { size 40 } \
    -value $description


#######################################
### start of processing of update/new
#######################################

if {[template::form is_valid new_address_type_name]} {
  set user_id [ad_conn user_id]
  set peeraddr [ad_conn peeraddr]

  if {[info exists address_type_id]} {
    db_dml address_set {
    }
} else {
    set address_type_id [db_nextval acs_object_id_seq]
    
    db_dml new_address_type_name {
    }
}

  ad_returnredirect "."
}

ad_return_template



