#!/usr/bin/env ruby

def lia(k, n)
	p = 0.25
	t = 0

	(n..2**k).each do |num|
		b = (1..2**k).to_a.combination(num).size
		t += (p**num) * (1-p)**((2**k)-num) * b
	end

	(t).round(3)
end

k,n = File.read("probs/rosalind_lia.txt").split(' ').map { |e| e.to_i }

puts lia k,n