#!/usr/bin/env ruby

def revp(s)
	l1, res = 0, []
	min, max = 4, 12

	while l1 <= s.length - min
		l2 = min - 1
		while l2 < max && (l1+l2) < s.length
			check = s[l1..l1+l2]
			h = {
				s: check,
				pos: l1 + 1
			}
			res.push h
			l2 += 1
		end
		l1 += 1
	end

	res.each do |h|
		poss = h[:s]
		if poss.length >= 4 && poss.length <= 12 && poss.reverse.gsub(/[CGAT]/, 'C' => 'G', 'G' => 'C', 'A'=>'T', 'T'=>'A') == poss
			puts "#{h[:pos]} #{poss.length}"
		end
	end
end

s = 'TCAATGCATGCGGGTCTATATGCAT'
s = File.read("probs/rosalind_revp.txt").tr("\n",'').split(/>Rosalind_\d{4}/).join
revp(s)