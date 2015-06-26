module ItemsHelper

	def packed_link_text(to_pack)
		to_pack.status? ? 'done' : 'got it'
	end

end
