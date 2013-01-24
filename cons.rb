#!/usr/bin/env ruby



def cons
	arr = Hash.new { |hash, key| hash[key] = [] }
	#arr['A'][] = 0
	#arr['T'][] = 0
	#arr['C'][] = 0
	#arr['G'][] = 0
	contents = File.read("probs/rosalind_cons.txt")
	lineIdx = -1
	contents.each_line do |line|
		lineIdx += 1
		charIdx = -1
		line.each_char do |chr|
			charIdx += 1
			arr[chr][charIdx] = (arr[chr][charIdx] || 0) + 1
		end
	end

	consensus = ''
	conIdx = 0
	hashLine = {}
	table = {'A' => [], 'C' => [], 'G' => [], 'T' => []}

	while conIdx < arr['A'].length do
		hashLine = {'A' => arr['A'][conIdx]||0,
					'T' => arr['T'][conIdx]||0,
					'G' => arr['G'][conIdx]||0,
					'C' => arr['C'][conIdx]||0}
		table['A'][conIdx] = arr['A'][conIdx]||0
		table['C'][conIdx] = arr['C'][conIdx]||0
		table['G'][conIdx] = arr['G'][conIdx]||0
		table['T'][conIdx] = arr['T'][conIdx]||0
		consensus.concat(hashLine.sort{|a,b| a[1] <=> b[1]}.last[0])
		conIdx += 1
	end
	puts consensus
	
	table.each do |key, val|
		str = "#{key}: "
		puts str.concat(val.join(' '))
	end
	
	return arr
end

cons

