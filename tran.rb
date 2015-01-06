#!/usr/bin/env ruby

def tran(s1, s2)
	transitions, transversions = 0.to_f, 0.to_f
	(0..s1.size-1).each do |i|
		if (
			(['A', 'G'].permutation.to_a.include? [s1[i], s2[i]]) ||
			(['T', 'C'].permutation.to_a.include? [s1[i], s2[i]])
			)
			transitions += 1
		elsif (s1[i] != s2[i])
			transversions += 1
		end
	end
	(transitions / transversions).round(11)
end


data = File.read("probs/rosalind_tran.txt").tr("\n",'').split(/>Rosalind_\d{4}/).drop(1)
# contents=">Rosalind_0209
# GCAACGCACAACGAAAACCCTTAGGGACTGGATTATTTCGTGATCGTTGTAGTTATTGGA
# AGTACGGGCATCAACCCAGTT
# >Rosalind_2200
# TTATCTGACAAAGAAAGCCGTCAACGGCTGGATAATTTCGCGATCGTGCTGGTTACTGGC
# GGTACGAGTGTTCCTTTGGGT"
# data = contents.tr("\n",'').split(/>Rosalind_\d{4}/).drop(1)


s1, s2 = data
puts tran s1,s2