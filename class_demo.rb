class Student

    def initialize(informations)
        @informations = informations
    end
      
    def start
        loop do 
            show_menu
            user_choice = gets.chomp.to_i;
            case user_choice
            when 1
                check_information
            when 2
                add_data
            when 3
                remove_data
            else
                puts "Please enter a number between 1 and 3";
            end
            
            print "\nDo you want to continue? Press 1 to continue :- ";
            exit_number = gets.chomp.to_i
        break if exit_number != 1
        end
    end

    def show_menu
        puts "\nPress 1 to check all information";
        puts "Press 2 to add data";
        puts "Press 3 to remove data";
        print "\nEnter your choice :- ";
    end
      
    def check_information
        puts "\n===== ALL INFORMATION ====="
        @informations.each do |info|
          puts "ID: #{info[:id]}, Name: #{info[:name]}";
        end
    end
      
    def add_data
        puts "\n===== ENTER YOUR INFORMATION ====="
        print "\nEnter your ID :- ";
        id = gets.chomp.to_i;
        add_id = @informations.select {|value| value[:id] == id};
       
        if add_id.empty?
            print "Enter your Name :- ";
            name = gets.chomp;
            
            new_information = {
                id: id,
                name: name
            };

            @informations << new_information;
            puts "\n===== Update your Information ===== ";
            @informations.each do |key|   
                puts "ID : #{key[:id]} Name : #{key[:name]}";
            end 
        else
            puts "This ID is Already Available";
        end  
        
    end
      
    def remove_data
        check_information
        print "\nSelect ID to remove :- ";
        user_id = gets.chomp.to_i;
        puts "\n===== REMOVE YOUR DATA ====="
        index_delete = @informations.find_index { |value| value[:id].to_i == user_id };

        if index_delete
            delete_data = @informations.delete_at(index_delete);
            puts "Data with id #{user_id} removed from informations :- ";
            @informations.each do |key|   
                puts "ID : #{key[:id]} Name : #{key[:name]}";
            end 
        else
            puts "No data found with id #{user_id}.";
        end
    end

end

informations = [
    { id: 1, name: "Nency" },
    { id: 2, name: "Parth" },
    { id: 3, name: "Ram" },
    { id: 4, name: "Siya" }
];
  
student = Student.new(informations);
student.start()
  

