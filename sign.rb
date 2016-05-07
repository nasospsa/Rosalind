#!/usr/bin/env ruby

n = File.read("probs/rosalind_sign.txt").split("\n")[0].to_i
# n = 2
def sign(n)
	arr = (1..n).to_a
	res = []	
	c = 0

	while c < 2**n
		c += 1
		res.concat arr.permutation(n).to_a.map { |p| p.join ' ' }
		idxx = arr.size - 1
		begin
			last_num = arr[idxx] = -arr[idxx]
			idxx -= 1
		end while last_num > 0
	end
	res
end

result = sign(n)
puts result.size, result