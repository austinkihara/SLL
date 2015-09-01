class SinglyLinkedList
	attr_accessor :head

	def initialize
		@head = Node.new('head')
	end

	def insert(new_element, element)
		new_node = Node.new(new_element)
		curr = find(element)
		new_node.next = curr.next
		curr.next = new_node
	end
	
	def find(element)
		curr = @head
		curr = curr.next while curr && curr.element != element
		curr
	end

	def display_nodes
		data = []
		curr = @head
		while curr.next
			data << curr.next
			curr = curr.next
		end
		data
	end

	def display_elements
		display_nodes.map { |n| n.element}
	end

	def remove(element)
		previous_node = find_previous(element)
		if previous_node
			output = previous_node.next
			if previous_node.next != nil
				previous_node.next = previous_node.next.next
			end
			output.next = nil
			output
		else
			nil
		end
	end

	def find_previous(element)
		curr = @head
		while curr.next && curr.next.element != element
		curr = curr.next
		end
		if curr.next && curr.next.element == element
		curr
		else 
			nil
		end

	end	
end