# Hotel Booking Demand — Data Dictionary

## Purpose

This document defines the columns in the `hotel_bookings` table, including their data types, meanings, common values or ranges, and important notes or limitations.

## Columns

| Column | Data Type | Description | Common Values / Range | Notes |
|---|---|---|---|---|
| `hotel` | `TEXT` | Type of hotel associated with the booking | `City Hotel`, `Resort Hotel` | Identifies the hotel category |
| `is_canceled` | `INTEGER` | Indicates whether the booking was cancelled | `0`, `1` | `0` = not cancelled; `1` = cancelled |
| `lead_time` | `INTEGER` | Number of days between booking date and arrival date | `0`–`737` | Higher values indicate bookings made further in advance |
| `arrival_date_year` | `INTEGER` | Year of the scheduled arrival | `2015`, `2016`, `2017` | Part of the arrival date |
| `arrival_date_month` | `TEXT` | Month of the scheduled arrival | January–December | Stored as text |
| `arrival_date_week_number` | `INTEGER` | Week number of the year for the scheduled arrival | `1`–`53` | Dataset's week-number field |
| `arrival_date_day_of_month` | `INTEGER` | Day of the month of the scheduled arrival | `1`–`31` | Combined with year and month to represent arrival date |
| `stays_in_weekend_nights` | `INTEGER` | Number of weekend nights included in the booking | `0`–`19` | Weekend night is defined by the dataset |
| `stays_in_week_nights` | `INTEGER` | Number of week nights included in the booking | `0`–`50` | Weeknight count for the stay |
| `adults` | `INTEGER` | Number of adults included in the booking | `0`–`55` | Dataset contains some unusual values; should be interpreted carefully |
| `children` | `INTEGER` | Number of children included in the booking | `0`–`10` or `NULL` | Raw dataset contained `NA`; converted to NULL. Value `10` was retained as an unusual but not automatically invalid value |
| `babies` | `INTEGER` | Number of babies included in the booking | `0`–`10` | Number of babies associated with the booking |
| `meal` | `TEXT` | Meal plan selected for the booking | `BB`, `FB`, `HB`, `SC`, `Undefined` | `Undefined` is a dataset value and was retained |
| `country` | `TEXT` | Country of origin of the guest | Country codes such as `PRT`, `GBR`, `FRA` | ISO-style country codes; NULL values exist |
| `market_segment` | `TEXT` | Market segment through which the booking was made | `Online TA`, `Offline TA/TO`, `Groups`, `Direct`, `Corporate`, `Complementary`, `Aviation`, `Undefined` | Describes the booking's market segment |
| `distribution_channel` | `TEXT` | Distribution channel through which the booking was made | `TA/TO`, `Direct`, `Corporate`, `GDS`, `Undefined` | Distinct from market segment |
| `is_repeated_guest` | `INTEGER` | Indicates whether the guest is identified as a repeat guest | `0`, `1` | `0` = not a repeated guest; `1` = repeated guest |
| `previous_cancellations` | `INTEGER` | Number of previous bookings that were cancelled by the guest | `0`–`26` | Refers to the guest's historical booking record, not the current booking |
| `previous_bookings_not_canceled` | `INTEGER` | Number of previous bookings that were not cancelled by the guest | `0`–`27` | Guest booking history; does not represent occupancy or nights for the current booking |
| `reserved_room_type` | `TEXT` | Room type originally reserved | Room codes such as `A`, `B`, `C`, `D`, `E`, `F`, `G`, `H`, `L`, `P` | Room codes are not descriptive room names |
| `assigned_room_type` | `TEXT` | Room type ultimately assigned | Room codes such as `A`, `B`, `C`, `D`, `E`, `F`, `G`, `H`, `L`, `P` | Can differ from the originally reserved room type |
| `booking_changes` | `INTEGER` | Number of changes made to the booking | `0`–`21` | Measures changes associated with the current booking |
| `deposit_type` | `TEXT` | Deposit/payment guarantee type associated with the booking | `No Deposit`, `Non Refund`, `Refundable` | Useful for cancellation analysis |
| `agent` | `INTEGER` | ID of the travel agent associated with the booking | Numeric agent IDs; `NULL` | Literal `"NULL"` values in the raw data were converted to PostgreSQL NULL |
| `company` | `INTEGER` | ID of the company associated with the booking | Numeric company IDs; `NULL` | Literal `"NULL"` values in the raw data were converted to PostgreSQL NULL |
| `days_in_waiting_list` | `INTEGER` | Number of days the booking was on the waiting list | `0`–`391` | Measures waiting-list duration |
| `customer_type` | `TEXT` | Type of customer associated with the booking | `Transient`, `Contract`, `Transient-Party`, `Group` | Categorizes the customer/booking type |
| `adr` | `NUMERIC` | Average Daily Rate associated with the booking | Numeric monetary values; includes `0` and some unusual values | ADR is a pricing metric, not a direct realized-revenue field |
| `required_car_parking_spaces` | `INTEGER` | Number of car parking spaces required by the guest | `0`–`8` | Number of requested parking spaces |
| `total_of_special_requests` | `INTEGER` | Total number of special requests made by the guest | `0`–`5` | Includes requests recorded by the dataset |
| `reservation_status` | `TEXT` | Final reservation status recorded in the dataset | `Check-Out`, `Canceled`, `No-Show` | Describes the reservation's final recorded status |
| `reservation_status_date` | `DATE` | Date on which the reservation status was recorded/changed | Date values from `2014-10-17` onward | Converted from the raw `MM/DD/YYYY` format and stored as PostgreSQL `DATE` |

## Data Interpretation Notes

- Unusual values are not automatically treated as invalid values.
- The dataset does not contain a unique booking ID, guest ID, customer ID, or reservation ID.
- `previous_bookings_not_canceled` represents historical guest booking activity and does not represent current booking occupancy.
- `agent` and `company` contain NULL values where no corresponding ID was recorded.
- `children` contains NULL values where the original dataset contained `NA`.
- `meal = 'Undefined'` is retained as a valid dataset category.
- `adr` represents Average Daily Rate and should not automatically be interpreted as realized revenue.