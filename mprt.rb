#!/usr/bin/env ruby
require 'net/http'
def req url
	response = Net::HTTP.get_response(URI.parse(url))

	case response
	when Net::HTTPSuccess then
		response.body
	when Net::HTTPRedirection then
		location = response['location']
		req location
	else
		warn "ERROR"
	end
end


def mprt pIDs
	pat = /N[^P][ST][^P]/
	t = []

	pIDs.each do |id|
		r = []
		url = "http://www.uniprot.org/uniprot/#{id}.fasta"
		result = req url

		s = result.split("\n").drop(1).join

		idx = 0
		while s.match(pat, idx)
			f = s.index(pat, idx)
			r.push f+1
			idx = f+1
		end
		if r.size > 0
			t.push [id, r.join(' ')]
		end
	end
	t
end


pIDs = File.read("probs/rosalind_mprt.txt").split("\n")
# pIDs = %w(
# 	A2Z669
# 	B5ZC00
# 	P07204_TRBM_HUMAN
# 	P20840_SAG1_YEAST
# )
puts mprt pIDs