class SettingsGenerator
  LETTERS = { 
    range: ("A".."Z"),
    limit: 2
  }

  DIGITS = {
    range: (0..9),
    limit: 3
  }

  def generate
    "#{letters}#{digits}"
  end

  private

  # Create `digits` and `letters` methods
  %i(digits letters).each { |m| define_method(m) { generate_name m } }

  # Iterate over defined range until subject limit reached
  def generate_name(subject, memo = [])
    until memo.count >= get_const(subject, :limit)
      memo << rand_from_range(subject)
    end
    memo.join
  end

  # Gets constant key by name
  def get_const(subject, key)
    self.class.const_get("#{subject.upcase}")[key]
  end

  # Gets random member of a subject range
  def rand_from_range(subject)
    range = get_const(subject, :range)
    range.to_a[Random.new.rand(range.count)]
  end
end
