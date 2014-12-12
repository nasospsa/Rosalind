#!/usr/bin/env ruby

def iev(str)
	probability = [1, 1, 1, 0.75, 0.5, 0]
	nums = str.split(' ')
	nums.each_with_index.inject(0) { |sum,(n,i)| sum += ((n.to_f)*2) * probability[i] }
end

puts iev '18791 19988 16715 19804 19872 18166'