workflow "Test and deploy" {
  on = "push"
  resolves = ["Lint Vue", "Lint Json"]
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
