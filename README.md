# Blog Scheduler
Generates a blog schedule for students to present on weekdays.

* `ruby main.rb` - run and then paste in a list of students
* `cat student_roster.txt | ruby main.rb` - redirect a list of students from file
* `ruby main.rb fake` - use fake names

* Assumes 15 weeks
* Assumes 3 students per day
* Assumes no one presents Saturdays and Sundays

Expects to receive input from STDIN with names separated by line breaks.

The program will prompt for you to paste in student names if STDIN is
not redirected into the program.

The program will use Faker to generate 13 random student names if you
invoke it as `ruby main.rb fake`.

### Paste Into Google Spreadsheet
I found this helpful answer explaining how to take the output of this
program and paste it into a Google Spreadsheet.

https://webapps.stackexchange.com/questions/58036/how-to-paste-a-comma-separated-string-over-multiple-cells-in-google-spreadsheets

* Open a spreadsheet in Google Sheets.
* Paste the data you want to split into columns.
* In the bottom right corner of your data, click the Paste icon.
* Click Split text to columns. Your data will split into different columns.
* To change the delimiter, in the separator box, click
