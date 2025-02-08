const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/resources/**/*_view.{erb,haml,html,slim,rb}',
    './app/resources/**/*_partial.{erb,haml,html,slim,rb}',
    './app/views/**/*.{erb,haml,html,slim,rb}',
    './app/components/**/*.{erb,haml,html,slim,rb}',
    './config/initializers/simple_form.rb',
    './config/initializers/simple_form_tailwind.rb'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
