<?xml version="1.0"?>

<queryset>
   <rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="users">      
      <querytext>
      
    select $field_names
    from contacts c,cn_addresses a ,cn_phone_numbers p,company_types ct, 
         countries cnt, contact_categories cat, cn_phone_types pt,cn_address_types at
    where c.contact_id = a.contact_id
    and c.contact_id = p.contact_id (+)
    and c.company_type_id = ct.company_type_id (+)
    and a.country_code = cnt.iso (+)
    and c.category_id = cat.category_id (+)
    and p.phone_type_id = pt.phone_type_id (+)
    and a.address_type_id = at.address_type_id (+)
    $order_by

      </querytext>
</fullquery>

 
</queryset>
