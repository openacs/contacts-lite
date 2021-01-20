select acs_sc_impl__new(
	   'FtsContentProvider',		-- impl_contract_name
           'contact',				-- impl_name
	   'contacts'				-- impl_owner_name
);

select acs_sc_impl_alias__new(
           'FtsContentProvider',		-- impl_contract_name
           'contact',           			-- impl_name
	   'datasource',			-- impl_operation_name
	   'contacts__datasource',     		-- impl_alias
	   'TCL'				-- impl_pl
);

select acs_sc_impl_alias__new(
           'FtsContentProvider',		-- impl_contract_name
           'contact',          			-- impl_name
	   'url',				-- impl_operation_name
	   'contacts__url',			-- impl_alias
	   'TCL'				-- impl_pl
);


CREATE OR REPLACE FUNCTION contacts__itrg () RETURNS trigger AS $$
BEGIN
    perform search_observer__enqueue(new.contact_id,'INSERT');
    return new;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION contacts__dtrg () RETURNS trigger AS $$
BEGIN
    perform search_observer__enqueue(old.contact_id,'DELETE');
    return old;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION contacts__utrg () RETURNS trigger AS $$
BEGIN
    perform search_observer__enqueue(old.contact_id,'UPDATE');
    return old;
END;
$$ LANGUAGE plpgsql;


create trigger contacts__itrg after insert on contacts
for each row execute procedure contacts__itrg (); 

create trigger contacts__dtrg after delete on contacts
for each row execute procedure contacts__dtrg (); 

create trigger contacts__utrg after update on contacts
for each row execute procedure contacts__utrg (); 





