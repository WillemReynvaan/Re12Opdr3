Requirements Engineering Opdracht 3
===================================

Authors: Willem Reynvaan (0351350), Leon Helwerda (1034375)

This project contains Cucumber tests for Lighthouse's ticketing system and other
features that it provides.

This was made for assignment 3 for the course Requirements Engineering for the
University of Leiden.

Most of the project structure is only there to let Ruby think that it is
a Rails application, so that it is possible to start a server to interact
with Selenium.

Installation and running
------------------------

As prerequisities, make sure that you have `ruby` installed and you can use
`gem` or `bundle` to install any needed gems. It is recommended to use `rvm` to
set up `ruby` and `gem`. The scenarios have been tested on ruby 1.9.3-p392
with fairly new versions of Firefox as the Selenium driver.

The required gems should be retrievable using `bundle install`.

To run the Cucumber tests, two terminals are needed, both with the root directory
of the project as the current directory. One of them has to start the server using
`rails s`. When the server has started, use `bundle exec cucumber` in the other
terminal to run all the scenarios.

Scenario descriptions
---------------------

Create Issue: This test checks whether it is possible to create a new ticket,
which should bring the user to a page that has the title of the ticket on the
page and it should increase the number of open tickets. This might not happen
instantly, however.

Close ticket: This test checks whether it is possible to change the status of
an open ticket to resolved. The number of closed tickets should increase by one.

Upload profile picture: This test checks whether a profile picture can be uploaded.
It uploads a JPG file and a PNG file, and in between checks whether the file name
has changed to include ".jpg" or ".png". This is the best way to check whether the
image actually changed.
