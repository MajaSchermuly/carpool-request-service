# CARPOOL-request-service

This project is going to allow users to request a ride for carpool. It will also let Admins and Members log in and see/assign rides and other info

## 🏁 Getting Started

### Prerequisites
⛏️ Built Using Ruby on Rails v3.0.2p107

You will need to use the described docker image to run CRS

Install it by doing

```
docker pull dmartinez05/ruby_rails_postgresql:latest
```

### Installing
Clone the repository, make sure you have pulled the docker container, then open the cloned folder in powershell.
After that, create the docker container by running the following commands:
```
docker run --rm -it --volume "$(pwd):/CRS" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest
```
```
cd CRS
```
Once in your docker container, clone the repository and do

```
bundle install
rails db:create
rails db:migrate
```

## 🔧 Running the tests

To run the test suite, run 
```
rspec .
```

## 🏎️ Usage
To run the app, first follow the installation instructions above, then run the following command:
```
rails s -b 0.0.0.0
```
You can view the app by visiting http://localhost:3000/

## 📲 Deployment
To deploy to the staging Heroku App, just merge changes into the test branch. For the main app, merge to the main branch.

## 🩺 Support
Admins needing support can view the support document. Users who need help or have questions/concerns may contact CARPOOL.

## ⚙️ Services
* Google OAuth API

## ✍️ Authors
* Joseph Shumway
* Maja Schermuly
* Terry Ruhge
* Miguel Urbina
* John Nichols
