<?xml version="1.0"?>
<queryset>

<fullquery name="category_select">      
      <querytext>
      
    select c.category_id,
        c.category_name
    from contact_categories c 
    where c.category_id = :category_id
  
      </querytext>
</fullquery>

 
<fullquery name="note_update">      
      <querytext>
      
      update contact_categories
      set category_name   = :category_name
      where category_id = :category_id
    
      </querytext>
</fullquery>

 
</queryset>
