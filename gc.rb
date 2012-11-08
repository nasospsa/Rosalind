#!/usr/bin/env ruby

def count_cg(nucstring)
	textfile = File.open("rosalind_gc.txt")
	curstr = ''
	curID = 0
	all = {}
	textfile.each_line do |io|
		if io.start_with?'>'
			if curstr != ''
				retv = (curstr.count('CG') / curstr.length.to_f) * 100
				all[curID] =  (retv.round(5))
			end
			curstr = ''
			curID = Integer(io.slice(-5,4),10)
		else
			curstr.concat(io.gsub!(/[\n]+/, ""))
		end
	end
	puts all.sort{|a,b| a[1] <=> b[1]}.last
end

count_cg(contents)
