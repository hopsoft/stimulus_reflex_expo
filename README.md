# StimulusReflex Expo

## Local Setup

1. Install dependencies

   - [Ruby](https://www.ruby-lang.org/en/downloads/)
   - [Yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable)
   - [PostgreSQL](https://www.postgresql.org/download/)

1. Clone the repo

   ```sh
   git clone https://github.com/hopsoft/stimulus_reflex_expo.git
   ```

1. Switch into the project folder

   ```sh
   cd stimulus_reflex_expo
   ```

1. Run the setup command

   ```sh
   bin/setup
   ```

1. Start the rails server

   ```sh
   bin/rails server
   ```

1. See the app in action

   To see the application in action, open a browser window and navigate to http://localhost:3000. That's it!

## Local Setup with Docker

You can also use a dockerized development environment (based on the Evil Martians' [Ruby on Whales](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development) setup).

1. Install dependencies

   - [Docker](https://www.docker.com/products/docker-desktop)
   - [Dip](https://github.com/bibendi/dip)

1. Clone the repo

   ```sh
   git clone https://github.com/hopsoft/stimulus_reflex_expo.git
   ```

1. Switch into the project folder

   ```sh
   cd stimulus_reflex_expo
   ```

1. Run the provision command

   ```sh
   dip provision
   ```

1. Start the rails server along with webpacker

   ```sh
   dip up rails webpacker
   ```

1. See the app in action

   To see the application in action, open a browser window and navigate to http://localhost:3000. That's it!

## Contributing

This project uses [Standard](https://github.com/testdouble/standard)
and [Prettier-Standard](https://github.com/sheerun/prettier-standard) to minimize bike shedding related to code formatting.
Please run `./bin/standardize` prior submitting pull requests (or `dip bash ./bin/standardize` when using Docker4Dev).

Test change
