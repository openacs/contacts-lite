<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="address_delete">      
      <querytext>
      
  begin
    delete from acs_permissions
    where object_id = :address_id;

   cn_address.delete(:address_id);
  end;

      </querytext>
</fullquery>

 
</queryset>
