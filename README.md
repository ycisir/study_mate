# study_mate

### requirements
- postgresql
- ruby-3.3.9

### steps for local dev setup
```
1: clone the repo
git clone https://github.com/ycisir/study_mate

2: navigate to the project dir
cd study_mate

3: install dependencies
bundle install

4: configure database
open the config/database.yml file and add the following lines in the default section after pool:
host: localhost
username: <%= ENV["DB_USERNAME"] || "postgres" %>
password: <%= ENV["DB_PASSWORD"] || "" %>

5: create .env and paste these
DB_USERNAME=postgres
DB_PASSWORD=yourpassword

6: create db and run migratation
rails db:create db:migrate

7: start dev server
rails s
```