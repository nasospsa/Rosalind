def difference()
	textfile = File.read("probs/rosalind_hamm.txt")
	texts = textfile.split(' ')
	arr1 = texts[0].split('')
	arr2 = texts[1].split('')
	puts texts
	result = 0;
	idx = 0
	while idx < arr1.length
		result+=1 if arr1[idx] != arr2[idx]
		idx +=1
	end
	return result
end

puts difference