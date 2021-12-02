How to use what have:

Use Powershell/CmdLine. 

cd to Census_Project directory. (Where docker-compose.yml is)

run command 'docker compose up'

(the above sets up nginx and MySQL. Will run until stopped with Ctrl-C

In another command prompt, cd to Census_Project \ app \ public

run command 'python3 csv_load.py tables_list.csv' 

('tables_list.csv' should be in same folder
as csv_load.py. If moved and throws error, add this line in 'def main():' above 'empdata =...' : 
	file_place = <filepath>\\ + str(arg[0])
then change 'empdata=...' to: 
	empdata = pd.read_csv(file_place, index_col=False, delimiter=',')  

(the above loads the tables and add the data to them, removing them if they already existed. 
Watch for key dependencies. The former code is fixed, but adding new tables 
and potentially cycling dependies may lead to problems)

now, run command 'flask run'

open a browser and go to 'localhost:5000'. 

A page should show which says 'Click here to go to form'. Click this.

You should now be at 'localhost:5000/form' or '127.0.0.1:5000/form'

Fill out the inputs. They currently only accept the actual column names for the tables.

Example input: SELECT: id, place_name
                              FROM:     income_by_place

Hit submit. You should be taken to 127.0.0.1:5000/form-handler. A table should be displayed showing the values chosen 
from the table given. Hit download CSV and a CSV of the table shown will be downloaded.

Note: The <b></b> still show in the downloaded CSV column names. 