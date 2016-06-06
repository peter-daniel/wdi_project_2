WDI Project 2 - OMDb top 5 movie lists
==================================

### Overview

* Register and login
* Search your top favourite movies via OMDb API
* Add your favourite movies to a list of 5 only
* View movie poster and details
* View other peoples lists and those movie posters and details

___________________________________________________________________________________

### Technologies used

* **API:** OMDb [http://www.omdbapi.com/](http://www.omdbapi.com)
* **Tools:** Postgresql 9.5.3, Rails 4.2.6
* **Languages:** Ruby, javascript, CSS, HTML5
* **google fonts:** Open Sans, Teko
* **Gems:** bcrypt 3.1.7, HTTParty


___________________________________________________________________________________

### Functions

* Register username and password using bcrypt - store in **User** table
* Secure login/out via Rails sessions controller
* Update user details via bcrypt
* Search OMDb API via httparty
* View movie search results and store selected movies in **Movie** table with user foreign key
* Update top5 list dynamically as user selects and deletes movies
* Show 'to fill' placeholder image graphic for the 5 slots in the list area
* Restrict users from saving more than 5 movies - use flash messages to prompt user when at 5 and if adding more (helped using the model scope function)
* Delete movies to add others
* View user top-5 list via an iframe across all routes
* View and select other user's movies - view those movie details - and include an option to include in own user list
* On show-all-top5 page: all-users-list reflects any changes to own user list dynamically using js
* Use the 'join' and 'group-by' methods to get - and flex-box to display all users top5 lists.
* Use CSS to display elements in a way that helps usabilty

___________________________________________________________________________________


### table schema

One to many table relation

USERS (has many movies)
  t.string   "email"
  t.string   "username"
  t.string   "password_digest"

MOVIES  (belongs to users)
  t.string   "director"
  t.string   "year"
  t.string   "actors"
  t.boolean  "top5" (true by default when added)
  t.integer  "user_id"
  t.string   "imgurl"
  t.string   "imdbID"

___________________________________________________________________________________


### Future Interations

* Retain search results when coming back to the search page from the details page
* Include ability to share lists via: email, text, social media
* Include ability to reorder the list from 1 to 5 - or place movies in a 1-5 slot
* Make the site more effectively mobile responsive
