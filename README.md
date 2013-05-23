Requirements Engineering Opdracht 3
===================================

Authors: Willem Reynvaan (0351350), Leon Helwerda (1034375)

This project contains Cucumber tests for Lighthouse's ticketing system and other
features that it provides.

This was made for assignment 3 for the course Requirements Engineering for the
University of Leiden.

Most of the project structure is only there to let Ruby think that it is
a Rails application. This is sometimes needed for starting a server to interact
with its environment, but it also seems to work without it. The test scenarios
can be found in `features/`, and in `features/step_definitions` the code that
is run for each step is defined. In `features/support` is a library that makes
downloading files easier.

Installation and running
------------------------

As prerequisites, make sure that you have `ruby` installed and you can use
`gem` or `bundle` to install any needed gems. It is recommended to use `rvm` to
set up `ruby` and `gem`. The scenarios have been tested on ruby 1.9.3-p392
with fairly new versions of Firefox as the Selenium driver.

The required gems should be retrievable using `bundle install`.

To run the Cucumber tests, it may be needed to start another terminal with
a server using `rails s`. This does not seem to be always necessary, since we
use Selenium to connect to a remote server, but if running the Cucumber tests
without it causes strange errors then this might help in some cases. Use
`bundle exec cucumber` to run all the scenarios. You can also run signle feature
scenarios by giving the path to the file. Note that some scenarios have a given
that need open tickets or milestones to exist, and they will be pending when
there are no tickets or milestones. In that case either run the
`add_a_new_ticket.feature` or `add_milestone.feature` scenarios first, or
create some of them manually.

Feature scenario descriptions
-----------------------------

Add a new ticket: This test checks whether it is possible to create a new
ticket, which should bring the user to a page that has the title of the ticket
on the page and it should appear on the list of open tickets.
Reason: Creating tickets is a vital function for lighthouse.

Resolve ticket: This test checks whether it is possible to change the status of
an open ticket to resolved. It should receive this state on the ticket page and
it should appear on the list of closed tickets. This test only works if there are open tickets, otherwise it will be pending.
Reason: Closing tickets is a vital function for lighthouse.

Change profile picture: This test checks whether a profile picture can be
uploaded. It uploads a JPG file and a PNG file, and in between checks whether
the file name has changed to include ".jpg" or ".png". This is the best way to
check whether the image actually changed, because the file name is always
"image" plus the extension and the rest of the URL can randomly change on every
page. It is too difficult to check that the image is the one we uploaded, also
because it is resized.
Reason: A profile picture with every comment can give a nice overview of a
conversation.

Add milestone: This test checks whether it is possible to create a new
milestone and then add that exact milestone to an issue. Both the name and
milestone ID are validated. This test only works if issues were created before,
otherwise it will be pending.
Reason: Being able to bundle and prioritize tickets is a useful function for
lighthouse.

Close milestone: This test checks whether it is possible to close a milestone,
even if there are open tickets with that milestone. This test only works if
there is such a milestone with open tickets, otherwise it will be pending.
Reason: Being able to close a milestone is needed.

Restore temporary comment: This test checks whether the comment that was typed
for a new ticket is restored when the page is reloaded. This simulates
a crashed browser. The test explicitly waits after typing and reloading to
allow autosaving and restoring.
Reason: A good autosave function can prevent a lot of frustration.

Export CSV: This test checks whether the CSV export of the ticket list is valid
CSV. We set up a special profile which makes sure that CSV files are
automatically downloaded to the correct directory, so that the test can wait
while it is downloading without any manual intervention.
Reason: If it's possible to export as a csv, it should be at least readable
as a csv file.

Upload big file: This test checks whether it is possible to upload a file that
is larger than 50 MB. Lighthouse does not support such big files, and the
connection is reset when this is done (instead of showing an error message).
Therefore, this is a failing test.
<<<<<<< HEAD
Reason: The site adds a notification near the upload file button, saying that the
maximum upload can be 50 MB.
=======

Log in: This test checks whether the user can log in. This is done as a separate
test to show that the log in form will bring the user to a page that gives a
success message. Note that the form may send the user to different pages
(dashboard, overview) but it will always have the success message.

Add tag: This test checks whether a tag can be added to a ticket. It checks
whether this tag is in the tag list on the right after updating.
>>>>>>> 6434391dc06fa964ca60a7da2382d1a9ff4e7d8a
