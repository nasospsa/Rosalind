#!/usr/bin/env ruby

def fc n
	(1..n).inject(:*) || 1
end

def pper(n,k)
	(fc(n)/fc(n-k)) % (10**6)
end

n,k = File.read("probs/rosalind_pper.txt").split(' ').map { |e| e.to_i }
# n,k = 21, 7
puts pper n,k