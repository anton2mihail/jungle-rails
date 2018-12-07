# Jungle

A mini e-commerce application built with Rails 4.2.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Make sure to create a test gmail account, or use your own for the `.env` so that the user that is generated from the seeds uses your email
6. Create .env file based on .env.example
7. Run `bin/rake db:reset` to create, load and seed db
8. Sign up for a Stripe account
9. Put Stripe (test) keys into appropriate .env vars
10. Run `bin/rails s` to start the server
11. Enjoy!

## Default User

The default user is found in the `/db/seeds.rb` file
the password is : `123`
This user is used to login and play with the functions of the website.
Make sure to replace 
```env
DEFAULT_TO_EMAIL=example@gmail.com
```
in your `.env` file
with a real email address at which you'd like to receive the test order confirmation
email. 

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

###### ** Other dependencies are declared in the gemfile

## Screenshots
![alt text](https://github.com/anton2mihail/jungle-rails/blob/master/screenshots/admin_products.png "Admin Products Page")
![alt text](https://github.com/anton2mihail/jungle-rails/blob/master/screenshots/cart.png "Cart Page")
![alt text](https://github.com/anton2mihail/jungle-rails/blob/master/screenshots/index.png "Products Page")
![alt text](https://github.com/anton2mihail/jungle-rails/blob/master/screenshots/info.png "Info Page")
![alt text](https://github.com/anton2mihail/jungle-rails/blob/master/screenshots/reviews.png "Some Reviews")

