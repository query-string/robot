class Robot
  attr_reader :settings, :name

  def initialize(attributes)
    @settings = attributes.fetch(:settings)
    @name     = @settings.name
  end

  def boot
    say_knock!
    say_hi!
  end

  def say_hi!
    p "Yalo, my name is #{settings.name}!"
  end

  def say_knock!
    3.times { print "\a"; sleep 0.5 }
  end

  def say_reset?
    printf "\033[31mUH-OH - press \"y\" if you want to reset my settings and don't call me #{name} anymore: "
    prompt = STDIN.gets.chomp
    settings.reset! if prompt == "y"
  end
end
