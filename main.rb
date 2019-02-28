# https://webapps.stackexchange.com/questions/58036/how-to-paste-a-comma-separated-string-over-multiple-cells-in-google-spreadsheets
# Open a spreadsheet in Google Sheets.
# Paste the data you want to split into columns.
# In the bottom right corner of your data, click the Paste icon.
# Click Split text to columns. Your data will split into different columns.
# To change the delimiter, in the separator box, click

require 'pry'
require 'date'

STUDENTS = STDIN.read.split("\n")

def get_all_students
  STUDENTS.dup.shuffle!
end

def generate_schedule
  student_pool = get_all_students

  # keep track of what day we're on so we can print
  # blank lines for Saturdays and Sundays
  weekday = DateTime.new
  raise "The week should begin on Monday!" unless weekday.monday?

  # a row represents three students presenting per day
  row = []

  # 3 students a day, 5 days a week, 15 week course (over-estimation)
  total = 3 * 5 * 15

  count = 0
  while count < total
    student_pool = get_all_students if student_pool.empty?
    student = student_pool.delete_at(rand(student_pool.length)) 
 
    row << student
    count += 1

    # print out a row once there's three students assigned
    if row.length == 3
      puts row.join(", ")
      row = []
      weekday = weekday.next
      
      if weekday.saturday?
        # print newlines for saturdays and sundays
        puts
        puts

        # skip forward two days to Monday
        weekday = weekday.next.next
      end
    end
  end
end

generate_schedule
