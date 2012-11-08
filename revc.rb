#!/usr/bin/env ruby

contents = File.read("probs/rosalind_revc.txt")

def revcomp(nucstring)
	rev = nucstring.reverse
	return rev.gsub(/[CGAT]/, 'C' => 'G', 'G' => 'C', 'A'=>'T', 'T'=>'A')
end

puts revcomp(contents)
