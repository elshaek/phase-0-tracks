class TodoList
	def initialize(item_list)
		@list = item_list
	end

	def get_items
		@list
	end

	def add_item(item_name)
		@list << item_name
	end

	def delete_item(item_name)
		@list.delete(item_name)
	end

	def get_item(index_item)
		@list[index_item]
	end
end