#!/usr/bin/env ruby

s = File.read("probs/rosalind_ini.txt").split("\n")[0]
# s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'

def ini(s)
	['A', 'C', 'G', 'T'].map { |c| s.count c }.join ' '
end

puts ini(s)