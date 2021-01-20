-- @cvs-id:$Id$

CREATE TABLE company_types (
    company_type_id                  integer
                                     constraint company_types_pk
                                       primary key, 
    company_type_name                varchar2 (40)
                                     constraint company_type_name_uq
                                       unique
                                     constraint company_type_name_nn
                                       not null
);


COMMENT ON TABLE company_types IS '
This is a lookup table displaying company types.
';

COMMENT ON COLUMN company_types.company_type_id IS '
Primary key.
';

COMMENT ON COLUMN company_types.company_type_name IS '
Pretty name.
';
