#!/usr/bin/env ruby

def iprb(k, m, n)
	all = (k+m+n).to_f
	a = []
	kp = [1, 1, 1, 1, 0.75, 0.5, 1, 0.5, 0]

	[k,m,n].each_with_index do |num1, i1|
		[k,m,n].each_with_index do |num2, i2|
			prob = kp[i1*3 + i2]
			if i1 == i2
				p = (num1/all) * ((num2-1)/(all-1)) * prob
			else
				p = (num1/all) * (num2/(all-1)) * prob
			end
			a.push p
		end
	end

	a.inject(:+).round(5)
end

k,m,n = File.read("probs/rosalind_iprb.txt").split(' ').map { |e| e.to_i }

puts iprb(k,m,n)