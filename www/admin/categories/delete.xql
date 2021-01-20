<?xml version="1.0"?>
<queryset>

<fullquery name="category_exists">      
      <querytext>
      
	    select 1 from contact_categories where category_id = :category_id
	
      </querytext>
</fullquery>

 
<fullquery name="category_select">      
      <querytext>
      
    select category_id,
        category_name
    from contact_categories
    where category_id = :category_id

      </querytext>
</fullquery>

 
</queryset>
