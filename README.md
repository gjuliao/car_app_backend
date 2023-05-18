<a name="readme-top"></a>

<div align="center">
  <img src="./public/splash-logo.svg" alt="logo" width="256"  height="auto" />
  <br/>

  <h3><b>RENT CARS</b></h3>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [🚀 Live demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
  - [Kanban Board](#kanban-board)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 RENT CARS - Back End <a name="about-project"></a>

** RENT CARS - Back End ** Is a Ruby Back-End project for users to rent cars, and Admins to create and delete cars.  Users will have the chance to view the history of cars reserved.

** The app front end can be found [here](https://github.com/gjuliao/car_app_frontend)

## 🛠 Built With <a name="built-with"></a>

  <ul>
    <li><a href="https://www.ruby-lang.org/en/documentation/">Ruby on Rails</a></li>
  </ul>


### Key Features <a name="key-features"></a>

- **Users can view Cars signup, login and reserve cars.**
- **Admin can login, add and delete cars.**
- **Users can view history of cars**
- **Users can view characteristics of cars (price, electric, brand and much more).**
- **Users can view which cars are available for rent and which aren't**
- **Full stack app**
- **Styling uses CSS**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Key Features <a name="key-features"></a>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites <a name="prerequisites"></a>

In order to run this project you need:

- [Ruby](https://www.ruby-lang.org/en/) installed and running
- [PostgreSQL](https://www.postgresql.org/) installed
- [RubyonRails](https://rubyonrails.org/) installed

### Setup <a name="setup"></a>

Clone this repository to your desired folder:

``` bash
git clone git@github.com:dgcuenca/car_app_backend.git
```
and then move to the folder: 

```bash
cd car_app_backend
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Install <a name="install"></a>

Install dependancies with:

```bash
bundle install
```
### Usage <a name="usage"></a>

In order to run the project please follow the next steps to create your credentials|masterkey pair:

1. Delete config/master.key and config/credentials.yml.enc if they exist.
2. Run in the terminal: `EDITOR=code rails credentials:edit`
3. This command will create a new master.key and credentials.yml.enc if they do not exist.

```console
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails start
```
then go to [http://localhost:300](http://localhost:300)

Users to log in into the app:
```
admin: admin@admin.com
password: 123456

user: diego@gmail.com
password: 123456
```

### Run tests <a name="run-tests"></a>

To run tests, run the following command:

```sh
rspec spec/models/ // to test models
rspec spec/requests/api/v1  // to test controllers
```

### Deployment <a name="deployment"></a>

This project would be deployed using:

- [Render](https://render.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Kanban Board <a name="kanban-board"></a>
  - Initial state of Kanban [Board](https://github.com/users/gjuliao/projects/2)
  - <img src="./public/kanbanStart.png" alt="kanbanBoard" width="256"  height="auto" />
    <br/>
  - Number of team members at start and finish: 5 Team members.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Belay Birhanu**

- GitHub: [@belaymit](https://github.com/belaymit)

👤 **Juan Carlos Sanchez**

- GitHub: [@Juank628](https://github.com/Juank628)

👤 **Diego Cuenca**

- GitHub: [@dcuenca](https://github.com/dcuenca)

👤 **Paul Saenz**

- GitHub: [@paulsaenzsucre](https://github.com/paulsaenzsucre)

👤 **Giovanni Juliao**

- GitHub: [@gjuliao](https://github.com/gjuliao)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **Add price to reservation**
- **Add plac-id to cars**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/gjuliao/car_app_frontend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- [Microverse Team and classmates](https://www.microverse.org/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **Can I use this project for personal use?**

  - Sure, if you want to talk about something specific, feel free to send me a direct message. <br><br>
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>