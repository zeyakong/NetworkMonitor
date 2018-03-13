///////////CHANGE LOG///////////////

Several changes to the following tables:

TABLE NAME		CHANGES
---------------------------------------------------------------------------------------------------

connections 	 	+ Added id for ease of use later
			+ Changed data type of 'weight' from VARCHAR to TINYINT (Whoops)

---------------------------------------------------------------------------------------------------

relay_stations 		+ Changed column 'station_status' to 'is_active'
			  for naming consistency.
			+ Added column 'transaction_limit'
			+ Added column 'region'
			+ Column 'station_type' is used with the following key
			  (TYPE 0 = RELAY STATION, TYPE 1 = GATEWAY, TYPE 2 = P. CENTER)

---------------------------------------------------------------------------------------------------

stores			+ Added column 'region'


---------------------------------------------------------------------------------------------------

			!!!---IMPORTANT---!!!!

transactions		+ Added columns 'current_position_ip' and 'current_destination_ip'
			  These will be used to save the transaction's state in the database
			  when the user logs out or closes the window. (Whenever we do the
			  large scale save). These can contain either store or station ips.

			!!!---IMPORTANT---!!!!

			+ Changed column 'transaction_sent' to 'transaction_date_sent'
			+ Changed column 'transaction_responded' to 'transaction_date_responded'

---------------------------------------------------------------------------------------------------

**Data for each of these tables was modified to be complient with all the new changes.	