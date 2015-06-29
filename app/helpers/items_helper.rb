module ItemsHelper

	def packed_link_img(to_pack)
		to_pack.status? ? 'button_packed.png' : 'button_unpacked.png'
	end

end
