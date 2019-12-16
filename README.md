# PCO Alfred

PCO Alfred is a collection of links and tasks to speed up your workday at Planning Center.

Type "pco" in the Alfred search box to see the list of links/tasks, or type "box" to jump straight to PCO Box tasks.

![](screenshots/pco_alfred.gif)

## Getting Started

Download [PCO_Alfred.alfredworkflow](PCO_Alfred.alfredworkflow), double click and Alfred will take care of the rest.

### Prerequisites

- MacOS
- [Alfred](https://www.alfredapp.com/) + [Powerpack](https://www.alfredapp.com/powerpack/)
- Ruby 2.6.3
- iTerm for the `box bg-log` task (this can likely be adapted to work with others in the future)

## Features

- "pco" keyword to get a list of links/tasks
  - "Box" jumps to the "box" keyword
  - "API Docs" browser link
  - "VictorOps" browser link
  - "Sidekiq" browser link (allows choosing app and env)
  - "Picodex" browser link
  - "Lunchbox" browser link
  - "Datadog" browser link
  - "Bugsnag" browser link
  - "Expensify" browser link
  - "MyADP" browser link
  - "ADP TotalSource" browser link
  - "BambooHR" browser link
  - "Betterment" browser link
- "box" keyword to get a PCO Box commands
  - Allow Idle (allows choosing app)
  - Background Logs
  - Check Version
  - Open local App in Browser
  - Prevent Idle (allows choosing app)
  - Restart PCO Box
  - Restart App (allows choosing app)
  - Restart Nginx
  - Start PCO Box
  - Stop PCO Box

## Built With

* Ruby and Bundler

## Contributing

Issues and PRs welcome!

## Development

- `cd ~/Code`
- `git clone https://github.com/bweave/pco-alfred`
- `cd pco-alfred`
- `bundle install`
- `rake link_to_alfred` to symlink your working dir to Alfred workflows dir. It should now show up in the Workflows sidebar
- `rake unlink_from_alfred` is also available, and it does what it says on the tin.

### Running the tests

`bundle exec rake` to run the tests. The testing setup is Minitest. Nothing fancy.
