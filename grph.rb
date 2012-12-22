#!/usr/bin/env ruby

def grph
	contents = File.read('probs/rosalind_grph.txt').split(' ')
	idxOut = 0;
	k = 3;
	while idxOut < contents.length
		idxIn = 0;
		while idxIn < contents.length
			if contents[idxOut+2][-k..-1] == contents[idxIn+1][0..k-1] && contents[idxOut+1]+contents[idxOut+2] != contents[idxIn+1]+contents[idxIn+2]
				puts contents[idxOut][1..-1] + " " + contents[idxIn][1..-1]
			end
			idxIn += 3
		end
		idxOut += 3
	end
end

grph