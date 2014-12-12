#!/usr/bin/env ruby

textfile = File.read("../../Downloads/rosalind_lcsm.txt")
texts = textfile.split(/>Rosalind_\d{4}\n/)
arr = texts.map  do |word|
	word.gsub("\n", '')
end
arr.shift

def lcsm(arr)
	found = []
	fin = arr[0].length
	(0..fin-1).each do |n1|
		(n1+1..fin-1).each do |n2|
			str_search = arr[0][n1..n2]
			res = arr[1..fin].all? do |fasta|
				fasta.include? str_search
			end
			if res
				found.push str_search
			end
		end
	end

	# Find Max Value
	max_sub = found.max_by { |x| x.length }

	# Print all with the maximum value
	puts found.find_all { |x| x.length == max_sub.length}
end

lcsm arr
