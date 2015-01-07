#!/usr/bin/env ruby

def hamm(s1, s2)
	(0..s1.length-1).inject(0) {|s, i|
		s += (s1[i] == s2[i]) ? 0 : 1
	}
end

s1,s2 = File.readlines("probs/rosalind_hamm.txt")
# s1,s2 = "GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"
puts hamm s1,s2