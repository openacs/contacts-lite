ad_page_contract {

    Outputs csv

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-01-23
    @cvs-id $Id$
} {
    {given_name:optional ""}
    {middle_name:optional ""}
    {family_name:optional ""}
    {preferred_name:optional ""}
    {formatted_name:optional ""}
    {affix:optional ""}
    {suffix:optional ""}
    {category_id:optional ""}
    {title:optional ""}
    {company_name:optional ""}
    {company_type:optional ""}
    {delivery_address:optional ""}
    {municipality:optional ""}
    {region:optional ""}
    {postal_code:optional ""}
    {country_name:optional ""}
    {address_type:optional ""}
    {notes:optional ""}
    {phone_number:optional ""}
    {phone_type:optional ""}
    {sort_by:multiple,optional "family_name"}
    {where_clause:multiple,optional}
} 

# if all the boxes are unchecked throw an error

# if all are checked

# all this needs to be put into a proc
if { [string compare $given_name  "on"] == 0 } {
  lappend field_list "given_name"
}
if { [string compare $middle_name  "on"] == 0 } {
  lappend field_list "middle_name"
}
if { [string compare $family_name  "on"] == 0 } {
  lappend field_list "family_name"
}
if { [string compare $preferred_name  "on"] == 0 } {
  lappend field_list "preferred_given_name"
}
if { [string compare $formatted_name  "on"] == 0 } {
  lappend field_list "formatted_name"
}
if { [string compare $affix  "on"] == 0 } {
  lappend field_list "affix"
}
if { [string compare $suffix  "on"] == 0 } {
  lappend field_list "suffix"
}
if { [string compare $notes  "on"] == 0 } {
  lappend field_list "notes"
}
if { [string compare $category_id  "on"] == 0 } {
  lappend field_list "category_name"
}
if { [string compare $title  "on"] == 0 } {
  lappend field_list "title"
}
if { [string compare $company_name  "on"] == 0 } {
  lappend field_list "company_name"
}
if { [string compare $company_type  "on"] == 0 } {
  lappend field_list "company_type_name"
}
if { [string compare $delivery_address  "on"] == 0 } {
  lappend field_list "delivery_address"
}
if { [string compare $municipality  "on"] == 0 } {
  lappend field_list "municipality"
}
if { [string compare $region  "on"] == 0 } {
  lappend field_list "region"
}
if { [string compare $postal_code  "on"] == 0 } {
  lappend field_list "postal_code"
}
if { [string compare $country_name  "on"] == 0 } {
  lappend field_list "default_name"
}
if { [string compare $address_type  "on"] == 0 } {
  lappend field_list "at.description"
}
if { [string compare $phone_number  "on"] == 0 } {
  lappend field_list "phone_number"
}
if { [string compare $phone_type  "on"] == 0 } {
  lappend field_list "pt.description"
}


#append output "where: $where_clause\n"

if { [lindex $where_clause 0] eq "" == 0   } {
    set where_clause "and c.category_id=[join $where_clause]"
} else {
    set where_clause "" 
} 

if { [lindex $sort_by 0] eq "" == 0 } {
    set order_by "$where_clause \n order by [join $sort_by ,]"
} else {
    set order_by "$where_clause" 
} 

# now comma delimit the field list
set field_names [join $field_list ,]

set mylist [db_list_of_lists users "
    select $field_names
    from contacts c,cn_addresses a ,cn_phone_numbers p,company_types ct, 
         countries cnt, contact_categories cat, cn_phone_types pt,cn_address_types at
    where c.contact_id = a.contact_id
    and c.contact_id = p.contact_id (+)
    and c.company_type_id = ct.company_type_id (+)
    and a.country_code = cnt.iso (+)
    and c.category_id = cat.category_id (+)
    and p.phone_type_id = pt.phone_type_id (+)
    and a.address_type_id = at.address_type_id (+)
    $order_by
" ]
#  append output "$order_by:$where_clause \n"
  append output [csv::join $field_list ]
  append output "\n"
  regsub -all {[\n\f\r]} $mylist " " mylist
  append output "[csv::joinlist $mylist]"

ns_return 200 text/csv $output
#ns_write "$output"
