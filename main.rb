# https://webapps.stackexchange.com/questions/58036/how-to-paste-a-comma-separated-string-over-multiple-cells-in-google-spreadsheets
# Open a spreadsheet in Google Sheets.
# Paste the data you want to split into columns.
# In the bottom right corner of your data, click the Paste icon.
# Click Split text to columns. Your data will split into different columns.
# To change the delimiter, in the separator box, click

require 'pry'
require 'date'
require 'faker'

DEFAULT_NUM_FAKE_STUDENTS = 13
STUDENTS_PER_DAY = 3
COURSE_WEEK_LENGTH = 15

def generate_random_fake_students
  DEFAULT_NUM_FAKE_STUDENTS.times.map do
    Faker::Name.name
  end
end

def get_all_students
  $students.dup.shuffle!
end

def generate_schedule
  student_pool = get_all_students

  # keep track of what day we're on so we can print
  # blank lines for Saturdays and Sundays
  weekday = DateTime.new
  raise "The week should begin on Monday!" unless weekday.monday?

  # a row represents three students presenting per day
  row = []

  # students per day * 5 days a week * weeks in course (over-estimation)
  total = STUDENTS_PER_DAY * 5 * COURSE_WEEK_LENGTH

  count = 0
  while count < total
    student_pool = get_all_students if student_pool.empty?
    student = student_pool.delete_at(rand(student_pool.length)) 
 
    row << student
    count += 1

    # print out a row once there's three students assigned
    if row.length == STUDENTS_PER_DAY
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

def main
  if ARGV.first == "fake"
    $students = generate_random_fake_students
  elsif STDIN.tty?
    puts "Paste the list of your students then CTRL+D"
    $students = STDIN.read.split("\n")
  else
    $students = STDIN.read.split("\n")
  end

  generate_schedule
end

main