-- @cvs-id:$Id$	

-- this used to be an acs_derived table

@@company_types.sql

create table contact_categories (
    category_id integer
    constraint contact_categories_pk
        primary key,
    category_name varchar2(100)
    constraint contact_categories_nn
        not null
);

create table contacts (
    contact_id                       integer 
                                    constraint contacts_contact_id_pk
                                      primary key
                                    constraint contacts_contact_id_fk
                                      references acs_objects(object_id),
    family_name                     varchar2 (100),
    given_name                      varchar2 (100),
    middle_name                     varchar2 (100),
    formatted_name                  varchar2 (200),
    preferred_given_name            varchar2 (100),
    affix                           varchar2 (25),
    email                           varchar2(100),
    company_name                    varchar2 (100),
    company_type_id                 integer
                                    constraint contacts_company_typ_id_fk
                                       references company_types(company_type_id),
    suffix                          varchar2(40),
    category_id                     integer 
                                    constraint contacts_category_fk
                                      references contact_categories (category_id),
    notes                           varchar2 (4000),
    title                           varchar2(100)
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
@@contacts-plsql.sql

-- other tables
@@cn-addresses.sql
@@cn-phones.sql
@@contact-category.sql