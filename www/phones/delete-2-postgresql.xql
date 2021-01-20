<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="phone_delete">      
      <querytext>

    select cn_phone_number__del(:phone_number_id);

      </querytext>
</fullquery>

 
</queryset>
