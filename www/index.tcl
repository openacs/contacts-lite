ad_page_contract {

    Displays a list of Contacts

    @author Jon Griffin (jon@jongriffin.com)
    @creation-date 2002-01-12
    @cvs-id $Id$
} {
  {start:integer "1"}
  {search_p 0}
  {search_string ""}
  {search_in ""}
  {sort ""}
  {starts_with ""}
} -properties {
  context_bar:onevalue
  package_id:onevalue
  user_id:onevalue
  contacts:multirow
  title:onevalue
}

set context_bar [ad_context_bar "Contacts"]

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]

set title "Contacts"

set contacts_create_p [permission::permission_p -object_id $package_id -privilege create]
set admin_p [permission::permission_p -object_id $package_id -privilege admin]


db_multirow first_letter get_first_letters { *SQL* }


switch $sort {
    "fname" { set ordering "given_name, family_name, company_name" }
    "lname" { set ordering "family_name, given_name, company_name" }
    "cmpny" { set ordering "company_name, family_name, given_name" }
    default { set ordering "family_name" }
}

if { $starts_with ne "" } {
       switch $starts_with {
	"all" { set starts_with_clause "" }
        "other" { set starts_with_clause "and family_name is null" }
        default { set starts_with_clause "and upper(family_name) like '${starts_with}%'" }
    }

} else {
    set starts_with_clause ""
}


if { $search_p == 1 && $search_string ne "" } {
    switch $search_in {
	"fname" { set search_clause "and lower(given_name) like '%' || lower(:search_string) || '%'" }
	"lname" { set search_clause "and lower(family_name) like '%' || lower(:search_string) || '%'" }
        "cmpny" { set search_clause "and lower(company_name) like '%' || lower(:search_string) || '%'" }
        "any" { set search_clause "and (lower(family_name) like '%' || lower(:search_string) || '%' or
                                        lower(given_name) like '%' || lower(:search_string) || '%' or
	                                lower(company_name) like '%' || lower(:search_string) || '%')" }
    }

} else {
    set search_clause ""
}


set max_dspl [parameter::get -parameter MaxContactsShow -default 10]
set count 0
db_multirow contacts contacts_select {} {
	incr count
	if { $count < $start } continue
	if { $count >= ($start + $max_dspl) } break
}

#    and o.context_id = :package_id


set total_contacts [db_string retrieved_contacts "select count(*)
                                                  from contacts c, acs_objects o
                                                  where c.contact_id = o.object_id
                                                  ${search_clause}
                                                  ${starts_with_clause}"]

#                                                  and o.context_id = :package_id

# make paging links
if { $count < ($start + $max_dspl) } {
    set next_start ""
} else {
    if {($start + 2 * $max_dspl - $total_contacts) < 0 } {
	set next_val $max_dspl
    } else {
	set next_val [expr {$total_contacts - $start - $max_dspl + 1}]
    }

    set next_start "<a href=index?start=[expr {$start + $max_dspl}]&search_p=${search_p}&search_string=${search_string}&search_in=${search_in}&starts_with=${starts_with}&sort=${sort}>NEXT $next_val<a/>"
}

if { $start == 1 } {
    set prev_start ""
} else {
    set prev_start "<a href=index?start=[expr {$start - $max_dspl}]&search_p=${search_p}&search_string=${search_string}&search_in=${search_in}&starts_with=${starts_with}&sort=${sort}>PREV $max_dspl</a>"
}

if { $next_start ne "" && $prev_start ne "" } {
    set divider " | "
} else {
    set divider ""
}

if { ($start + $max_dspl - 1) > $total_contacts } {
    if { $total_contacts == 0 } {
	set start 0 }
    set showing "Showing: $start - $total_contacts"
} else {
    set showing "Showing: $start - [expr {$start + $max_dspl - 1}]"
}

set pagination_link " $prev_start$divider$next_start "


## setup a status bar     
#  where o.context_id = :package_id
#  and acs_permission.permission_p(contact_id, :user_id, 'read') = 't'

ad_return_template
