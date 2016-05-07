#!/usr/bin/env ruby

contents = File.read("probs/rosalind_sseq.txt").split(/>Rosalind_\d*\n/)
_nil, s, t = *contents.map { |str| str.gsub "\n", '' }
# s, t = 'ACGTACGTGACG', 'GTA'

def sseq(s, t)
	indices = []
	last_idx = 0
	t.each_char do |chr|
		i = s.index(chr, last_idx+1)
		if i
			indices.push (last_idx = i + 1)
		else
			puts "ooops", chr
		end
	end
	indices.join ' '
end

puts sseq(s, t)