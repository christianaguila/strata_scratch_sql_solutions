/* Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email

Find libraries who haven't provided the email address in circulation year 2016 but their notice preference definition is set to email.
Output the library code.
 */



SELECT DISTINCT(home_library_code) AS home_library_code
FROM library_usage
WHERE circulation_active_year = 2016 AND
    notice_preference_definition = 'email' AND 
    provided_email_address = 'FALSE'