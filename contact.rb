class Contact
attr_accessor :id, :first_name, :last_name, :email, :notes

	def initialize(first_name, last_name, email, notes)
		@id = id
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
	end

	def to_s
		print "first name: #{@first_name}, "
		print "last name: #{@last_name}, "
		print "email: #{@email}, "
		print "notes: #{@notes}"
		puts ""
	end
end