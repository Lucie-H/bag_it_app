module ItemsHelper

	def packed_link_img(to_pack)
		to_pack.status? ? 'checked.png' : 'unchecked.png'
	end

end
