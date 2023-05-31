DROP TABLE IF EXISTS configuration;
DROP TABLE IF EXISTS application;
DROP TABLE IF EXISTS organization;
DROP TABLE IF EXISTS applicationtype;

CREATE TABLE organization(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(255) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE applicationtype(
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(255) NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE application(
   id INT GENERATED ALWAYS AS IDENTITY,
   applicationtype_id INT,
   name VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   CONSTRAINT fk_application_type
      FOREIGN KEY(applicationtype_id) 
	  REFERENCES applicationtype(id)
);

CREATE TABLE configuration(
   id INT GENERATED ALWAYS AS IDENTITY,
   application_id INT,
   organization_id INT,
   url VARCHAR(255) NOT NULL,
   secret VARCHAR(255) NOT NULL,
   client VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   
   CONSTRAINT fk_application
      FOREIGN KEY(application_id) 
	  REFERENCES application(id),
    
   CONSTRAINT fk_organization
      FOREIGN KEY(organization_id) 
	  REFERENCES organization(id)
);


ALTER TABLE public.organization  REPLICA IDENTITY FULL;
ALTER TABLE public.applicationtype  REPLICA IDENTITY FULL;
ALTER TABLE public.configuration  REPLICA IDENTITY FULL;
ALTER TABLE public.configuration  REPLICA IDENTITY FULL;
