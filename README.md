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

## Contributing

This project uses [Standard](https://github.com/testdouble/standard)
and [Prettier-Standard](https://github.com/sheerun/prettier-standard) to minimize bike shedding related to code formatting.
Please run `./bin/standardize` prior submitting pull requests.
