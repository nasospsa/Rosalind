#!/usr/bin/env ruby

contents = File.read("probs/rosalind_rna.txt")

def rna(nucstring)
	u = nucstring.gsub(/T/) { 'U' }
	return u
end
