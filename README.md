<p align="center">
  <a href="https://github.com/jcy2704/oop-ruby">
    <img src="https://res.cloudinary.com/growsurf-prod/image/upload/v1582211139/production/gnysw2objzekbagrqiax.png" alt="Logo" width="350" height="70">
  </a>
</p>

<h1 align="center">Inventory Transactions</h1>

<p align="center">
  <strong>Project created by Steven Jack Chung</strong>
  <br>
  Project created based on Ruby On Rails Capstone.<br>
  Design Idea by <a href="https://www.behance.net/gregoirevella">Gregoire Vella</a> on Behance
</p>

<p align="center">
  <a href="https://github.com/jcy2704/inventory/issues">
    <img src="https://img.shields.io/badge/REPORT%20A%20BUG-purple?style=for-the-badge">
  </a>
   ‎ ‎ ‎ ‎
  <a href="https://github.com/jcy2704/inventory/issues">
    <img src="https://img.shields.io/badge/Request%20a%20feature-purple?style=for-the-badge">
  </a>
</p>

# Inventory Transactions

## Table of Contents
- [📐 About Inventory Transactions](#about-inventory-transactions)
- [📋 Features](#features)
  - [Inventory](#inventory)
  - [Role](#roles)
  - [Cart and Sales](#cart-and-sales)
- [🛠️ Tools and Frameworks Use](#built-with)
- [🖥️ Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
  - [Tests](#run-tests)
  - [Deployment](#deployment)
- [👤 Author](#author)
- [🤝 Contributing](#contributing)
- [⭐️ Show Support](#show-your-support)


## About Inventory Transactions
Inventory Transactions is a web app aimed for business who manage a great amount of products. It not only manages the inventory, but it is used as a sale point to make transactions/sales.

## Main Features
We thought of many features a business may require to manage a good inventory as well as the sales.

### Inventory
The **Inventory Feature** is the main feature, where the users/employees will be using to add the products they want to manage. The Products will be divided into groups so it will be easier to manage and look for specific product.

### Roles
The main features for the Owner is the **Admin Role** feature.

The Owner have the permissions to everything. The main characteristic of this role is to add new users(employees or admins) to the system so each user will be able to take score on their sales as well as managing them.

The **Employee Role** is as the title says, just for the employees. Users with this role will only be able to create new groups, add new products, and manage their sales.

### Cart and Sales
I implemented the **Cart Feature** so the users can be able to manage their sales with ease.

The Cart will, of course, maintain track of the products that a client will buy. The user can add or decrease the quantity of the items as the client desires.

## Built With

- [Ruby v2.7.0](https://www.ruby-lang.org/en/)
- [Ruby on Rails v6.0.3.4](https://rubyonrails.org/)
- [Sass](https://sass-lang.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [RSpec](https://rspec.info/)
- [Capybara](https://github.com/teamcapybara/capybara#using-capybara-with-rspec)
- [Toastr](https://github.com/tylergannon/toastr-rails)

## Live Demo

[Inventory Transactions](http://inventory-transactions.herokuapp.com/)


## 💻 Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Install [Ruby: 2.7.0](https://www.ruby-lang.org/en/documentation/installation/)

Install [Rails: 6.0.3.4](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails)

Install [Postgres: >=9.5](https://www.postgresql.org/download/)

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format doc --seed 26900
```


### Deployment

In order to deploy this app to Heroku follow the steps below

Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

After that type the command to create the app and add the heroku repository to your project

```
    heroku create
```

Then deploy the app.

```
    git push heroku {your-branch}:master
```

Change {your-branch} for the name of your local branch

For example:
```
    git push heroku inventory:master
```
If you are deploying from the master branch you can just push with just master.
```
    git push heroku master
```

Follow the instructions on your terminal to get the URL where your app was deployed


Finally run the command to create your database and tables on Heroku's server

```
    heroku run rails db:migrate
```

## Author

👤 **Steven Jack Chung**

- GitHub: [@jcy2704](https://github.com/jcy2704)
- Twitter: [@yiak_](https://twitter.com/yiak_)
- LinkedIn: [Steven Jack Chung](https://linkedin.com/in/stevenjchung)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jcy2704/inventory/issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to Gregoire Vella in their desgin for Snapscan

## 📝 Credits and Licenses

This work "Inventory Transactions", is a derivative of "[Snapscan](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=)" by [Gregoire Vella](https://www.behance.net/gregoirevella), used under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/).

"Inventory Transactions" is licensed under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) by Steven Jack Chung.
