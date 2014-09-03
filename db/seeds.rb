# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

randall = User.create({email: "randall@ga.com", phone_num: "4152987707", password: "2014password"})
dustin = User.create({email: "dustin@ga.com", phone_num: "8189877898", password: "2014password"})
sana = User.create({email: "sana@ga.com", phone_num: "5102094735", password: "2014password"})

hello1 = randall.saved_msgs.create({subject: "Hello", content: "Today is Friday - Best day of the week!", time: Time.now.getutc})
hello2 = dustin.saved_msgs.create({subject: "Hello", content: "Today is Friday - Best day of the week!", time: Time.now.getutc})
hello3 = sana.saved_msgs.create({subject: "Hello", content: "Today is Friday - Best day of the week!", time: Time.now.getutc})

# unknown1 = No_user_logon.create({})
# unknown2 = No_user_logon.create({})
# unknown3 = No_user_logon.create({})

friday1 = UnsavedMsg.create({email: "test1@ga.com", phone_num: "5162420285", subject: "goodbye", content: "Today is Friday - Best day of the week!", time: "8:00AM 2014-AUG-29", send_num: "6507044251"})
friday2 = UnsavedMsg.create({email: "test2@ga.com", phone_num: "5162420285", subject: "goodbye", content: "Today is Friday - Best day of the week!", time: "8:00AM 2014-AUG-29", send_num: "6509069549"})
friday3 = UnsavedMsg.create({email: "test3@ga.com", phone_num: "5162420285", subject: "goodbye", content: "Today is Friday - Best day of the week!", time: "8:00AM 2014-AUG-29", send_num: "5102959333"})


friend = dustin.contacts.create({first_name: "Jerry", last_name: "Wong", phone_num: "23478900983"})
friend2 = dustin.contacts.create({first_name: "Daniel", last_name: "Lau", phone_num: "19803748979"})
# test = Contacts.create({first_name: "Harry", last_name: "Lee", phone_num: "1923807487"})