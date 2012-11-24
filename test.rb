#!/usr/bin/env ruby

contents = File.read("rosalind_revc.txt")


def countNuc(nucstring)
	ca = nucstring.count('A')
	ct = nucstring.count('T')
	cc = nucstring.count('C')
	cg = nucstring.count('G')
	return "#{ca} #{cc} #{cg} #{ct}"
end

def rna(nucstring)
	u = nucstring.gsub(/T/) { 'U' }
	return u
end

def revcomp(nucstring)
	rev = nucstring.reverse
	return rev.gsub(/[CGAT]/, 'C' => 'G', 'G' => 'C', 'A'=>'T', 'T'=>'A')
end

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

def counProb
	textfile = File.open("rosalind_prob.txt")
	str = textfile.read
	arrayNums = str.split(' ')
	arr = [];
	arrayNums.each do |s|
		p = s.to_f
		percent = ((p/2)**2)*2 + (((1-p)/2)**2)*2
		puts "#{p} => #{percent}"
		arr.push(percent.round(4))
	end
	return arr.join(' ')
end

def difference(str1,str2)
	arr1 = str1.split('')
	arr2 = str2.split('')
	result = 0;
	idx = 0
	while idx < arr1.length
		result+=1 if arr1[idx] == arr2[idx]
		idx +=1
	end
	return result
end



puts counProb
