#!/usr/bin/env ruby

def kmer(n, s)
	res = []
	lex = ['A', 'C', 'G', 'T'].repeated_permutation(n).to_a
	lex_mapped = lex.map { |mer| mer.join '' }
	lex_mapped.each do |l|
		res.push s.scan(/(?=#{l})/).count.to_s
	end
	res.join ' '
end

s = "CTTCGAAAGTTTGGGCCGAGTCTTACAGTCGGTCTTGAAGCAAAGTAACGAACTCCACGGCCCTGACTACCGAACCAGTTGTGAGTACTCAACTGGGTGAGAGTGCAGTCCCTATTGAGTTTCCGAGACTCACCGGGATTTTCGATCCAGCCTCAGTCCAGTCTTGTGGCCAACTCACCAAATGACGTTGGAATATCCCTGTCTAGCTCACGCAGTACTTAGTAAGAGGTCGCTGCAGCGGGGCAAGGAGATCGGAAAATGTGCTCTATATGCGACTAAAGCTCCTAACTTACACGTAGACTTGCCCGTGTTAAAAACTCGGCTCACATGCTGTCTGCGGCTGGCTGTATACAGTATCTACCTAATACCCTTCAGTTCGCCGCACAAAAGCTGGGAGTTACCGCGGAAATCACAG"
n = 4

s = "TTGATTACCTTATTTGATCATTACACATTGTACGCTTGTGTCAAAATATCACATGTGCCT"
n = 2

s = File.read("probs/rosalind_kmer.txt").tr("\n",'').split(/>Rosalind_\d{4}/).drop(1)[0]
n = 4



puts kmer(n, s)