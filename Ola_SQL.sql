create database Ola;
use ola;
#1. Retrieve all successful bookings:
create view Successful_Bookings as 
select * from Bookings where Booking_Status="Success";
select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance from Bookings group by Vehicle_Type;
select * from average_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from Bookings where Booking_Status="Canceled by Customer";
select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view top5_highest_number_of_rides as
select Customer_ID,count(Booking_ID) as total_rides from Bookings group by Customer_ID order by total_rides desc limit 5;
select * from top5_highest_number_of_rides;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as 
select count(*) from Bookings where Canceled_Rides_by_Driver="Personal & Car related issue";
select * from rides_cancelled_by_drivers;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_mini_driver_ratings as
select max(Driver_Ratings) as max_rating,min(Driver_Ratings) as min_rating from Bookings where Vehicle_Type="Prime Sedan";
select * from max_mini_driver_ratings;

#7. Retrieve all rides where payment was made using UPI:
create view rides_payment_upi as
select * from Bookings where Payment_Method="UPI";
select * from rides_payment_upi;

#8. Find the average customer rating per vehicle type:
create view avg_customer_rating as 
select Vehicle_Type,avg(Customer_Rating) as avg_customer_rating from Bookings group by Vehicle_Type;
select * from avg_customer_rating;


#9. Calculate the total booking value of rides completed successfully:
create view total_booking_value_rides as
select sum(Booking_Value) as total_successful_ride_value from Bookings where Booking_Status="Success";
select * from total_booking_value_rides;


#10. List all incomplete rides along with the reason:
select * from Bookings;
create view incomplete_rides_reason as
select Booking_ID,Incomplete_Rides_Reason from Bookings where Incomplete_Rides="Yes";
select * from incomplete_rides_reason;