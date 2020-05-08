module.exports = {
  // purge: [
  //   './app/**/*.html.erb',
  //   './app/helpers/**/*.rb',
  //   './app/javascript/**/*.js',
  // ],
  purge: {
    enabled: false
  },
  theme: {
    extend: {},
  },
  variants: {},
  plugins: [require('@tailwindcss/custom-forms')],
}
