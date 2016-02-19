class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "Creating tribe #{@name}".pink
  end

  def tribal_council(immune = nil)
    @members.delete(immune) if immune
    contestant = @members.shuffle!.first
    @members << immune if immune
    puts "#{contestant} has been eliminated in the tribal council".red
    @members.delete(contestant)
  end

  def to_s
    @name
  end
end
