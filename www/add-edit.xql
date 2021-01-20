<?xml version="1.0"?>
<queryset>

<fullquery name="contact_select">      
      <querytext>
    select c.contact_id,
        family_name,
        given_name,
        middle_name,
        formatted_name,
        preferred_given_name,
        title,
        affix,
        suffix,
        email,
        company_name,
        company_type_id,
        category_id,
        notes
    from contacts c
    where c.contact_id = :contact_id
      </querytext>
</fullquery>

 
<fullquery name="get_company_types">      
      <querytext>
      select company_type_name, company_type_id from cn_company_types
      </querytext>
</fullquery>

 
<fullquery name="get_categories">      
      <querytext>
      select category_name, category_id from contact_categories
      </querytext>
</fullquery>

 
</queryset>
