informations = [
    {
        id: 1,
        name: "Nency"
    },
    {
        id: 2,
        name: "Parth"
      
    },
    {
        id: 3,
        name: "Ram"
     
    },
    {
        id: 4,
        name: "Siya"
    }
];

def continue(informations)

    puts "Press 1 for Check all Information";
    puts "Press 2 for Add  Data";
    puts "Press 3 for Remove Data";

    puts "Select Number :- ";
    user_number = gets.chomp.to_i;
  
    if user_number > 4 || user_number < 0
        puts "Please enter a number between 1 and 3";
    end 
 
    case user_number
    when 1
        puts "===== ALL INFORMATION =====";
        informations.each do |key|   
            puts "ID : #{key[:id]} Name : #{key[:name]}"
        end 

    when 2
        puts "===== ENTER YOUR INFORMATION =====";
        puts "Enter your ID :- ";
        id = gets.chomp.to_i;
       
        add_id = informations.select {|value| value[:id] == id};
       
        if add_id.empty?
            puts "Enter your Name :- ";
            name = gets.chomp;
            
            new_information = {
                id: id,
                name: name
            };
            informations << new_information;
            puts "Update your Information :- ";
            informations.each do |key|   
                puts "ID : #{key[:id]} Name : #{key[:name]}"
            end 
        else
            puts "This ID is Already Available";
        end  

    when 3
        puts "===== REMOVE YOUR DATA =====";
        puts "Available Information :-";
        informations.each do |key|   
            puts "ID : #{key[:id]} Name : #{key[:name]}"
        end 

        puts "Select id for Remove Data :- " ;
        user_id = gets.chomp.to_i;
        
        index_delete = informations.find_index { |value| value[:id].to_i == user_id };

        if index_delete
            delete_data = informations.delete_at(index_delete);
            puts "Data with id #{user_id} removed from informations :- ";
            informations.each do |key|   
                puts "ID : #{key[:id]} Name : #{key[:name]}"
            end 
        else
                puts "No data found with id #{user_id}.";
        end
    end

    puts "Do you want Continue? So Press 1 :- ";
    exit_number = gets.chomp.to_i;
    if exit_number === 1
        puts "===== Continue =====";
        puts continue(informations);
    else
        puts "===== EXIT =====";
    end 
end 

puts continue(informations);