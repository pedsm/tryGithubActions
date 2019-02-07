workflow "Test and deploy" {
  on = "push"
  resolves = [
    "Lint Json",
    "Push to Heroku",
  ]
}

action "Install dependencies" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  args = "install"
}

action "Lint Vue" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  needs = ["Install dependencies"]
  args = "run lint"
}

action "Lint Json" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  needs = ["Install dependencies"]
  args = "run lint-input"
}

action "Build Vue app" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  needs = ["Lint Vue", "Lint Json"]
  args = "run build"
}

action "Login to Heroku" {
  uses = "actions/heroku@9b6266f8ca2b26bc846af2547b2b11ad8a696223"
  needs = ["Build Vue app"]
  args = "container:login"
  secrets = ["HEROKU_API_KEY"]
}

action "Push to Heroku" {
  uses = "actions/heroku@9b6266f8ca2b26bc846af2547b2b11ad8a696223"
  needs = ["Login to Heroku"]
  args = "container:push -a try-github-actions web"
  secrets = ["HEROKU_API_KEY"]
}
