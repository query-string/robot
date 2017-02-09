require "./settings_generator"

class SettingsManager  
  NAME_STORE    = ".store-name"
  HISTORY_STORE = ".store-history"

  def name
    @name ||= name_exists? ? read_name : get_name
  end

  def reset!
    file = File.open(HISTORY_STORE, "a")
    file << "#{name}☭"
    file.close
    File.delete(NAME_STORE) if name_exists?
  end

  private

  def read_name
    File.read(NAME_STORE)
  end

  def write_name(n)
    file = File.open(NAME_STORE, "w")
    file << n
    file.close
  end

  def get_name
    n = SettingsGenerator.new.generate
    name_unique?(n) ? write_name(n) : get_name
    n
  end

  def name_exists?
    File.exist?(NAME_STORE)
  end

  def name_unique?(n)
    !read_history.include?(n)
  end

  def read_history
    @history ||= File.exist?(HISTORY_STORE) ? File.open(HISTORY_STORE).read.split("☭") : []
  end
end
