class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "Creating tribe #{@name}".pink
  end

  def tribal_council(immune)
  end

  def to_s
    @name
  end
end
