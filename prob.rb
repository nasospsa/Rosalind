#!/usr/bin/env ruby

def counProb
	textfile = File.open("probs/rosalind_prob.txt")
	str = textfile.read
	arrayNums = str.split(' ')
	arr = [];
	arrayNums.each do |s|
		p = s.to_f
		percent = ((p/2)**2)*2 + (((1-p)/2)**2)*2
		puts "#{p} => #{percent}"
		arr.push(percent.round(4))
	end
	return arr.join(' ')
end

puts counProb