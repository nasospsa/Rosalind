#!/usr/bin/env ruby

def fib(n, k)
	(2..n-1).inject([1,1]) {|p, i|
		p.push(p[i-1] + (k * p[i-2]))
	}.last
end

contents = File.read("probs/rosalind_fib.txt").split("\n").first
# contents = "5 3"
n, k = contents.split(' ').map { |e| e.to_i }
puts fib n,k