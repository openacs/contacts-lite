<?xml version="1.0"?>
<queryset>

<fullquery name="company_type_exists">      
    <querytext>
        select 1 from cn_company_types where company_type_id = :company_type_id      
    </querytext>
</fullquery>

<fullquery name="company_type_select">      
      <querytext>
    select company_type_id,
        company_type_name
    from cn_company_types
    where company_type_id = :company_type_id
      </querytext>
</fullquery>

 
</queryset>
