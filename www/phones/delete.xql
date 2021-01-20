<?xml version="1.0"?>
<queryset>

<fullquery name="phone_exists">      
      <querytext>
      
	    select 1 from cn_phone_numbers where phone_number_id = :phone_number_id
	
      </querytext>
</fullquery>

 
<fullquery name="phone_select">      
      <querytext>
      
    select phone_number_id,
        phone_number,
	contact_id
    from cn_phone_numbers
    where phone_number_id = :phone_number_id

      </querytext>
</fullquery>

 
</queryset>
