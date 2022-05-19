create database if not exists flightsDB;
use flightsDB;

-- 1. Create a Table Flights with schemas of Table

drop table if exists Flights;
create table if not exists Flights (ID int, YEAR int, MONTH int, 
DAY int, DAY_OF_WEEK int, AIRLINE varchar(4), FLIGHT_NUMBER int,
TAIL_NUMBER varchar(10), ORIGIN_AIRPORT varchar(5),	DESTINATION_AIRPORT varchar(5),	
SCHEDULED_DEPARTURE	int, DEPARTURE_TIME int, DEPARTURE_DELAY int, TAXI_OUT int,	
WHEELS_OFF int,	SCHEDULED_TIME int, ELAPSED_TIME int, AIR_TIME int,	DISTANCE int, 
WHEELS_ON int, TAXI_IN int, SCHEDULED_ARRIVAL int, ARRIVAL_TIME int, ARRIVAL_DELAY int,	
DIVERTED int, CANCELLED	int, CANCELLATION_REASON varchar(2), AIR_SYSTEM_DELAY int, 
SECURITY_DELAY int, AIRLINE_DELAY int, LATE_AIRCRAFT_DELAY int, WEATHER_DELAY int, PRIMARY KEY(ID));

-- 2. Insert all records into flights table. Use dataset Flights_Delay.csv. 
-- 	  Write a MySQL Queries to display the results
SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE 'D:/Data/Flights_Delay.csv' INTO TABLE Flights
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 3. Average Arrival delay caused by airlines
select AIRLINE, avg(ARRIVAL_DELAY) as Average from Flights 
group by AIRLINE order by Average;

-- 4.Display the Day of Month with AVG Delay [Hint: Add Count() of Arrival & Departure Delay]

-- 5. Analysis for each month with total number of cancellations.
select MONTH, sum(CANCELLED) as Cancellation from Flights group by MONTH order by MONTH;

-- 6. Find the airlines that make maximum number of cancellations
select AIRLINE, sum(CANCELLED) as Cancellation from Flights group by AIRLINE 
order by Cancellation desc;

-- 7.Finding the Busiest Airport [Hint: Find Count() of origin airport and destination airport]

-- 8. Find the airlines that make maximum number of Diversions [Hint: Diverted = 1 indicate Diversion]
select AIRLINE, sum(DIVERTED) as Diversions from Flights group by AIRLINE order by Diversions desc;

-- 9.Finding all diverted Route from a source to destination Airport & which route is the most diverted route.
select ORIGIN_AIRPORT,DESTINATION_AIRPORT,count(DIVERTED) as diverted from Flights group by diverted order by ORIGIN_AIRPORT,DESTINATION_AIRPORT;

-- 10.Finding all Route from origin to destination Airport & which route got delayed. 

-- 11.Finding the Route which Got Delayed the Most [Hint: Route include Origin Airport and Destination Airport, Group By Both ]

-- 12.Finding AIRLINES with its total flight count, total number of flights arrival delayed by more than 30 Minutes, 
-- % of such flights delayed by more than 30 minutes when it is not Weekends with minimum count of flights from Airlines by more than 10. 
-- Also Exclude some of Airlines 'AK', 'HI', 'PR', 'VI' and arrange output in descending order by % of such count of flights.



