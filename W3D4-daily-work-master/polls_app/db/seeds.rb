# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{username: 'carolyn'}, {username: 'kevin'}, {username: 'ujwal'}])

polls = Poll.create!([{title: 'Favorites', author_id: User.find_by(username: 'carolyn').id}])

questions = Question.create!([{text: 'What''s your favorite color?', poll_id: Poll.first.id},
  {text: 'What''s your favorite ice cream?', poll_id: Poll.first.id},
  {text: 'What''s your favorite season?', poll_id: Poll.first.id}])

choices1 = AnswerChoice.create!([{text: 'blue', question_id: Question.find_by(text: 'What''s your favorite color?')},
  {text: 'yellow', question_id: Question.find_by(text: 'What''s your favorite color?')},
  {text: 'green', question_id: Question.find_by(text: 'What''s your favorite color?')},
  {text: 'red', question_id: Question.find_by(text: 'What''s your favorite color?')}])

choices2 = AnswerChoice.create!([{text: 'chocolate', question_id: Question.find_by(text: 'What''s your favorite ice cream?')},
  {text: 'vanilla', question_id: Question.find_by(text: 'What''s your favorite ice cream?')},
  {text: 'strawberry', question_id: Question.find_by(text: 'What''s your favorite ice cream?')},
  {text: 'peanut butter', question_id: Question.find_by(text: 'What''s your favorite ice cream?')}])

choices3 = AnswerChoice.create!([{text: 'winter', question_id: Question.find_by(text: 'What''s your favorite season?')},
  {text: 'autumn', question_id: Question.find_by(text: 'What''s your favorite season?')},
  {text: 'spring', question_id: Question.find_by(text: 'What''s your favorite season?')},
  {text: 'summer', question_id: Question.find_by(text: 'What''s your favorite season?')}])
