require_relative 'game'
require_relative 'tribe'
require_relative 'contestant'
require_relative 'jury'
require_relative 'colorizr'

# After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia
                  julia fernando dena orit colt zhalisa farrin muhammed ari
                  rasha gauri)
@contestants.map! { |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: 'Pagong', members: @contestants.shift(10))
@hunapu = Tribe.new(name: 'Tagi', members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================

# This is where you will write your code for the three phases

def phase_one
  puts 'Phase one'.green
  rounds = 8
  rounds.times do
    losing_tribe = @borneo.immunity_challenge
    puts "#{losing_tribe} lost the immunity challange.".blue
    losing_tribe.tribal_council
  end
  rounds
end

def phase_two
  puts 'Phase two'.green
  @borneo.clear_tribes
  @borneo.add_tribe(@merge_tribe)
  rounds = 3
  rounds.times do
    immune_contestant = @borneo.individual_immunity_challenge
    @merge_tribe.tribal_council(immune_contestant)
  end
  rounds
end

def phase_three
  puts 'Phase three'.green
  rounds = 7
  rounds.times do
    immune_contestant = @borneo.individual_immunity_challenge
    @jury.members << @merge_tribe.tribal_council(immune_contestant)
  end
  rounds
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one # 8 eliminations
@merge_tribe = @borneo.merge('Cello') # After 8 eliminations, merge the two tribes together
phase_two # 3 more eliminations
@jury = Jury.new
phase_three # 7 elminiations become jury members
finalists = @merge_tribe.members # set finalists
vote_results = @jury.cast_votes(finalists) # Jury members report votes
@jury.report_votes(vote_results) # Jury announces their votes
@jury.announce_winner(vote_results) # Jury announces final winner
