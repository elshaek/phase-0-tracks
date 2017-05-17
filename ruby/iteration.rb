# RELEASE 0
# Write your own method that takes a block

def method1
	puts "Hi, how are you?"
	yield
end

method1 { puts "How's your day?" }