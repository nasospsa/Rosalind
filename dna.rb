#!/usr/bin/env ruby

def dna(nucstring)
	['A','C','G','T'].map { |ch| nucstring.count(ch) }.join ' '
end

s = File.read("probs/rosalind_dna.txt")
# s = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

puts countNuc(s)