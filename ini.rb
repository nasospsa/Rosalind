#!/usr/bin/env ruby

s = File.read("probs/rosalind_ini.txt").split("\n")[0]
# s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'

def ini(s)
	a = s.count 'A'
	c = s.count 'C'
	g = s.count 'G'
	t = s.count 'T'
	[a, c, g, t]. join ' '
end

puts ini(s)