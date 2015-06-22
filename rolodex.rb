class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find(contact_id)
      @contacts.find {|contact| contact.id == contact_id }
  end

  def remove_contact(contact)
    @contacts.delete(contact)
  end


end


# added after

  # def find(target_id)
  #     @contacts.find do |contact|
  #       contact.id == target_id
  #     end
  #   end

  #   def delete(target_id)
  #     @contacts.delete(find(target_id))
  #   end

  #   def edit(id, first_name, last_name, email, notes)
  #     contact = find(id)

  #     contact.first_name = first_name
  #     contact.last_name = last_name
  #     contact.email = email
  #     contact.notes = notes
  #   end



# def edit_contact
#     puts "Please type the contact id number found in contact display:"
#     id = gets.chomp.to_i

#     puts "Type the new first name"
#     first_name = gets.chomp.capitalize

#     puts "Please type the change you want made last name"
#     last_name = gets.chomp.capitalize

#     puts "Please type the change you want made to the email"
#     email = gets.chomp.downcase

#     puts "Please type the change you want made to notes"
#     notes = gets.chomp.downcase
