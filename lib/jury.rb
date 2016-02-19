class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    # Figured how to 'inject' a hash using each_with_object
    # http://technology.customink.com/blog/2014/10/14/better-hash-injection-using-each-with-object/
    @members.each_with_object(Hash.new(0)) do |member, v|
      finalists.shuffle!
      v[finalists.first] += 1
      puts "#{member} votes for #{finalists.first}".yellow
    end
  end

  def report_votes(votes)
    votes.each do |k, v|
      puts "#{k} receives #{v} votes".blue
    end
  end

  def announce_winner(votes)
    winner = votes.key(votes.values.max)
    puts "#{winner} is the winner of Survivor!".green
    winner
  end
end
