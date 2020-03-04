# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{name: 'John Dunwald', username: 'john.dunwald', password: 'abc123'}, {name: 'Karen Foley', username: 'karen.foley', password: 'def456'}, {name: 'Richard Rodriguez', username: 'richard.rodriguez', password: 'ghi789'}, {name: 'Theresa Jacobs', username: 'theresa.jacobs', password: 'jkl111'} ])

Patient.create ([{name: 'Lauren Tenenbaum', birthdate: '1987-04-17', sex: 'Female'}, {name: 'Paul Hartman', birthdate: '1986-01-30', sex: 'Male'}, {name: 'Kevin Schultz', birthdate: '1975-07-12', sex: 'Male'}, {name: 'Mark Davids', birthdate: '1989-03-27', sex: 'Male'}, {name: 'Melanie Martin', birthdate: '1993-04-14', sex: 'Female'}])

Appointment.create([{date: 'Thu, 16 Apr 2020', time: '15:00:00', patient_id: '2', user_id: '1'}, {date: 'Wed, 13 May 2020 ', time: '13:30:00', patient_id: '3', user_id: '2'}, {date: 'Wed, 04 Mar 2020', time: '15:00:00', patient_id: '4', user_id: '2'}, {date: 'Fri, 29 May 2020', time: '11:00:00', patient_id: '3', user_id: '3'}])
