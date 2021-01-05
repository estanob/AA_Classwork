# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all 

Cat.create(
  birth_date: '2018/08/08', 
  color: 'light-brown', 
  name: 'Bobby', 
  sex: 'M', 
  description: 'My first cat. He loves to run around the house and is a very athletic cat.'
)

Cat.create(
  birth_date: '2019/09/09', 
  color: 'white', 
  name: 'Ricky', 
  sex: 'M', 
  description: 'My second cat. He does not really like to exercise, so he is not athletic like his older brother Bobby.'
)

Cat.create(
  birth_date: '2014/05/19', 
  color: 'mixed-color', 
  name: 'Jarvis', 
  sex: 'M', 
  description: "He is Bobby and Ricky's cousin"
)

Cat.create(
  birth_date: '2020/01/01', 
  color: 'grey', 
  name: 'Jenny', 
  sex: 'F', 
  description: "Jenny was born on New Year's Day and is the little sister of Bobby and Ricky. She loves to chase the red laser around the house. Her other favorite toy is floss."
)

Cat.create(
  birth_date: '2011/01/20', 
  color: 'black', 
  name: 'Karen', 
  sex: 'F', 
  description: "Karen is a very grumpy cat and never smiles"
)