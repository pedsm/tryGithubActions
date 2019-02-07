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
  args = "build"
}
