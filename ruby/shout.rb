# module Shout
# 	def self.yell_angrily(words)
#     words.upcase + "!!!" + " :("
#   end
# 
#   def self.yelling_happily(words)
#   	words + "!" + " :D"
#   end
# end
# 
# p Shout.yell_angrily("stop")
# p Shout.yelling_happily("Hi there")

module Shout
	def yell_angrily(words)
	  words + "!!!" + " :("
	end

	def yelling_happily(words)
		words + "!" + " :D"
	end
end

class Parents
	include Shout
end

class Teacher
	include Shout
end

parent = Parents.new
puts parent.yelling_happily("great job")

teacher = Teacher.new
puts teacher.yell_angrily("clean your room")