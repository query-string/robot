require "./settings_manager"
require "./robot"

settings = SettingsManager.new
robot    = Robot.new(settings: settings)

robot.boot
robot.say_reset?
