<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="address_delete">      
      <querytext>
      FIX ME PLSQL

  begin
    delete from acs_permissions
    where object_id = :address_id;

   cn_address__delete(:address_id);
  end;

      </querytext>
</fullquery>

 
</queryset>
