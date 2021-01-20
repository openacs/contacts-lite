create or replace view agt_info_vw as 
select c.title,
        c.given_name,
	c.family_name,
	c.middle_name,
	c.preferred_given_name,
	c.formatted_name,
	c.affix,
	c.company_name,
    c.email,
    t.company_type_name,
	c.given_name || ' ' || c.family_name as pretty_name,
    a.delivery_address,
    a.municipality,
    a.region,
    a.postal_code,
    addt.description as add_desc,
    coun.default_name as country,
    pn.phone_number_id as phone_number_id,
    pn.phone_number as phone_number,
    pn.best_contact_time as best_contact_time,
    pt.description as phone_type
    from contacts c left join cn_company_types t on (c.company_type_id = t.company_type_id),
    cn_addresses a left join cn_address_types addt on (a.address_type_id = addt.address_type_id), 
    cn_phone_numbers pn left join cn_phone_types pt on (pn.phone_type_id = pt.phone_type_id),
    countries coun
    where a.contact_id = c.contact_id
    and a.country_code = coun.iso
    and pn.contact_id = c.contact_id
    and trim(pt.description) = 'Business - Primary'
    and trim(addt.description) = 'Primary Business'