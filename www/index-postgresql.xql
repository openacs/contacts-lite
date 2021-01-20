<?xml version="1.0"?>

<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="contacts_select">      
      <querytext>
    select contact_id,
           coalesce(family_name,family_name,'None') as family_name,
           coalesce(given_name,given_name,'None') as given_name,
           middle_name,
	   company_name,
           email,
           'f' as write_p,
           'f' as delete_p,
           p.first_names || ' ' || p.last_name as owner,
           g.category_name as category
    from contacts c left join contact_categories g on (c.category_id = g.category_id),
    acs_objects o left join persons p on (o.creation_user = p.person_id)
    where c.contact_id = o.object_id
    ${search_clause}
    ${starts_with_clause}
    order by $ordering
      </querytext>
</fullquery>

<fullquery name="get_first_letters">      
      <querytext>
      
    select distinct substr(upper(family_name), 1, 1) as letter from contacts

      </querytext>
</fullquery>

 
</queryset>
