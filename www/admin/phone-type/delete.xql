<?xml version="1.0"?>
<queryset>

<fullquery name="phone_type_exists">      
    <querytext>
        select 1 from cn_phone_types where phone_type_id = :phone_type_id      
    </querytext>
</fullquery>

<fullquery name="phone_type_select">      
      <querytext>
    select phone_type_id,
           description
    from cn_phone_types
    where phone_type_id = :phone_type_id
      </querytext>
</fullquery>

 
</queryset>
