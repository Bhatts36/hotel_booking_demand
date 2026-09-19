# Data Quality Analysis

## Purpose

This analysis checks the cleaned hotel booking dataset for missing values, unusual values, repeated records, and other potential data-quality issues.

The goal is to identify and quantify unusual observations without automatically removing valid business data.

---

## Q1. NULL Values

Checked for NULL values in important columns:

- `agent`
- `children`
- `company`
- `country`

Used `SUM(CASE WHEN...)` to count NULL values in each column.

### Key Point

NULL values were quantified rather than automatically treated as errors because missing values can be legitimate in the original booking data.

---

## Q2. Undefined Market Segments

Checked for bookings where:

`market_segment = 'Undefined'`

This identifies records where the market segment was not assigned to a standard category.

---

## Q3. Undefined Market Segment or Distribution Channel

Checked for bookings where either:

- `market_segment = 'Undefined'`
- `distribution_channel = 'Undefined'`

Used `OR` to identify bookings meeting either condition.

### Key Point

`OR` allows either condition to be true for a booking to be included.

---

## Q4. Repeated Booking Combinations

Checked for repeated combinations of:

- `hotel`
- `reservation_status`
- `reservation_status_date`

Used:

- `GROUP BY` to create groups based on multiple columns
- `COUNT(*)` to count records in each group
- `HAVING COUNT(*) > 1` to identify repeated combinations

### Key Point

These are repeated combinations, not confirmed duplicate bookings.

The dataset does not contain a unique booking, guest, or customer ID, so repeated combinations cannot automatically be classified as duplicate bookings.

---

## Q5. Extreme Adult Counts

Checked for bookings where:

`adults > 10`

This was used to identify unusually large adult guest counts.

### Key Point

Unusual values were retained rather than automatically deleted because they may represent data-entry issues, unusual bookings, or other legitimate cases that require further investigation.

---

## Q6. Extreme Guest Counts

Checked for bookings where either:

- `adults > 10`
- `children > 5`

Used `OR` to identify bookings meeting either condition.

---

## Q7. Negative ADR

Checked for bookings where:

`adr < 0`

The analysis calculated:

- Number of bookings with negative ADR
- Minimum ADR value

### Key Point

Negative ADR values are unusual and should be investigated rather than automatically removed.

---

## Q8. Zero ADR

Checked for bookings where:

`adr = 0`

### Finding

There are **1,959 bookings with ADR = 0**.

The percentage of total bookings was also calculated.

### Key Point

Zero ADR values are unusual but were not automatically removed because they may have a business explanation or represent specific booking situations.

---

## Q9. Zero-Night Bookings

Checked for bookings where:

`stays_in_weekend_nights + stays_in_week_nights = 0`

This identifies bookings with no recorded overnight stay.

### Key Point

Zero-night bookings should be investigated because they may represent cancellations, same-day bookings, data-entry issues, or other booking situations.

---

## Q10. Extreme Lead Time

Checked for bookings where:

`lead_time > 365`

This identifies bookings made more than one year before arrival.

### Key Point

A lead time greater than one year is unusual but not necessarily invalid. These records were retained for further analysis.

---

# Overall Data Quality Findings

The dataset contains several types of unusual or missing data:

- NULL values in several columns
- `Undefined` values in categorical fields
- Repeated combinations of booking attributes
- Unusually high guest counts
- Negative ADR values
- A substantial number of zero-ADR bookings
- Zero-night bookings
- Very long booking lead times

These observations were **identified and quantified rather than automatically deleted**.

Further analysis should determine whether unusual values represent genuine business cases, data-entry issues, or characteristics of the original dataset.