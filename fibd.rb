#!/usr/bin/env ruby

content = "81 18"


items = content.split " "
n = items[0].to_i
m = items[1].to_i

total = 0
arr = []

for i in 0..n-1
	if i > 1
		newItem = arr[i-1] + arr[i-2]
		if i == m
			newItem = newItem - 1
		elsif i > m
			newItem = newItem - arr[i-m-1]
		end
		arr.push newItem
	else
		arr.push 1
	end
end

puts arr.last