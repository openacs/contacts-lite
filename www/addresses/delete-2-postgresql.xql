<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="address_delete">      
      <querytext>
        select cn_address__del(:address_id);
      </querytext>
</fullquery>

 
</queryset>
