# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding Data ..."

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

## USERS

puts "Creating User..."

User.destroy_all

User.create!({
  first_name: "John:",
  last_name: "Wilson",
  email: "john.wilson@hotmail.com",
  password_digest: "abcd"
})

User.create!({
  first_name: "John:",
  last_name: "Bilson",
  email: "john.bilson@hotmail.com",
  password_digest: "abcd"
})


## COMPANIES

puts "Creating Companies ..."

Company.destroy_all

company1 = Company.create!({
  company_name: 'Googley Eyes',
  website: 'www.googley.com',
  company_notes: 'Some kind of search engine, I think?'
})
company2 = Company.create!({
  company_name: 'Webflix',
  website: 'www.webflix.com',
  company_notes: 'Streaming company'
})
company3 = Company.create!({
  company_name: 'Facelook',
  website: 'www.facelook.com',
  company_notes: 'People-ranker turned SecondLife'
})


## APPS

puts "Creating Apps ..."

App.destroy_all

app1 = company1.apps.create!({
  job_title: 'Rails Developer',
  application_deadline: '2022-05-12',
  applied_date: '2022-04-12',
  application_status: 'Resume sent',
  user_id: 1,
  notes: 'Referral from Mike at the Toronto Code Meetup'
})

app2 = company2.apps.create!({
  job_title: 'React Developer',
  application_deadline: '2022-05-01',
  applied_date: '2022-04-11',
  application_status: 'Interview pending',
  user_id: 1,
  notes: 'Received followup from Peggy (HR). Will be meeting with Audra(team lead) and Ty for the interview.'
})

app3 = company3.apps.create!({
  job_title: 'QA Specialist',
  application_deadline: '2022-06-04',
  applied_date: '2022-04-15',
  application_status: 'Interview completed',
  user_id: 2,
  notes: 'Met with Raj and Jason. Positive vibes from both; chatted with Raj about mutual love of snowboarding. Will hear back within the week.',
})


# INTERVIEWS

puts "Creating Interviews ..."

Interview.destroy_all

app1.interviews.create!({
  interview_number: 1,
  interview_date: '2022-05-05',
  interview_type: 'Preliminary',
  interview_notes: 'Meeting with Audra(team lead) and Ty for the interview',
  thank_you: false,
  completed: false
})

app2.interviews.create!({
  interview_number: 2,
  interview_date: '2022-06-10',
  interview_type: 'Preliminary',
  interview_notes: 'Met with Raj and Jason. Positive vibes from both; chatted with Raj about mutual love of snowboarding. Will hear back within the week.',
  thank_you: false,
  completed: false
})

app2.interviews.create!({
  interview_number: 2,
  interview_date: '2022-03-10',
  interview_type: 'Whiteboard',
  interview_notes: 'Met with Raj and Jason. Positive vibes from both; chatted with Raj about mutual love of snowboarding. Will hear back within the week.',
  thank_you: true,
  completed: true
})



puts "DONE!"
