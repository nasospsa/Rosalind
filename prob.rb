#!/usr/bin/env ruby

def counProb
	textfile = File.open("probs/rosalind_prob.txt")
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

def prob dna, a
	a.map { |gc|
		p = dna.split('').inject(1) { |prod, ch|
			if ['G', 'C'].include? ch
				prod *= gc / 2
			else
				prod *= (1-gc) / 2
			end
		}
		l = Math.log10(p)
		l.round(3)
	}.join(' ')
end


cnts = File.read("probs/rosalind_prob.txt").split("\n")
dna, a = cnts[0], cnts[1].split(' ').map { |e| e.to_f  }
# dna, a = 'ACGATACAA', %w(0.129 0.287 0.423 0.476 0.641 0.742 0.783).map { |e| e.to_f  }

puts prob(dna, a)
# puts counProb