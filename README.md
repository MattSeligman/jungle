# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

- Run `bundle install` to install dependencies
- Create `config/database.yml` by copying `config/database.example.yml`
- Create `config/secrets.yml` by copying `config/secrets.example.yml`
- Run `bin/rails db:reset` to create, load and seed db
- Create .env file based on .env.example
- Sign up for a Stripe account
- Put Stripe (test) keys into appropriate .env vars
- Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Preview After Revisions

### Add Products to Cart

![Add Products to Cart](https://github.com/MattSeligman/jungle/blob/master/docs/add-products-to-cart.gif?raw=true)

### Cart Checkout

![Cart Checkout](https://github.com/MattSeligman/jungle/blob/master/docs/cart-checkout.gif?raw=true)

### Stock Control

![Stock Control](https://github.com/MattSeligman/jungle/blob/master/docs/stock-control.gif?raw=true)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Dev Dependencies

- cypress
- webpack-dev-server

### Project Description

There are multiple high-level goals to this project:

- Become familiar with Ruby and the Rails framework
- Learn how to navigate an existing code-base
- Use existing code style and approach to implement new features in unfamiliar territory
- Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution

## Functional Requirements for this project

#### Feature: Sold Out Badge

- [x] Major: When a product has 0 quantity, a sold out badge should be displayed on the product list page
- [x] Minor: Should ideally be implemented as a question/boolean method in view helper and/or Product model

#### Feature: Admin Categories

- [x] Major: Admin users can list and create new categories
- [x] Major: Admins can add new products using the new category
- [x] Major: Restful routes (`resources`) should be used, and there should be no extra, unused routes exposed
- [ ] Bonus: All admin controllers inherit from `Admin::BaseController` (or similarly named) abstract controller, containing the authentication filter

#### Feature: User Authentication

- [x] Major: As a Visitor I can go to the registration page from any page in order to create an account
- [x] Major: As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
- [x] Major: As a Visitor I can sign in using my e-mail and password
- [x] Major: As a User I can log out from any page
- [x] Major: As a User I cannot sign up with an existing e-mail address (uniqueness validation)
- [x] Major: Passwords are not stored as plain text in the database. Instead, `has_secure_password` is used in the User model, leveraging the `bcrypt` gem

#### Enhancement: Order Details Page

- [x] Major: The order page contains items, their image, name, description, quantities and line item totals
- [x] Major: The final amount for the order is displayed
- [x] Minor: The email that was used to place the order is displayed
- [x] Minor: As a Visitor I can place an order (i.e. without logging in and therefore without an e-mail address). The original functionality from the inherited code (even though it is not realistic) should therefore not be suppressed.

#### Bug: Missing Admin Security

- [x] Major: User must enter HTTP auth login/password to access admin functionality
- [ ] Bonus: Should ideally be implemented in an abstract top-level class for admin controllers (e.g., `Admin::BaseController` which the other concrete admin controllers inherit)

#### Bug: Checking Out with Empty Cart

- [x] Major: When the cart is empty and the user goes to the carts#show page, instead of displaying the contents and a stripe checkout button, display a friendly message about how it is empty and link to the home page

## Git

- [x] Minor: The git commit history should have multiple commits and reasonable commit messages. There should be good use of branching and merging for each feature.
