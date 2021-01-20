<?xml version="1.0"?>
<queryset>

<fullquery name="new_phone_type_name">      
      <querytext>
    insert into cn_phone_types
    (phone_type_id,description)
    values
    (:phone_type_id,:description)

      </querytext>
</fullquery>

<fullquery name="phone_name_select">      
      <querytext>
      
    select phone_type_id,
        description
    from cn_phone_types 
      where phone_type_id = :phone_type_id
  
      </querytext>
</fullquery>

 
<fullquery name="phone_set">      
      <querytext>
      
      update cn_phone_types
      set description   = :description
      where phone_type_id = :phone_type_id
    
      </querytext>
</fullquery>

 
</queryset>
