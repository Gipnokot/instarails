// tailwind.config.js
module.exports = {
  content: [
    "./app/views/**/*.{html,erb}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/assets/tailwind/**/*.js"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("./app/assets/tailwind/daisyui.js"),
  ],
}
