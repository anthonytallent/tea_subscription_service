# README

## About

- This app is an api that allows customers to subscribe to certain tea subscriptions. Currently the customer can subscribe to an existing subscription, cancel a subscription, and see all of their subscriptions

## Tech Stack
- Ruby 2.7.4
- Rails 5.2.8
- Postgresql for database

## Setup Instructions

Clone this repo down into your desired directory and open it up in your desired editor

Then to establish a database, run:

```bash
rails db:create
```

Because this is the back end repository, database migration is also necessary, run:

```bash
rails db:migrate
```

Then seed the databases with the already set up seeds file

```bash
rails db:seed
```
## RSpec Suite

Test the entire suite by running

```bash
bundle exec rspec
```
All the tests should be passing at this point

## Calling the API Endpoints

### Create a Subscription for a user
To create a new subscription, the request requires the customer_id and the subscription_id

```bash
{
    "customer_id": "1",
    "subscription_id": "1"
}
```

This is a post request so in postman (or your preferred method of API calling), enther this enpoint

```bash
post /api/v1/customer_subscriptions
```

### Update a Subscritption for a User

This endpoint will cancel a subscription for a user. The request is the same as before

```bash
{
    "customer_id": "1",
    "subscription_id": "1"
}
```

Now call this endpoint

```bash
patch /api/v1/subscriptions/1
```

### Get All a User's Information and Subscriptions

This is a get request with no request body requirements. Simply call this endpoint

```bash
get /api/v1/customers/1
```
**Note: manually typing this in requires an accurate customer id at the end. If you had to reseed a couple of times then I recommend running "rails db:{drop,create,migrate,seed}" to reset everything and have access to customer id 1 again**

## Creator

**Anthony Blackwell Tallent** 
- anthonytallent567@gmail.com
- [GitHub](https://github.com/anthonytallent)
- [LinkedIn](https://www.linkedin.com/in/anthony-blackwell-tallent-b36916255/)
