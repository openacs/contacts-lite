<?xml version="1.0"?>
<queryset>

<fullquery name="address_type_exists">      
    <querytext>
        select 1 from cn_address_types where address_type_id = :address_type_id      
    </querytext>
</fullquery>

<fullquery name="address_type_select">      
      <querytext>
    select address_type_id,
        description
    from cn_address_types
    where address_type_id = :address_type_id
      </querytext>
</fullquery>

 
</queryset>
