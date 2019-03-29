# Bookmark Challenge notes
*Afternoon challenge for Week 4*  
*[Exercise details](https://github.com/makersacademy/course/tree/master/bookmark_manager)*

I went through all the challenges and walkthroughs on Friday morning (29 Mar) in preparation for the weekend challenge. At that point I'd got as far as stage 13, more or less, so the notes after that point were based on skimming the challenges and recording what was involved.

## 1: Analysis

Use user stories!!! And other anlysis tools - domain model diagramming, CRC diagarms, class diagrams. Good planning will probably help you avoid getting into endless refactor hell

## 2: Set up

Get environment up and running and your first page up by feature testing a simple 'Hello World' style page for 'Bookmark Manager' or whatever

- [The Ruby Web Project Setup List (Pill)](https://github.com/makersacademy/course/blob/master/pills/ruby_web_project_setup_list.md)
- [Makers rubocop config](https://github.com/makersacademy/scaffolint)
- [Rspec-sinatra](https://github.com/tansaku/rspec-sinatra): a gem to set up RSpec for a Sinatra project

## 3: First real page - Bookmarks index

- Write a failing feature test for viewing bookmarks at the /bookmarks route.
- Pass the feature test in the simplest way possible.
- Refactor the code to use the View and Controller.
- Test drive a refactor of the code to use a Model, that returns the list of bookmarks.

The refactoring involved making a `Bookmark` class which responded to a class method `.all`, returning a list of all bookmarks.

Refactor using MVC principles:

| Component  | Responsibility                              | Refactor                              |
|------------|---------------------------------------------|---------------------------------------|
| Model      | Encapsulate logic with relevant data        | Encapsulate bookmark data in a class  |
| View       | Display the result to a user                | Show the bookmark data in a list      |
| Controller | Get data from the model and put in the view | Render bookmark data into to the view |


### Stuff to think about:

- Why use class methods? Maybe read [this page on class and instance methods in Ruby](http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/)
- [RESTful routes (pill)](https://github.com/makersacademy/course/blob/master/pills/rest.md)
- [sjmog's README for his game about RESTful routes](https://github.com/sjmog/rest/blob/master/docs/README.md) - useful for thinking about **states** vs. **state transitions**

## 4, 5, 6: Set up database

Using PosqtgreSQL.

- [PostgreSQL tutorial cheat sheet (much more detail)](http://www.postgresqltutorial.com/postgresql-cheat-sheet/)
- [SQL all on one page](http://www.cheat-sheets.org/sites/sql.su/)
- [PostgreSQL command line cheat sheet](https://blog.jasonmeridth.com/posts/postgresql-command-line-cheat-sheet/)

We also create SQL files to keep a record of how our database has been set up. E.g. in `db/migrations/01_create_bookmarks_table.sql` we put:

```sql
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```

... or whatever. Then we add it to the installation instructions in our README, e.g:

1. connect to psql
2. create the database
3. connect to the database
4. run the query from `01_create_bookmarks_table.sql`

## 7: Using PostgreSQL with Ruby

- [PG documentation](https://bitbucket.org/ged/ruby-pg/wiki/Home)
- [PostgreSQL Ruby tutorial](https://bitbucket.org/ged/ruby-pg/wiki/Home) - exercise says 'Retrieving multiple rows of data' is particularly useful

## 8: Upgrading your toolset

- [TableEdit](https://tableplus.io/) - GUI for managing PostgreSQL databases

## 9: Setting up a testing environment

We set up a testing database separate from our development database. The testing database will be used by RSpec, and the development database will be used when we look at the site in our browser.

### How did we do this?

- Use an environment variable to tell us we're in the test environment. There are different ways of doing this, but in the walkthrough they put this in `spec_helper.rb`:
  ```ruby
  ENV['ENVIRONMENT'] = 'test'
  ```
  You can then test for this in your database methods:
  ```ruby
  class Bookmark
    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'bookmark_manager_test')
      else
        connection = PG.connect(dbname: 'bookmark_manager')
      end

      result = connection.exec("SELECT * FROM bookmarks")
      result.map { |bookmark| bookmark['url'] }
    end
  end
  ```
  This seems pretty solid. You know that `ENV['ENVIRONMENT']` is only getting set in your RSpec environment.
- Another method involves... querying Rack or something: <https://stackoverflow.com/questions/15459569/how-to-get-the-current-rack-environment-in-rake> (but wtf is Rack anyway?)
- **Tests should always run against an empty database.** Any test data should be set up in the test itself. So we need to reset the database before every test. To do this we set up a `setup_test_database.rb` file:
  
  ```ruby
  # in spec/setup_test_database.rb
  require 'pg'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
  ```
  
  You could also use `DROP TABLE IF EXISTS bookmarks`, and then recreate it. I think that's probably much slower though...
  
  `setup_test_database.rb` is then run before every single test by including it in `spec_helper.rb` like this:
  ```ruby
  # in spec/spec_helper.rb
  require_relative './setup_test_database'
  ENV['ENVIRONMENT'] = 'test'
  
  RSpec.configure do |config|
    config.before(:each) do
        setup_test_database
    end
  end
  
  # etc...
  ```
- But would it be better here if `setup_test_database.rb` used our migrations files that we're updating each time we change our database structure???

## 10: Creating bookmarks

- Create a User Story from the requirement
- Write a feature test for the User Story
- Solve the feature test by following a TDD cycle.
- Refactor the solution into the Bookmark model.
- Test in the development environment.

## 11.1: Modifying your database

First part of this stage was to add a 'title' attribute to our bookmarks. This involved adding a 'title' column to the database. After doing that we add the step to our migrations. So in `db/migrations/02_add_title_to_bookmarks.sql` we put:

```sql
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
```

Question though: *Why store these steps as separate files?*

> Rather than save each step as a separate file, we could've updated the previous CREATE TABLE command to include this new line. However, by saving each step as a separate file, and asking the developer to run each step of the command, we are making sure that the database setup exactly matches our own process, and any errors in the setup process can be easily rolled back.

After this we refactored creating bookmarks to require a title as well as a url.

## 11.2 Wrapping database objects in program objects

[Here's the walkthrough for this stage](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/11.md)

They created a `Bookmark#initialize` method so that they could instantiate `bookmark` objects using data from the database. Then they updated `Bookmark.create` to return a `bookmark` object corresponding to the record that had just been added to the database, and used this in the expectations in their feature tests.

## 12: CRUD, deleting bookmarks

[Walkthrough](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/12.md)

Using TDD, RESTful routes, and Sinatra's `:method_override`, they implemented a `delete '/bookmarks/:id'` route to delete bookmarks, as well as a `Bookmark.delete` method with unit and feature tests.

- [Sinatra RESTful routes](https://learn.co/lessons/sinatra-restful-routes-readme)
- [Sinatra :method_override](http://sinatrarb.com/configuration.html#method_override---enabledisable-the-post-_method-hack): Boolean specifying whether the HTTP POST _method parameter hack should be enabled. A way of making Sinatra recognise 'DELETE', 'PATCH' requests etc. which it doesn't otherwise (why not?)

## 13: CRUD, updating bookmarks.

Similar to above, except making a `patch /bookmarks/:id` route to update bookmarks.

## 14: Extracting a `Database` setup object

Seems like a good idea to extract a `Database` object out of the `Bookmarks` object at this stage, which will handle connecting to the database, and all that. It's going to be an **Object Relational Mapping** tool, or **ORM**.

The summary of the stage was:
- Test-drive a new class, `DatabaseConnection`, with two methods:
  - `DatabaseConnection.setup` is a class method. It takes one parameter: a database name. It should set up a connection to that database, which is saved as a class instance variable in `Database`.
  - `DatabaseConnection.query` is a class method. It takes one parameter: an SQL query string. It should use the class instance variable from setup to execute that SQL query string on the correct database, via pg.
- Write a setup script that runs when the application boots, which calls `DatabaseConnection.setup` with the correct database for the environment.
- Replace calls to `PG.connect` and `connection.exec` in Bookmark with your new `DatabaseConnection` wrapper class.

[Walkthrough here](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/14.md)

## 15: Validation

[Challenge page](https://github.com/makersacademy/course/blob/master/bookmark_manager/15_validating_bookmarks.md)

Summary of the stage:

> Add a new feature test that expects some kind of error message, on the page, if the user does not submit a real URL.
> Pass the feature test by:
> 
> - Doing the simplest thing
> - Displaying a flash notice on the /bookmarks page when the new bookmark is invalid
> - Test drive a refactor of bookmark validation into the Bookmark model

They used Sinatra Flash to show the validation messages:
- [Sinatra Flash on GitHub](https://github.com/SFEley/sinatra-flash)
- [Setting up Sinatra Flash](https://gist.github.com/cmkoller/0d3b048b3c4b48ee4955)

## 16: One to many relationships

[Challenge page](https://github.com/makersacademy/course/blob/master/bookmark_manager/16_one_to_many_relations.md)

Create a 'one to many' relationship between bookmarks and a new entity, comments. So each bookmark can have multiple comments.

## 17: Many to many relationships

[Challenge page](https://github.com/makersacademy/course/blob/master/bookmark_manager/17_many_to_many_relationships.md)

Create a 'many to many' relationship between bookmarks and a new entity, tags. So each bookmark can have multiple tags, and each tag can be attached to multiple bookmarks.

This will involved a join table.

## 18: Registration

[Challenge page](https://github.com/makersacademy/course/blob/master/bookmark_manager/18_registration.md)

Challenge summary:

> Complete a user registration feature:
> 
> - Update the Rake tasks to set up a users table.
> - Write a feature test for user registration.
> - Taking inspiration from Bookmark, write a User class with a method, create, which is called during registration.
> - When the user is created, store the user ID in the session.
> - Whenever the user's information is to be displayed to the user, .find the current user from the database using the ID stored in session.
> 
> Ensure the user password is stored securely: not as a plain text string.

- They used a RESTful route `users/new` to present the registration form
- Uhhhh an awful lot of stuff in this [walkthrough](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/18.md)! How to encrypt and store passwords properly etc.

## 19: Authentication

Now we've create users, we need to make a login screen which will let them log in.

Again, a whole bunch of stuff in this one!!

[Challenge page](https://github.com/makersacademy/course/blob/master/bookmark_manager/19_authentication.md)

## $BONUS: automating setup with Rake

[Challenge page](https://github.com/makersacademy/course/blob/master/bookmark_manager/using_rake.md)

> In this challenge, you will use Rake, a task runner, to automate the tasks of setting up the database. You'll start by moving the test environment setup script to Rake, and write a script to set up a database through Rake


## Notes

- So they update the database in `psql` each time it changed, e.g. when they introduced bookmark titles, and when they created the user table. But each time they did that they added a new SQL file in `db/migrations`, I guess so you can include it in your installation instructions.