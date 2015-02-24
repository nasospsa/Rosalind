#!/usr/bin/env ruby

def rstr(n, p, s)
	prob = s.chars.inject(1) { |prod, ch|
		if ['G', 'C'].include? ch
			prod *= p / 2
		else
			prod *= (1-p) / 2
		end
	}
	(1 - (1-prob)**n).round(3)
end

cnts = File.read("probs/rosalind_rstr.txt").split("\n")
nps =  [*(cnts[0].split(' ').map { |e| e.to_f  }), cnts[1]]
# nps = [90000, 0.6, "ATAGCCGA"]
puts rstr *nps