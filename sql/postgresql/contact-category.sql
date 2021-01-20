-- @cvs-id: $Id$

-- The user will be allowed to create categories
-- To disable simply change permissions or move pages to admin/

-- Create an acs_object type
select acs_object_type__drop_type('contact_category', TRUE);
select acs_object_type__create_type (
    'contact_category',
    'Contact Category',
    'Contact Categories',
    'acs_object',
    'contact_categories',
    'category_id',
    null,
    'f',
    null,
    'acs_object__default_name'
);

DROP TABLE IF EXISTS contact_categories CASCADE;

create table IF NOT EXISTS contact_categories
(
    category_id                      integer
                                     constraint contact_categories_id_pk
				       primary key
                                     constraint contact_categories_fk
                                       references acs_objects(object_id),
    category_name                    varchar (40)
                                     constraint contact_categories_name_nn
                                       not null
);


insert into contact_categories values (acs_object__new(null,'acs_object'), 'Agents');
insert into contact_categories values (acs_object__new(null,'acs_object'), 'Employees');
insert into contact_categories values (acs_object__new(null,'acs_object'), 'Supplier');
insert into contact_categories values (acs_object__new(null,'acs_object'), 'Customer');

-- plsql

create or replace function contact_category__new (integer,varchar,integer,varchar,integer)
returns integer as '
declare
    p_category_id    alias for $1;
    p_category_name  alias for $2;
    p_creation_user  alias for $3;
    p_creation_ip    alias for $4;
    p_context_id     alias for $5;
    v_category_id    integer;
begin
    v_category_id := acs_object__new (
        p_category_id, 
        ''contact_category'',
        now(),               
        p_creation_user,     
        p_creation_ip,       
	p_context_id           
    );

    --
    insert into contact_categories 
        (category_id, category_name) 
    values 
        ( v_category_id, p_category_name );

    -- This takes care of the before seperate delete,write
    PERFORM acs_permission__grant_permission(
       v_category_id,
       p_creation_user,
       ''admin''
    );

    --
    return v_category_id;
end;' language 'plpgsql';


create or replace function contact_category__del (integer)
returns integer as '
declare
    p_category_id alias for $1;
begin
    delete from contact_categories
      where category_id = contact_category__del.p_category_id;

    perform acs_object__delete(p_category_id);
    return 0;
end;
' language 'plpgsql';


