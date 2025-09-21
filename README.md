# study_mate

### requirements
- postgresql
- ruby-3.3.9

### steps for local dev setup

##### clone the repo
```git clone https://github.com/ycisir/study_mate```

#### navigate to the project dir
```cd study_mate```

#### install dependencies
```bundle install```

#### configure database
- open config/database.yml file
- add the following lines in the [default] section after [pool]
```host: localhost```
```username: <%= ENV["DB_USERNAME"] || "postgres" %>```
```password: <%= ENV["DB_PASSWORD"] || "" %>```

#### create .env and paste these
```DB_USERNAME=postgres```
```DB_PASSWORD=yourpassword```

#### create db and run migratation
```rails db:create db:migrate```

#### start dev server
```rails s```
