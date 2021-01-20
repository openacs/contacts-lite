<?xml version="1.0"?>
<queryset>

<fullquery name="users">      
      <querytext>
    select $field_names
    from contacts c left join cn_phone_numbers p on (c.contact_id = p.contact_id),
         cn_addresses a  left join countries cnt on (a.country_code = cnt.iso ),
         contacts c left join company_types ct (c.company_type_id = ct.company_type_id), 
	 contacts c left join contact_categories cat on (c.category_id = cat.category_id), 
	 cn_phone_numbers p left join cn_phone_types pt on (p.phone_type_id = pt.phone_type_id ),
	 cn_addresses a left join cn_address_types at on (a.address_type_id = at.address_type_id )
    where c.contact_id = a.contact_id
    $order_by

      </querytext>
</fullquery>

 
</queryset>
