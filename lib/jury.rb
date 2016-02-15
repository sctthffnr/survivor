class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    votes = { finalists.first => 0,
              finalists.last => 0 }
    @members.each do |member|
      finalists.shuffle!
      votes[finalists.first] += 1
      puts "#{member} votes for #{finalists.first}".yellow
    end
    votes
  end

  def report_votes(finalists)
    finalists.each do |k, v|
      puts "#{k} receives #{v} votes".blue
    end
  end

  def announce_winner(final_votes)
    final_votes.each do |k, v|
      if final_votes.values.max == v
        puts "#{k} is the winner of Survivor!".green
        return k
      end
    end
  end
end
