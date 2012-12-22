#!/usr/bin/env ruby

def subs
	contents = File.read('probs/rosalind_subs.txt')
	texts = contents.split(' ')
	string1 = texts[1]
	string2 = texts[0]
	idx = 0
	oldxidx = 0
	found = 0;
	newstring = '';
	while idx != nil do
		idx = string2.index(string1, oldxidx)
		break if idx == nil
		newstring = newstring + (idx+1).to_s + " "
		oldxidx = idx + 1
	end
	puts newstring
end

subs