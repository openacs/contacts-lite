<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="category_delete">      
      <querytext>
      FIX ME PLSQL

  begin
    delete from acs_permissions
    where object_id = :category_id;

    contact_category__delete(:category_id);
  end;

      </querytext>
</fullquery>

 
</queryset>
