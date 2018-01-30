CREATE TABLE pets (
    petid varchar,
    name varchar,
    kind varchar,
    gender varchar,
    age int,
    ownerid varchar
);

COPY pets FROM 's3://<bucket>/load/Pets.csv'
credentials 'aws_access_key_id=<access_key_id>;aws_secret_access_key=<secret_access_key>' 
csv  IGNOREHEADER 1;

CREATE TABLE owners (
    ownerid varchar,
    name varchar,
    surname varchar,
    streetaddress varchar,
    city varchar,
    state varchar(2),
    statefull varchar,
    zipcode varchar
);

COPY owners FROM 's3://<bucket>/load/Owners.csv'
credentials 'aws_access_key_id=<access_key_id>;aws_secret_access_key=<secret_access_key>' 
csv  IGNOREHEADER 1;



CREATE TABLE proceduredetails (
    proceduretype varchar,
    proceduresubcode varchar,
    description varchar,
    price float
);

COPY proceduredetails FROM 's3://<bucket>/load/ProceduresDetails.csv'
credentials 'aws_access_key_id=<access_key_id>;aws_secret_access_key=<secret_access_key>' 
csv  IGNOREHEADER 1;


CREATE TABLE procedurehistory (
    petid varchar,
    proceduredate date,
    proceduretype varchar,
    proceduresubcode varchar
);

COPY procedurehistory FROM 's3://<bucket>/load/ProceduresHistory-1.csv'
credentials 'aws_access_key_id=<access_key_id>;aws_secret_access_key=<secret_access_key>' 
csv  IGNOREHEADER 1;

vacuum;
analyze;
