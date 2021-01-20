<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="category_delete">      
      <querytext>
      
  begin
    delete from acs_permissions
    where object_id = :category_id;

    contact_category.delete(:category_id);
  end;

      </querytext>
</fullquery>

 
</queryset>
