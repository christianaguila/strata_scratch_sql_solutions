/* Number Of Units Per Nationality

Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.
 */

SELECT h.nationality nationality, COUNT(DISTINCT u.unit_id
) apartment_cnt
FROM airbnb_hosts h JOIN
    airbnb_units u ON
    h.host_id = u.host_id
WHERE h.age < 30 AND u.unit_type = 'Apartment'
GROUP BY h.nationality
