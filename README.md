Requirements Engineering Opdracht 3
===================================

Authors: Willem Reynvaan (0351350), Leon Helwerda (1034375)

This project contains Cucumber tests for Lighthouse's ticketing system and other
features that it provides.

This was made for assignment 3 for the course Requirements Engineering for the
University of Leiden.

Most of the project structure is only there to let Ruby think that it is
a Rails application, so that it is possible to start a server to interact
with Selenium. The test scenarios can be found in `features/`.

Installation and running
------------------------

As prerequisites, make sure that you have `ruby` installed and you can use
`gem` or `bundle` to install any needed gems. It is recommended to use `rvm` to
set up `ruby` and `gem`. The scenarios have been tested on ruby 1.9.3-p392
with fairly new versions of Firefox as the Selenium driver.

The required gems should be retrievable using `bundle install`.

To run the Cucumber tests, two terminals are needed, both with the root
directory of the project as the current directory. One of them has to start the
server using `rails s`. When the server has started, use `bundle exec cucumber`
in the other terminal to run all the scenarios.

Scenario descriptions
---------------------

Create ticket: This test checks whether it is possible to create a new ticket,
which should bring the user to a page that has the title of the ticket on the
page and it should appear on the list of open tickets.

Resolve ticket: This test checks whether it is possible to change the status of
an open ticket to resolved. It should receive this state on the ticket page and
it should appear on the list of closed tickets. This test only works if there are open tickets, otherwise it will be pending.

Upload profile picture: This test checks whether a profile picture can be
uploaded. It uploads a JPG file and a PNG file, and in between checks whether
the file name has changed to include ".jpg" or ".png". This is the best way to
check whether the image actually changed, because the file name is always
"image" plus the extension and the rest of the URL can randomly change on every
page. It is too difficult to check that the image is the one we uploaded, also
because it is resized.

Create milestone: This test checks whether it is possible to create a new
milestone and then add that exact milestone to an issue. Both the name and
milestone ID are validated. This test only works if issues were created before,
otherwise it will be pending.

Close milestone: This test checks whether it is possible to close a milestone,
even if there are open tickets with that milestone. This test only works if
there is such a milestone with open tickets, otherwise it will be pending.

Restore temporary comment: This test checks whether the comment that was typed
for a new ticket is restored when the page is reloaded. This simulates
a crashed browser. The test explicitly waits after typing and reloading to
allow saving and restoring.

Export CSV: This test checks whether the CSV export of the ticket list is valid
CSV. We set up a special profile which makes sure that CSV files are
automatically downloaded to the correct directory, so that the test can wait
while it is downloading without any manual intervention.

Upload big file: This test checks whether it is possible to upload a file that
is larger than 50 MB. Lighthouse does not support such big files, and the
connection is reset when this is done (instead of showing an error message).
Therefore, this is a failing test.

Log in: This test checks whether the user can log in.

Add tag: This test checks whether a tag can be added to a ticket.
