<?xml version="1.0"?>
<queryset>

<fullquery name="address_exists">      
      <querytext>
      
	    select 1 from cn_addresses where address_id = :address_id
	
      </querytext>
</fullquery>

 
<fullquery name="address_select">      
      <querytext>
      
    select address_id,
        address_id, delivery_address || '<br>' || municipality \
	|| ', ' || region || ' ' || postal_code as address, contact_id
    from cn_addresses
    where address_id = :address_id

      </querytext>
</fullquery>

 
</queryset>
