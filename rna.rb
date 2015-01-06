#!/usr/bin/env ruby

def rna(nucstring)
	nucstring.tr("T", "U")
end

s = File.read("probs/rosalind_rna.txt")
# s = "GATGGAACTTGACTACGTAAATT"

puts rna s