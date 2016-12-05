gem install bundler
bundle update
bundle install
rake db:drop
rake db:migrate

rake db:seed

sh run_test_script.sh
rails server
