#!/usr/bin/env ruby

content = "28 4"


items = content.split " "
n = items[0].to_i
k = items[1].to_i

total = 0
arr = []

for i in 0..n-1
	if i > 1
		newItem = arr[i-1] + k*arr[i-2]
		arr.push newItem
	else
		arr.push 1
	end
end

puts arr.last