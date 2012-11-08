#!/usr/bin/env ruby

contents = File.read("probs/rosalind_revc.txt")
def countNuc(nucstring)
	ca = nucstring.count('A')
	ct = nucstring.count('T')
	cc = nucstring.count('C')
	cg = nucstring.count('G')
	return "#{ca} #{cc} #{cg} #{ct}"
end

puts countNuc(contents)