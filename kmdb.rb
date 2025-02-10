# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Role.destroy_all
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# Above was handeled directly into the terminal. rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Inserting Warner Bros. into Studios Table
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

# Inserting Movies into Movies table

warner = Studio.find_by({"name" => "Warner Bros."})

# Batman Begins
BB = Movie.new
BB["title"] = "Batman Begins"
BB["year_released"] = 2005
BB["rated"] = "PG-13"
BB["studio_id"] = warner["id"]
BB.save

# The Dark Knight
TDK = Movie.new
TDK["title"] = "The Dark Knight"
TDK["year_released"] = 2008
TDK["rated"] = "PG-13"
TDK["studio_id"] = warner["id"]
TDK.save

# The Dark Knight Rises
TDKR = Movie.new
TDKR["title"] = "The Dark Knight Rises"
TDKR["year_released"] = 2012
TDKR["rated"] = "PG-13"
TDKR["studio_id"] = warner["id"]
TDKR.save

# Creating the actors

CB = Actor.new
CB["name"] = "Christian Bale"
CB.save

MC = Actor.new
MC["name"] = "Michael Caine"
MC.save

LN = Actor.new
LN["name"] = "Liam Neeson"
LN.save

KH = Actor.new
KH["name"] = "Katie Holmes"
KH.save

GO = Actor.new
GO["name"] = "Gary Oldman"
GO.save

HL = Actor.new
HL["name"] = "Heath Ledger"
HL.save

AE = Actor.new
AE["name"] = "Aaron Eckhart"
AE.save

MG = Actor.new
MG["name"] = "Maggie Gyllenhaal"
MG.save

TH = Actor.new
TH["name"] = "Tom Hardy"
TH.save

JGL = Actor.new
JGL["name"] = "Joseph Gordon-Levitt"
JGL.save

AH = Actor.new
AH["name"] = "Anne Hathaway"
AH.save

# Creating Batman Begin Roles

bb_id = Movie.find_by({"title" => "Batman Begins"})
cb_id = Actor.find_by({"name" => "Christian Bale"})
mc_id = Actor.find_by({"name" => "Michael Caine"})
ln_id = Actor.find_by({"name" => "Liam Neeson"})
kh_id = Actor.find_by({"name" => "Katie Holmes"})
go_id = Actor.find_by({"name" => "Gary Oldman"})

bb_bw = Role.new
bb_bw["movie_id"] = bb_id["id"]
bb_bw["actor_id"] = cb_id["id"]
bb_bw["character_name"] = "Bruce Wayne"
bb_bw.save

bb_a = Role.new
bb_a["movie_id"] = bb_id["id"]
bb_a["actor_id"] = mc_id["id"]
bb_a["character_name"] = "Alfred"
bb_a.save

bb_rag = Role.new
bb_rag["movie_id"] = bb_id["id"]
bb_rag["actor_id"] = ln_id["id"]
bb_rag["character_name"] = "Ra's Al Ghul"
bb_rag.save

bb_rd = Role.new
bb_rd["movie_id"] = bb_id["id"]
bb_rd["actor_id"] = kh_id["id"]
bb_rd["character_name"] = "Rachel Dawes"
bb_rd.save

bb_cg = Role.new
bb_cg["movie_id"] = bb_id["id"]
bb_cg["actor_id"] = go_id["id"]
bb_cg["character_name"] = "Commissioner Gordon"
bb_cg.save

# Creating The Dark Knight Roles

tdk_id = Movie.find_by({"title" => "The Dark Knight"})
hl_id = Actor.find_by({"name" => "Heath Ledger"})
ae_id = Actor.find_by({"name" => "Aaron Eckhart"})
mg_id = Actor.find_by({"name" => "Maggie Gyllenhaal"})

tdk_bw = Role.new
tdk_bw["movie_id"] = tdk_id["id"]
tdk_bw["actor_id"] = cb_id["id"]
tdk_bw["character_name"] = "Bruce Wayne"
tdk_bw.save

tdk_j = Role.new
tdk_j["movie_id"] = tdk_id["id"]
tdk_j["actor_id"] = hl_id["id"]
tdk_j["character_name"] = "Joker"
tdk_j.save

tdk_hd = Role.new
tdk_hd["movie_id"] = tdk_id["id"]
tdk_hd["actor_id"] = ae_id["id"]
tdk_hd["character_name"] = "Harvey Dent"
tdk_hd.save

tdk_a = Role.new
tdk_a["movie_id"] = tdk_id["id"]
tdk_a["actor_id"] = mc_id["id"]
tdk_a["character_name"] = "Alfred"
tdk_a.save

tdk_rd = Role.new
tdk_rd["movie_id"] = tdk_id["id"]
tdk_rd["actor_id"] = mg_id["id"]
tdk_rd["character_name"] = "Rachel Dawes"
tdk_rd.save

# Creating The Dark Knight Rises Roles

tdkr_id = Movie.find_by({"title" => "The Dark Knight Rises"})
th_id = Actor.find_by({"name" => "Tom Hardy"})
jgl_id = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
ah_id = Actor.find_by({"name" => "Anne Hathaway"})

tdkr_bw = Role.new
tdkr_bw["movie_id"] = tdkr_id["id"]
tdkr_bw["actor_id"] = cb_id["id"]
tdkr_bw["character_name"] = "Bruce Wayne"
tdkr_bw.save

tdkr_cg = Role.new
tdkr_cg["movie_id"] = tdkr_id["id"]
tdkr_cg["actor_id"] = go_id["id"]
tdkr_cg["character_name"] = "Commissioner Gordon"
tdkr_cg.save

tdkr_b = Role.new
tdkr_b["movie_id"] = tdkr_id["id"]
tdkr_b["actor_id"] = th_id["id"]
tdkr_b["character_name"] = "Bane"
tdkr_b.save

tdkr_jb = Role.new
tdkr_jb["movie_id"] = tdkr_id["id"]
tdkr_jb["actor_id"] = jgl_id["id"]
tdkr_jb["character_name"] = "John Blake"
tdkr_jb.save

tdkr_sk = Role.new
tdkr_sk["movie_id"] = tdkr_id["id"]
tdkr_sk["actor_id"] = ah_id["id"]
tdkr_sk["character_name"] = "Selina Kyle"
tdkr_sk.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

movie_array = Movie.all
for index in movie_array
    title = index["title"].ljust(22)
    year = index["year_released"]
    rating = index["rated"].ljust(6)
    studio = Studio.find_by({"id" => index["studio_id"]})["name"]

    puts "#{title} #{year} #{rating} #{studio}"
end



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

roles_array = Role.all
for index in roles_array
    movie_name = Movie.find_by({"id" => index["movie_id"]})["title"].ljust(22)
    actor_name = Actor.find_by({"id" => index["actor_id"]})["name"].ljust(20)
    character = index["character_name"]

    puts "#{movie_name} #{actor_name} #{character}"
end

    
