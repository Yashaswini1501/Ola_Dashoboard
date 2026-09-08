# Ola_Dashoboard
End-to-end data analytics project using SQL and Power BI to analyze OLA ride bookings, revenue, cancellations, vehicle performance, customer behavior, ride distance, and driver/customer ratings.
# 🚖 OLA Data Analytics Project — SQL & Power BI

## 📌 Project Overview

This project is an end-to-end **Data Analytics project** based on OLA ride-booking data for Bengaluru.

The objective of this project is to analyze ride-booking patterns, booking status, vehicle performance, revenue, cancellations, customer behavior, ride distance, and driver/customer ratings.

The project uses:

* **SQL** for data analysis and business queries
* **Power BI** for interactive dashboards and visualization
* **Excel/CSV dataset** for data preparation and analysis

The project demonstrates how raw ride-booking data can be transformed into meaningful business insights to support data-driven decision-making.

---

## 🎯 Business Objectives

The major objectives of this analysis are:

1. Analyze the overall ride-booking volume.
2. Understand successful and cancelled bookings.
3. Identify the most frequently used vehicle types.
4. Analyze ride distance across different vehicle types.
5. Understand customer and driver cancellation patterns.
6. Analyze revenue generated from successful rides.
7. Identify top customers based on booking activity and booking value.
8. Analyze payment methods used by customers.
9. Evaluate driver and customer ratings.
10. Identify incomplete rides and their reasons.
11. Build an interactive Power BI dashboard for business reporting.

---

## 📊 Dataset

The dataset contains OLA ride-booking information for Bengaluru.

The analysis uses the following fields:

| Column                        | Description                       |
| ----------------------------- | --------------------------------- |
| `Date`                        | Date of the booking               |
| `Time`                        | Time of the booking               |
| `Booking_ID`                  | Unique booking identifier         |
| `Booking_Status`              | Status of the booking             |
| `Customer_ID`                 | Unique customer identifier        |
| `Vehicle_Type`                | Type of vehicle booked            |
| `Pickup_Location`             | Ride pickup location              |
| `Drop_Location`               | Ride drop location                |
| `V_TAT`                       | Vehicle Turnaround Time           |
| `C_TAT`                       | Customer Turnaround Time          |
| `cancelled_Rides_by_Customer` | Customer cancellation information |
| `cancelled_Rides_by_Driver`   | Driver cancellation information   |
| `Incomplete_Rides`            | Whether the ride was incomplete   |
| `Incomplete_Rides_Reason`     | Reason for incomplete ride        |
| `Booking_Value`               | Value of the booking              |
| `Payment_Method`              | Payment method used               |
| `Ride_Distance`               | Distance travelled                |
| `Driver_Ratings`              | Driver rating                     |
| `Customer_Rating`             | Customer rating                   |

---

## 🛠️ Tools & Technologies

### SQL

Used for:

* Data querying
* Aggregations
* Filtering
* Grouping
* Ranking
* Creating analytical views
* Business analysis

### Power BI

Used for:

* Data visualization
* Interactive dashboards
* KPI analysis
* Trend analysis
* Customer analysis
* Revenue analysis
* Cancellation analysis
* Rating analysis

### Data

* OLA ride-booking dataset
* Bengaluru city
* One-month booking period
* Approximately 100,000 records

---

# 🗄️ SQL Analysis

The project contains 10 major SQL business questions.

### 1. Retrieve all successful bookings

```sql
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';
```

### 2. Average ride distance for each vehicle type

```sql
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
```

### 3. Total number of customer-cancelled rides

```sql
SELECT COUNT(*)
FROM bookings
WHERE Booking_Status = 'cancelled by Customer';
```

### 4. Top 5 customers by number of rides

```sql
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

### 5. Driver cancellations due to personal/car-related issues

```sql
SELECT COUNT(*)
FROM bookings
WHERE cancelled_Rides_by_Driver =
'Personal & Car related issue';
```

### 6. Maximum and minimum driver ratings for Prime Sedan

```sql
SELECT
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

### 7. Retrieve rides paid using UPI

```sql
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';
```

### 8. Average customer rating by vehicle type

```sql
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
```

### 9. Total booking value from successful rides

```sql
SELECT
    SUM(Booking_Value) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
```

### 10. Retrieve incomplete rides and their reasons

```sql
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';
```

---

# 📈 Power BI Dashboard

The Power BI dashboard is divided into several analytical sections.

## 1. Overall Analysis

### Ride Volume Over Time

A time-series visualization showing the number of rides across different dates.

### Booking Status Breakdown

Shows the distribution of:

* Successful bookings
* Customer cancellations
* Driver cancellations
* Incomplete rides
* Other booking statuses

---

## 2. Vehicle Type Analysis

### Top 5 Vehicle Types by Ride Distance

Ranks vehicle types based on the total ride distance covered.

### Average Customer Rating by Vehicle Type

Compares the average customer rating received by different vehicle types.

---

## 3. Revenue Analysis

### Revenue by Payment Method

Analyzes total booking revenue based on payment methods such as:

* Cash
* UPI
* Credit Card
* Other available payment methods

### Top 5 Customers by Total Booking Value

Identifies customers contributing the highest booking value.

### Ride Distance Distribution Per Day

Analyzes the distribution of ride distances across different dates.

---

## 4. Cancellation Analysis

### Customer Cancellation Reasons

Analyzes why customers cancel rides, including:

* Driver is not moving towards pickup location
* Driver asked to cancel
* AC is not working
* Change of plans
* Wrong address

### Driver Cancellation Reasons

Analyzes driver cancellation reasons such as:

* Personal & car-related issues
* Customer-related issues
* Customer coughing/sick
* More than permitted people

---

## 5. Ratings Analysis

### Driver Rating Distribution

Analyzes the distribution of driver ratings across bookings and vehicle types.

### Customer Rating Distribution

Analyzes customer ratings across different vehicle types.

### Customer vs Driver Ratings

A comparison of customer ratings and driver ratings to identify possible relationships between the two.

---

# 📊 Dashboard Structure

The Power BI report is organized into the following sections:

```text
OLA Analytics Dashboard
│
├── Overall
│   ├── Ride Volume Over Time
│   └── Booking Status Breakdown
│
├── Vehicle Type
│   ├── Top 5 Vehicle Types by Ride Distance
│   └── Average Customer Ratings
│
├── Revenue
│   ├── Revenue by Payment Method
│   ├── Top 5 Customers by Booking Value
│   └── Ride Distance Distribution
│
├── Cancellation
│   ├── Customer Cancellation Reasons
│   └── Driver Cancellation Reasons
│
└── Ratings
    ├── Driver Ratings
    ├── Customer Ratings
    └── Customer vs Driver Ratings
```

---

# 💡 Key Business Questions

This project answers important business questions such as:

* What percentage of bookings are successful?
* Which vehicle types generate the most ride distance?
* What are the major reasons customers cancel rides?
* Why do drivers cancel rides?
* Which customers generate the highest booking value?
* Which payment methods are most commonly used?
* Which vehicle types receive the highest customer ratings?
* What is the average ride distance by vehicle type?
* How does ride volume change over time?
* What are the major reasons for incomplete rides?

---

# 📁 Project Structure

```text
OLA-Data-Analytics-SQL-PowerBI/
│
├── Dataset/
│   └── ola_bookings.csv
│
├── SQL/
│   └── ola_analysis.sql
│
├── PowerBI/
│   └── OLA_Dashboard.pbix
│
├── Dashboard/
│   └── dashboard_screenshot.png
│
└── README.md
```

---

# 🔄 Project Workflow

```text
Raw OLA Dataset
       ↓
Data Cleaning & Preparation
       ↓
Exploratory Data Analysis
       ↓
SQL Business Analysis
       ↓
Power BI Data Modeling
       ↓
Dashboard Development
       ↓
Business Insights
       ↓
Data-Driven Decision Making
```

---

# 📌 Expected Outcomes

This project provides a comprehensive view of OLA's ride-booking operations.

The analysis helps understand:

* Ride demand
* Booking success rate
* Cancellation behavior
* Vehicle performance
* Revenue contribution
* Customer behavior
* Payment preferences
* Ride distances
* Driver performance
* Customer satisfaction

---

# 🚀 Skills Demonstrated

Through this project, the following skills are demonstrated:

* SQL
* Data Cleaning
* Data Analysis
* Exploratory Data Analysis
* Data Visualization
* Power BI
* Dashboard Development
* Business Intelligence
* KPI Analysis
* Aggregation & Filtering
* Customer Analytics
* Revenue Analytics
* Cancellation Analysis
* Data Storytelling

---

# 👨‍💻 Author

**Yashaswini Narayana**

Data Analytics | SQL | Power BI | Data Visualization

---

## ⭐ Project

If you find this project useful, consider giving the repository a ⭐ on GitHub.

---

## 📜 Disclaimer

This is an analytics/portfolio project using a project dataset. It is intended for educational and demonstration purposes and should not be interpreted as official OLA business data.
