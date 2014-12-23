#!/usr/bin/env ruby

def prob(str, probs)
	b = []
	probs.each do |n|
		gc = n.to_f/2
		at = (1-n.to_f)/2
		prob = str.chars.inject(1) {|p,c| p *= ((c == 'G') || (c == 'C')) ? gc : at}
		b.push Math.log10(prob.to_f).round(3)
	end
	b.join ' '
end

lines = File.read("probs/rosalind_prob.txt").split("\n")
str = lines[0]
arr = lines[1].split(' ')

puts prob str, arr