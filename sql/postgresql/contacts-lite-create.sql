-- @cvs-id:$Id$	

create table cn_company_types (
    company_type_id     integer
                        constraint company_types_pk
                            primary key, 
    company_type_name   varchar (40)
                        constraint company_type_name_uq
                            unique
                        constraint company_type_name_nn
                            not null
);

comment on table cn_company_types is '
This is a lookup table displaying company types.
';

comment on column cn_company_types.company_type_id is '
Primary key.
';

comment on column cn_company_types.company_type_name is '
Pretty name.
';


-- create the categories. 
-- 
\i contact-category.sql

create table contacts (
    contact_id           integer 
                         constraint contacts_contact_id_pk
                             primary key
                         constraint contacts_contact_id_fk
                             references acs_objects(object_id)
                         on delete cascade,
    family_name          varchar (100),
    given_name           varchar (100),
    middle_name          varchar (100),
    formatted_name       varchar (200),
    preferred_given_name varchar (100),
    affix                varchar (25),
    email                varchar (100),
    company_name         varchar (100),
    company_type_id      integer
                         constraint contacts_company_typ_id_fk
                             references cn_company_types(company_type_id),
    suffix               varchar (40),
    category_id          integer 
                         constraint contacts_category_fk
                             references contact_categories (category_id),
    notes                varchar (4000),
    title                varchar (100)
);

create index contacts_email_ix on contacts (email);

comment on table contacts is '
This is the main table for contacts.
';

comment on column contacts.contact_id is '
Primary key.
';

comment on column contacts.family_name is '
The last name.
';

comment on column contacts.given_name is '
Given or first name.
';

comment on column contacts.middle_name is '
This could also be more than one name.
';

comment on column contacts.formatted_name is '
This is the name as it might appear in a letter.
';

comment on column contacts.preferred_given_name is '
';

comment on column contacts.affix is '
    Mr. Mrs. etc.
';


-- plsql
\i contacts-plsql.sql

-- other tables
\i cn-addresses.sql
\i cn-phones.sql
--\i contacts-sc-create.sql
