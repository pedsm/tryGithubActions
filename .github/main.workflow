workflow "Test and deploy" {
  on = "push"
  resolves = [
    "Lint Json",
    "Build Vue app",
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

action "login" {
  uses = "actions/heroku@master"
  args = "container:login"
  needs = ["Build Vue app"]
  secrets = ["HEROKU_API_KEY"]
}

action "push" {
  uses = "actions/heroku@master"
  needs = "login"
  args = "container:push -a calm-fortress-1234 web"
  secrets = ["HEROKU_API_KEY"]
}

action "release" {
  uses = "actions/heroku@master"
  needs = "push"
  args = "container:release -a calm-fortress-1234 web"
  secrets = ["HEROKU_API_KEY"]
}
