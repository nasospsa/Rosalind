#!/usr/bin/env ruby

def eval(n, s, p)
	p.map do |pr|
		calcProb = s.chars.inject(1) { |prod, chr|
			prod *= (['G', 'C'].include? chr) ? pr / 2 : (1-pr) / 2
		}
		r = calcProb * (n - s.length + 1)
		r.round(3)
	end
end

n, s, p = 10, 'AG', [0.25, 0.5, 0.75]

c = File.read("probs/rosalind_eval.txt").split("\n")
n, s, p = c[0].to_i, c[1], c[2].split(' ').map { |e| e.to_f  }

puts eval(n,s,p).join(' ')