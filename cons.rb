#!/usr/bin/env ruby

def cons(words)
	h = Hash.new { |h, key| h[key] = [] }
	maxChars = 0
	words.each do |line|
		maxChars = line.length if line.length > maxChars
		line.each_char.with_index do |char, i|
			h[char][i] = (h[char][i] || 0) + 1
		end
	end

	consensus = ""
	for i in 0...maxChars
		m = h.max_by {|k,v| v[i]||0 }
		consensus += m[0]
	end
	puts consensus

	h.sort.each do |k,v|
		printed = Array.new(maxChars, 0).map.with_index{ |x, i| v[i] || x }.join ' '
		puts "#{k}: #{printed}"
	end

	h
end

words = File.read("probs/rosalind_cons.txt").tr("\n",'').split(/>Rosalind_\d{4}/)
cons words

