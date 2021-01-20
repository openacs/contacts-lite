ad_page_contract {

    Displays a list of Phones

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-01-17
    @cvs-id $Id$
} {
    contact_id:integer,notnull
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  phones:multirow
  contact_id:onevalue
  title:onevalue
  contacts:onerow
}

set package_id [ad_conn package_id]

set context_bar [ad_context_bar "Phone Info"]
set title "Phone Numbers"
set user_id [ad_conn user_id]

set phones_create_p [permission::permission_p -object_id $package_id -privilege create]
set admin_p [permission::permission_p -object_id $package_id -privilege admin]

db_multirow phones phones_select {
    select  contact_id,phone_number_id,phone_number,
           description as phone_type,
           acs_permission.permission_p(contact_id, :user_id,
                   	               'write') as write_p,
           acs_permission.permission_p(contact_id, :user_id,
                                       'delete') as delete_p
      from cn_phone_numbers p, acs_objects o, cn_phone_types t
      where p.contact_id = o.object_id
      and p.contact_id = :contact_id
      and p.phone_type_id = t.phone_type_id
}

db_1row contact_info {
    select 
       c.given_name || ' ' || c.family_name as pretty_name,
       c.company_name,contact_id
    from contacts c
    where contact_id = :contact_id
} -column_array contacts

## setup a status bar 
    
#  where o.context_id = :package_id
#  and acs_permission.permission_p(contact_id, :user_id, 'read') = 't'

ad_return_template
