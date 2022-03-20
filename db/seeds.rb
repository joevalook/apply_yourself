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


## COMPANIES

puts "Creating Companies ..."

Company.destroy_all

Company.create!({
  company_name: 'Googley Eyes',
  app_id: 1,
  website: 'www.googley.com',
  company_notes: 'Some kind of search engine, I think?'
})
Company.create!({
  company_name: 'Webflix',
  app_id: 2,
  website: 'www.webflix.com',
  company_notes: 'Streaming company'
})
Company.create!({
  company_name: 'Facelook',
  app_id: 3,
  website: 'www.facelook.com',
  company_notes: 'People-ranker turned SecondLife'
})


## APPS

puts "Re-creating Apps ..."

App.destroy_all

App.create!({
  job_title: 'Rails Developer',
  company_id: 1,
  application_deadline: 2022-05-12,
  applied_date: 2022-04-12,
  application_status: 'Resume sent',
  notes: 'Referral from Mike at the Toronto Code Meetup'
})

App.create!({
  job_title: 'React Developer',
  company_id: 2,
  application_deadline: 2022-05-01,
  applied_date: 2022-04-11,
  application_status: 'Interview pending',
  notes: 'Received followup from Peggy (HR). Will be meeting with Audra(team lead) and Ty for the interview.'
})

App.create!({
  job_title: 'QA Specialist',
  company_id: 3,
  application_deadline: 2022-06-04,
  applied_date: 2022-04-15,
  application_status: 'Interview completed',
  notes: 'Met with Raj and Jason. Positive vibes from both; chatted with Raj about mutual love of snowboarding. Will hear back within the week.',
})


# INTERVIEWS

puts "Re-creating Interviews ..."

Interview.destroy_all

Interview.create!({
  interview_number: 1,
  interview_date: 2022-05-05,
  app_id: 2,
  interview_type: 'Preliminary',
  interview_notes: 'Meeting with Audra(team lead) and Ty for the interview',
  thank_you: false,
  completed: false
})

Interview.create!({
  interview_number: 2,
  interview_date: 2022-06-10,
  app_id: 3,
  interview_type: 'Whiteboard',
  interview_notes: 'Met with Raj and Jason. Positive vibes from both; chatted with Raj about mutual love of snowboarding. Will hear back within the week.',
  thank_you: true,
  completed: true
})





puts "DONE!"
