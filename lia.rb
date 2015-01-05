#!/usr/bin/env ruby

def lia(k, n)
	p = 0.25
	a = (1..2**k).to_a
	t = (n..2**k).inject(0) do |s, num|
		c = a.combination(num).size

		# Cumulative Binomial Probability Formula
		# b(x; n, P) = nCx * Px * (1 - P)n - x
		s += c * (p**num) * (1-p)**((2**k)-num)
	end

	(t).round(3)
end

k,n = File.read("probs/rosalind_lia.txt").split(' ').map { |e| e.to_i }
# k,n = 2,1

puts lia k,n