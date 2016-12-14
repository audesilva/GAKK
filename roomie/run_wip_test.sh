echo "Running Tests with cucumber"
#rake db:test:prepare
bin/rails db:migrate RAILS_ENV=test
rake cucumber:wip 
