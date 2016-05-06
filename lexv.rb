#!/usr/bin/env ruby

contents = File.read("probs/rosalind_lexv.txt").split("\n")
ab = contents[0].split
p = contents[1].to_i

# ab = %w(D N A)
# p = 3

def lexv(ab, p)
	res = []
	arr_idx = Array.new(p) { |i| 0 }
	idx = 0
	last = ''

	while last != (ab.last * p)
		if last.size < p
			idx = 0
			arr_idx[last.length] = idx
			last += ab[0]
		elsif idx != (ab.size - 1)
			idx += 1
			arr_idx[last.length-1] = idx
			last = last[0..p-2] + ab[idx]
		else
			# puts last, arr_idx.inspect
			while arr_idx[last.length-1] == (ab.size - 1)
				last = last[0..last.length-2]
			end
			arr_idx[last.length - 1] += 1
			last[-1, 1] = ab[arr_idx[last.length - 1]]
			# puts arr_idx.inspect, last, '----'
		end
		res.push last
	end
	res
end

result = lexv(ab, p)

puts result
