<?xml version="1.0"?>
<queryset>

<fullquery name="new_company_type_name">      
      <querytext>
    insert into cn_company_types
    (company_type_id,company_type_name)
    values
    (:company_type_id,:company_type_name)

      </querytext>
</fullquery>

<fullquery name="company_name_select">      
      <querytext>
      
    select c.company_type_id,
        c.company_type_name
    from cn_company_types c 
      where c.company_type_id = :company_type_id
  
      </querytext>
</fullquery>

 
<fullquery name="company_set">      
      <querytext>
      
      update cn_company_types
      set company_type_name   = :company_type_name
      where company_type_id = :company_type_id
    
      </querytext>
</fullquery>

 
</queryset>
