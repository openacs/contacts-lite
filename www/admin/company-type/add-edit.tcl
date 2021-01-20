# packages/contacts/www/admin/company-type/add-edit.tcl

ad_page_contract {
  @author Jon Griffin <jon@jongriffin.com)
  @creation-date 2002-04-14
  @cvs-id 
} {
    company_type_id:integer,optional
    {company_type_name ""}
} -properties {
  context_bar:onevalue
}

set package_id [ad_conn package_id]

# get the company types
# note make sure this is subsite aware.

if {[info exists company_type_id]} {
  set page_title "Edit Company Type"
} else {
  set page_title "New Company Type"
}

set context_bar [list [list "." "Admin"] "$page_title"]

template::form create new_company_type_name

if {[template::form is_request new_company_type_name] && [info exists company_type_id]} {

  template::element create new_company_type_name company_type_id \
      -widget hidden \
      -datatype number \
      -value $company_type_id

  db_1row company_name_select {
    select c.company_type_id,
        c.company_type_name
    from company_types c 
      where c.company_type_id = :company_type_id
  }
}

template::element create new_company_type_name company_type_name \
    -datatype text \
    -label "Company Type" \
    -html { size 40 } \
    -value $company_type_name


#######################################
### start of processing of update/new
#######################################

if [template::form is_valid new_company_type_name] {
  set user_id [ad_conn user_id]
  set peeraddr [ad_conn peeraddr]

  if [info exists company_type_id] {
    db_dml company_set {
    }
} else {
    set company_type_id [db_nextval acs_object_id_seq]
    
    db_dml new_company_type_name {
    }
}

  ad_returnredirect "."
}

ad_return_template



