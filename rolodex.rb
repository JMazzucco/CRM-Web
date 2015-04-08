class Rolodex

	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def modify_contact(id_selection, new_attribute, attribute_selection)
		to_modify = find(id_selection)
		to_modify.first_name = new_attribute if attribute_selection == 1
		to_modify.last_name = new_attribute if attribute_selection == 2
		to_modify.email = new_attribute if attribute_selection == 3
		to_modify.note = new_attribute if attribute_selection == 4
	end

	def display_all_contacts
		@contacts.each {|contact| contact.to_s}
	end

	def display_particular_contact(id_selection)
		single_contact = find(id_selection)
		single_contact.to_s
	end

	def display_info_by_attribute(attribute_selection)
		(@contacts.each {|contact| puts contact.first_name}) if attribute_selection == 1
		(@contacts.each {|contact| puts contact.last_name}) if attribute_selection == 2
		(@contacts.each {|contact| puts contact.email}) if attribute_selection == 3
		(@contacts.each {|contact| puts contact.notes}) if attribute_selection == 4
	end

	def delete_contact(id_selection)
		@contacts.delete_if {|inst| inst.id == id_selection}
	end

	def find(contact_id)
		@contacts.find do |contact|
			contact.id == contact_id
		end
	end
end