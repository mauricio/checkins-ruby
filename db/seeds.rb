# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_1 = User.create!( :email => 'linhares.mauricio@gmail.com', :password => '12345678', :password_confirmation => '12345678')
user_2 = User.create!( :email => 'linhares.mauricio+2@gmail.com', :password => '12345678', :password_confirmation => '12345678')
user_3 = User.create!( :email => 'linhares.mauricio+3@gmail.com', :password => '12345678', :password_confirmation => '12345678')

user_1.follow( user_2 )
user_1.follow( user_3 )

user_2.follow( user_1)

user_3.follow( user_1 )
user_3.follow( user_2 )

tv_show_1_desc = %Q{Mr. Finch (Michael Emerson), a mysterious billionaire, developed a computer program for the government that predicts terrorist threats in New York City. It was designed as a means to prevent another 9/11-type disaster, but Finch discovered that it was also predicting many "irrelevant" (non-terrorist) violent crimes. The non-terrorist data is dumped to a separate database and deleted each night. Finch realized that a great many domestic crimes could also be prevented if that data could be used. Finch built a back door into the machine that allows him to retrieve a list of Social Security numbers of people who will be involved in those crimes in order of occurrence. Unable to investigate on his own, Finch hires John Reese (Jim Caviezel), a former Green Beret and CIA field officer who is presumed dead, to help stop the crimes from taking place. Finch made the choice of only transmitting the Social Security Numbers of the persons of interest so that if the back door is discovered, the government would have no clue as to what the numbers mean, or who is acting on the data.}
tv_show_2_desc = %Q{Fringe follows the casework of the Fringe Division, a Joint Federal Task Force supported primarily by the Federal Bureau of Investigation, which includes Agent Olivia Dunham; Dr. Walter Bishop, the archetypal mad scientist; and Peter Bishop, Walter's estranged son and jack-of-all-trades. They are supported by Phillip Broyles, the force's director, and Agent Astrid Farnsworth, who assists Walter in laboratory research. The Fringe Division investigates cases relating to fringe science, ranging from transhumanist experiments gone wrong to the prospect of a destructive technological singularity to a possible collision of two parallel universes. The Fringe Division's work often intersects with advanced biotechnology developed by a company called Massive Dynamic, founded by Walter's former partner, Dr. William Bell and run by their common friend, Nina Sharp. The team is also watched silently by a group of bald, pale men who are called "Observers".}

tv_show_1 = TvShow.create!( :name => 'Person of Interest', :description => tv_show_1_desc )
tv_show_2 = TvShow.create!( :name => 'Fringe', :description => tv_show_2_desc )

user_1.checkin( tv_show_1, "S01E01 - starting out from user 1" )
user_1.checkin( tv_show_2, 'S04E15 - Moving on from user 1' )

user_2.checkin( tv_show_1, "S01E01 - starting out from user 2" )
user_2.checkin( tv_show_2, 'S04E15 - Moving on from user 2' )

user_3.checkin( tv_show_1, "S01E01 - starting out from user 3" )
user_3.checkin( tv_show_2, 'S04E15 - Moving on from user 3' )