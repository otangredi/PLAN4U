namespace :guest_choices do
  desc "Update all guest_choices choice"
  task update_all: :environment do
    user = User.first
    event = user.events.first
    guests = event.guests

    guests.each do |guest|
      guest.status = "Attending"
      if guest.update({ status: guest.status })
        puts "status updated"
        guest.guest_choice = GuestChoice.new
        case guest.relationship
        when "My Family"
          puts "My Family"
          case guest.name
          when "Elena Zangari"
            guest.guest_choice.choices = ["Elena Zangari", "Pasquale Tangredi", "Massimo Romeo"]
          when "Pasquale Tangredi"
            guest.guest_choice.choices = ["Pasquale Tangredi", "Elena Zangari", "Chloe Tangredi"]
          when "Chloe Tangredi"
            guest.guest_choice.choices = ["Chloe Tangredi", "Josephine Gurreri", "Massimo Romeo"]
          when "Cathy Lopez"
            guest.guest_choice.choices = ["Cathy Lopez", "Elena Zangari", "Pasquale Tangredi"]
          when "Carmine Marcarella"
            guest.guest_choice.choices = ["Carmine Marcarella", "Selina Marcarella", "Ryan Fontes"]
          when "Selina Marcarella"
            guest.guest_choice.choices = ["Selina Marcarella", "Carmine Marcarella", "Ryan Fontes"]
          # when "Josephine Gurreri"
          #   guest.guest_choice.choices = ["Josephine Gurreri", "Massimo Romeo", "Chloe Tangredi"]
          when "Massimo Romeo"
            guest.guest_choice.choices = ["Massimo Romeo", "Josephine Gurreri", "Elena Zangari"]
          #when "Dominic Agnelli"
          #  guest.guest_choice.choices = ["Dominic Agnelli", "Massimo Romeo", "Chloe Tangredi"]
          when "Rick Saraceno"
            guest.guest_choice.choices = ["Rick Saraceno", "Ryan Fontes", "Selina Marcarella"]
          when "Ryan Fontes"
            guest.guest_choice.choices = ["Ryan Fontes", "Carmine Marcarella", "Selina Marcarella"]
          end
        when "Partner's Family"
          puts "Partner's Family"
          case guest.name
          when "Rick Novak"
            guest.guest_choice.choices = ["Rick Novak", "Susan Connor", "Margaret Adelman"]
          when "Susan Connor"
            guest.guest_choice.choices = ["Susan Connor", "Rick Novak", "Margaret Adelman"]
          when "Margaret Adelman"
            guest.guest_choice.choices = ["Margaret Adelman", "Susan Connor", "Rick Novak"]
          when "Ronald Barr"
            guest.guest_choice.choices = ["Ronald Barr", "Marie Broadbet", "Roger Lum"]
          when "Marie Broadbet"
            guest.guest_choice.choices = ["Marie Broadbet", "Ronald Barr", "Roger Lum"]
          when "Roger Lum"
            guest.guest_choice.choices = ["Roger Lum", "Marlene Donahue", "John Doe"]
          when "Marlene Donahue"
            guest.guest_choice.choices = ["Marlene Donahue", "Jeff Johnson", "Melvin Forbis"]
          when "Jeff Johnson"
            guest.guest_choice.choices = ["Jeff Johnson", "Marlene Donahue", "Melvin Forbis"]
          when "Melvin Forbis"
            guest.guest_choice.choices = ["Melvin Forbis", "Jeff Johnson", "Marlene Donahue"]
          when "John Doe"
            guest.guest_choice.choices = ["John Doe", "Melvin Forbis", "Jeff Johnson"]
          end
        when "My Friend"
          puts "My Friend"
          case guest.name
          when "Michael Scott"
            guest.guest_choice.choices = ["Michael Scott", "Dwight Schrute", "Ryan Howard"]
          when "Dwight Schrute"
            guest.guest_choice.choices = ["Dwight Schrute", "Michael Scott", "Pam Halpert"]
          when "Toby Flenderson"
            guest.guest_choice.choices = ["Toby Flenderson", "Kevin Malone", "Oscar Martinez"]
          when "Jim Halpert"
            guest.guest_choice.choices = ["Jim Halpert", "Pam Halpert", "Dwight Schrute"]
          when "Pam Halpert"
            guest.guest_choice.choices = ["Pam Halpert", "Jim Halpert", "Michael Scott"]
          when "Ryan Howard"
            guest.guest_choice.choices = ["Ryan Howard", "Michael Scott", "Jim Halpert"]
          when "Andy Bernard"
            guest.guest_choice.choices = ["Andy Bernard", "Angela Martin", "Oscar Martinez"]
          when "Angela Martin"
            guest.guest_choice.choices = ["Angela Martin", "Kevin Malone", "Oscar Martinez"]
          when "Kevin Malone"
            guest.guest_choice.choices = ["Kevin Malone", "Oscar Martinez", "Ryan Howard"]
          when "Oscar Martinez"
            guest.guest_choice.choices = ["Oscar Martinez", "Angela Martin", "Kevin Malone"]
          end
        when "Partner's Friend"
          puts "Partner's Friend"
          case guest.name
          when "Phyllis Lapin-Vance"
            guest.guest_choice.choices = ["Phyllis Lapin-Vance", "Stanley Hudson", "Erin Hannon"]
          when "Creed Bratton"
            guest.guest_choice.choices = ["Creed Bratton", "Stanley Hudson", "Darryl Philbin"]
          when "Stanley Hudson"
            guest.guest_choice.choices = ["Stanley Hudson", "Phyllis Lapin-Vance", "Creed Bratton"]
          when "David Wallace"
            guest.guest_choice.choices = ["David Wallace", "Nellie Bertram", "Jan Levinson"]
          when "Erin Hannon"
            guest.guest_choice.choices = ["Erin Hannon", "Phyllis Lapin-Vance", "Stanley Hudson"]
          when "Karen Filippelli"
            guest.guest_choice.choices = ["Karen Filippelli", "Darryl Philbin", "David Wallace"]
          when "Darryl Philbin"
            guest.guest_choice.choices = ["Darryl Philbin", "Nellie Bertram", "Gabe Lewis"]
          when "Nellie Bertram"
            guest.guest_choice.choices = ["Nellie Bertram", "David Wallace", "Gabe Lewis"]
          when "Jan Levinson"
            guest.guest_choice.choices = ["Jan Levinson", "David Wallace", "Karen Filippelli"]
          when "Gabe Lewis"
            guest.guest_choice.choices = ["Gabe Lewis", "Erin Hannon", "Darryl Philbin"]
          end
        end
        puts "guest_choice updated" if guest.guest_choice.update({ choices: guest.guest_choice.choices })
      end
    end
    puts "All done"
  end
end
