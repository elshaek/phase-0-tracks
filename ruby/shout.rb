module Shout
	def self.yell_angrily(words)
    words.upcase + "!!!" + " :("
  end

  def self.yelling_happily(words)
  	words + "!" + " :D"
  end
end

p Shout.yell_angrily("stop")
p Shout.yelling_happily("Hi there")