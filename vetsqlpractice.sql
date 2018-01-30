--Extract information on pets names and owner names side-by-side 

SELECT p.name, o.name
FROM pets p, owners o
WHERE p.ownerid=o.ownerid;

--Find out which pets from this clinic had procedures performed

select petid, name
from pets
where petid in (select petid from procedurehistory);

--Match up all procedures performed to their descriptions

select *
from procedurehistory h, proceduredetails d
where h.proceduretype=d.proceduretype
and h.proceduresubcode=d.proceduresubcode;

/*extract a table of individual costs incurred by owners of
pets from the clinic in question*/

select o.name, o.ownerid, d.price
from owners o, pets p, procedurehistory h, proceduredetails d
where o.ownerid=p.ownerid and p.petid=h.petid
and h.proceduretype=d.proceduretype and h.proceduresubcode=d.proceduresubcode
order by 1, 2;

--how many pets from each city?

select city, count(*)
from pets left join owners using(ownerid)
group by city;

-- average price of procedure by kind of pet

select kind, avg(price)
from procedurehistory left join pets using(petid)
  join proceduredetails using(proceduretype, proceduresubcode)
group by kind
order by 2 desc;

/*Why there are procedures w/ NULL kind?
I ran the below query and found that there are petid's in procedurehistory 
that do not appear in pets table*/

select *
from procedurehistory left join pets using(petid);

--what are the top 5 pet names?

select name, count(distinct petid)
from pets
group by name
order by 2 desc
limit 5;



