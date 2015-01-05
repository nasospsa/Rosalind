#!/usr/bin/env ruby

def iprb(*kmn)
	all 	= kmn.inject(:+).to_f
	t 		= 0
	kp 		= [1, 1, 1, 1, 0.75, 0.5, 1, 0.5, 0]

	kmn.each_with_index do |num1, i1|
		kmn.each_with_index do |num2, i2|
			prob = kp[i1*3 + i2]
			left = (i1 == i2) ? num2-1 : num2
			p = (num1/all) * (left/(all-1)) * prob
			t += p
		end
	end

	t.round(5)
end

k,m,n = File.read("probs/rosalind_iprb.txt").split(' ').map { |e| e.to_i }
# k,m,n = 2, 2, 2

puts iprb(k,m,n)