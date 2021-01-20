ad_page_contract {

    Delete Confirmation page for Categories

    @author jon@jongriffin.com
    @creation-date 2002-01-16
    @cvs-id $Id$

} {
   category_id:integer,notnull
}  -validate {
    category_exists -requires {category_id} {
	if {![db_0or1row category_exists {
	    select 1 from contact_categories where category_id = :category_id
	}]} {
	    ad_complain "Category $category_id does not exist"
	    return 0
	}
	return 1
    }
} -properties {
    title:onevalue
    one_category:onerow
}

set page_title "Delete Category"
set package_id [ad_conn package_id]
set user_id [ad_conn user_id]

set context_bar [list [list "." "Categories Admin"] "$page_title"]

db_1row category_select {
    select category_id,
        category_name
    from contact_categories
    where category_id = :category_id
} -column_array one_category

 