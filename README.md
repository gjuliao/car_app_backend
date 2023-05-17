<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->
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
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Car APP - Back End <a name="about-project"></a>

** Car APP - Back End ** Is a Ruby Back-End project for users to rent cars, and Admins to create and delete cars.  Users will have the chance to view the history of cars reserved.

** The app front end can be found [here](https://github.com/gjuliao/car_app_frontend)

## 🛠 Built With <a name="built-with"></a>


  <ul>
    <li><a href="https://www.ruby-lang.org/en/documentation/">Ruby on Rails</a></li>
  </ul>


<!-- Features -->

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

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- [Ruby](https://www.ruby-lang.org/en/) installed and running
- [PostgreSQL](https://www.postgresql.org/) installed
- [RubyonRails](https://rubyonrails.org/) installed

### Setup

Clone this repository to your desired folder:

``` bash
git clone git@github.com:dgcuenca/car_app_backend.git
```
and then move to the folder: 

```bash
cd car_app_backend
```

```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Install

Install dependancies with:

```bash
bundle install
```

### Usage

To run the project, execute the following command:

To run the project, execute the following command:
```console
bundle exec rails db:create
bundle exec rails db:migrate
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

### Run tests

To run tests, run the following command:

```sh
rspec spec/models/ // to test models
rspec spec/requests/api/v1  // to test controllers
```

### Deployment

This project would be deployed using:

- [Render](https://render.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

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

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **Add price to reservation**
- **Add plac-id to cars**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/gjuliao/car_app_frontend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- [Microverse Team and classmates](https://www.microverse.org/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>

- **Can I use this project for personal use?**

  - Sure, if you want to talk about something specific, feel free to send me a direct message. <br><br>
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>