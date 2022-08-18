# E-learning system build based on Ruby on Rails

This is an 日本語 e-learning system management build based on Ruby on Rails.

## Geting started
To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, setting the database connection in ```./config/database.example.yml``` and change the file's name into ```database.yml```. Next step is creating the database:
```
$ rails db:create
```
And migrating the database:
```
$ rails db:migrate
```
Finally, run the app in the local server:
```
$ rails server
```
Enjoy :D
