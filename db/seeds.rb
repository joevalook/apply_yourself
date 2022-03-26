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

users = [
  User.create!({
    first_name: "John",
    last_name: "Wilson",
    email: "john.wilson@hotmail.com",
    password_digest: "abcd"
  }),
  User.create!({
    first_name: "John",
    last_name: "Bilson",
    email: "john.bilson@hotmail.com",
    password_digest: "abcd"
  })
]

p "*******************"
pp users
pp users.first.id
p "*******************"

## COMPANIES

puts "Creating Companies ..."

Company.destroy_all

companies = 50.times.map do
  Company.create! do |c|
    company_name = Faker::App.unique.name

    c.company_name = company_name
    c.website = Faker::Internet.url(
      host: Faker::Internet.domain_name(domain: company_name),
      path: '/hiring'
    )
    c.company_notes = Faker::Marketing.buzzwords.capitalize + '!'
  end
end


## APPS

puts "Creating Apps ..."

App.destroy_all

applications = 100.times.map do
  App.create! do |a|
    deadline = Time.now + rand(10..30).days
    
    a.job_title = "Junior #{%w[Rails Ruby Java Javascript React PostgreSQL MongoDB COBOL].sample} Developer"
    a.company_id = companies.sample.id
    a.resume = "resume.com/john.wilson"
    a.application_deadline = deadline
    a.applied_date = deadline - rand(1..9).days
    a.application_status = [
      'Resume sent',
      'Resume sent',
      'Resume sent',
      'Resume sent',
      'Interview pending',
      'Interview completed'
    ].sample
    a.user_id = users.first.id
    a.notes = "Referral from #{Faker::Name.first_name} at the #{Faker::Address.city} #{%w[ code-meetup jamboree think-tank ].sample }"
    # a.archive = false
  end
end


# INTERVIEWS

puts "Creating Interviews ..."

Interview.destroy_all
interviews_by_company = Hash.new(0)

interviews = 25.times.map do
  application = applications.sample
  interview_number = interviews_by_company[application.company.company_name] += 1
  interview_date = application.application_deadline + rand(1..30).days

  Interview.create! do |i|
    i.interview_number = interview_number
    i.interview_date = interview_date
    i.app_id = application.id
    i.interview_type = [
      'Preliminary',
      'Tech',
      'Callback',
      'Main'
    ].sample
    i.interview_notes = "Meeting with #{Faker::Name.name} (#{Faker::Job.seniority} #{Faker::Job.position}) and #{Faker::Name.name} (#{Faker::Job.seniority} #{Faker::Job.position})."
    i.thank_you = interview_date > Time.now ? false : [true, false].sample
  end
end



puts "DONE!"
