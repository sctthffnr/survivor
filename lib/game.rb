class Game
  attr_reader :tribes

  def initialize(tribe_one, tribe_two)
    @tribes = [tribe_one, tribe_two]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.shuffle!
    @tribes.first
  end

  def clear_tribes
    @tribes = []
  end

  def merge(tribe_name)
    new_tribe_members = []
    @tribes.each do |tribe|
      tribe.members.each do |member|
        new_tribe_members << member
      end
    end
    Tribe.new(name: tribe_name, members: new_tribe_members)
  end

  def individual_immunity_challenge
    @tribes.first.members.shuffle!
    @tribes.first.members.first
  end
end
