#!/usr/bin/env ruby

def perm n
	ps = (1..n).to_a.permutation.to_a
	[ps.size, ps.map {|p| p.join(' ')}]
end

n = File.read("probs/rosalind_perm.txt").split("\n").map { |e| e.to_i }[0]
# n = 3

puts perm(n)