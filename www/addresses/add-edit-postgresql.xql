<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="new_address">      
      <querytext>

        select cn_address__new (
	:address_id,
	:address_type_id,
        :contact_id,
	:delivery_address,
	:municipality,
	:postal_code,
	:region,
	:country_code,
        :user_id,
        :peeraddr,
        :package_id
        );
      </querytext>
</fullquery>

<fullquery name="address_update">      
      <querytext>

        select cn_address__set (
        :address_id,
	:address_type_id,
        :contact_id,
	:delivery_address,
	:municipality,
	:postal_code,
	:region,
	:country_code
        );
      </querytext>
</fullquery>

 
</queryset>
