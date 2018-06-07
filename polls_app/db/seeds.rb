# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all# <--to reset a table
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

users = []
10.times do |i| 
  users << User.create!(username: "CrapName#{i}")
end 
  
polls = []
20.times do |i|
  polls << Poll.create!(title: "Crap Title #{i}", pollster_id: users.sample.id)
end 

questions = []
polls.each do |poll|
  q_rand = Random.rand(6)+1
  q_rand.times do |i|
      questions << Question.create!(body: "Crap ques #{poll.id}:#{i}", poll_id: poll.id)
  end 
end

answer_choices = []
questions.each do |question|
  a_rand = Random.rand(3)+1
  a_rand.times do |i|
      answer_choices << AnswerChoice.create!(body: "Crap ans #{question.id}:#{i}", question_id: question.id)
  end 
end

previous_responses = []
40.times do |i|
  u_rand = users.sample.id
  a_rand = answer_choices.sample.id
  Response.create!(answerchoice_id: a_rand, user_id: u_rand) unless previous_responses.include?([u_rand, a_rand])
  previous_responses << [u_rand, a_rand]
end