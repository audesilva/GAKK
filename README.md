# GAKK

Ruby version: ruby 2.3.1p112

Deployment instructions: TBD

Pre commit git hook: add pre_commit executable to your .git/hooks/ directory to enable cucumber tests at each commit. 

To run the app and tests:
"sh run_script.sh"

To run just the tests:
"sh run_test_script.sh"

For tests to be able to run, download geckodriver and add it to your path:
https://github.com/mozilla/geckodriver/releases
(unpack the tar gz file)
move to /usr/local/bin
Also make sure you have a recent version of firefox installed.

To create a new account you may need to use mailcatcher in order to intercept the email to confirm the account so you can log in:
https://mailcatcher.me/
If you don't want to create a new account, we have seeded the db so you can use one of the pre-existing user accounts such as:
guy@gmail.com / topsecret
