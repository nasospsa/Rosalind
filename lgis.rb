#!/usr/bin/env ruby

# # Wrong Implementation of my version
# def comparator(n, perm)
# 	final, maxL = [], 0
# 	perm.each_with_index do |num, i|
# 		for i2 in i+1..n-1
# 			result, rest = [perm[i]], perm.last(n-i2)
# 			rest.each_with_index do |num3, i3|
# 				calcIdx = i2 + i3
# 				# puts "#{rest}"
# 				if yield(perm[calcIdx], result.last)
# 					result.push perm[calcIdx]
# 				end
# 			end
# 			final.push result
# 		end
# 	end
# 	final.max_by {|a| a.length }
# end

# def lgis(n,perm)
# 	pos, neg = [], []
	
# 	puts comparator(n, perm) {|a,b| a >= b}.join ' '
# 	puts comparator(n, perm) {|a,b| a <= b}.join ' '
# end

Node = Struct.new(:val, :back)
def ls(n)
	pileTops = []
	# sort into piles
	for x in n
		# binary search
		low, high = 0, pileTops.size-1
		while low <= high
			mid = low + (high - low) / 2
			# if pileTops[mid].val >= x
			if yield(pileTops[mid].val, x)
				high = mid - 1
			else
				low = mid + 1
			end
		end
		i = low
		node = Node.new(x)
		node.back = pileTops[i-1] if i > 0
		pileTops[i] = node
	end
 
	result = []
	node = pileTops.last
	while node
		result.unshift(node.val)
		node = node.back
	end

	result
end

c = File.read("probs/rosalind_lgis.txt").split("\n")
n, perm = c[0].to_i, c[1].split.map { |e| e.to_i }
# n, perm = 5, %w(5 1 4 2 3).map { |e| e.to_i }
# lgis(n,perm.map { |e| e.to_i })
puts ls(perm) {|a,b| a >= b}.join ' '
puts ls(perm) {|a,b| a <= b}.join ' '