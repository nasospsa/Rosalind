#!/usr/bin/env ruby

def lexf(symbols, length)
	f = symbols
	(2..length).each {|i|
		f = f.map { |ch|
			symbols.map { |s|
				ch + s
			}
		}.flatten
	}
	f
end

def lexf2(symbols, length)
	symbols.repeated_permutation(length).map(&:join).to_a
end

contents = File.read("probs/rosalind_lexf.txt").split("\n")
symbols, length = contents[0].split, contents[1].to_i
# symbols, length = %w(T A G C), 2
puts lexf symbols, length