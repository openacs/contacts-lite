<?xml version="1.0"?>
<queryset>

<fullquery name="new_address_type_name">      
      <querytext>
    insert into cn_address_types
    (address_type_id,description)
    values
    (:address_type_id,:description)

      </querytext>
</fullquery>

<fullquery name="address_name_select">      
      <querytext>
      
    select address_type_id,
        description
    from cn_address_types 
      where address_type_id = :address_type_id
  
      </querytext>
</fullquery>

 
<fullquery name="address_set">      
      <querytext>
      
      update cn_address_types
      set description   = :description
      where address_type_id = :address_type_id
    
      </querytext>
</fullquery>

 
</queryset>
