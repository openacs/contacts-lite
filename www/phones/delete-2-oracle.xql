<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="phone_delete">      
      <querytext>
      
  begin
    delete from acs_permissions
    where object_id = :phone_number_id;

    cn_phone_number.delete(:phone_number_id);
  end;

      </querytext>
</fullquery>

 
</queryset>
