#input from user
puts "Enter minimum length (L) between 0 to 100:"
min_length = gets.chomp.to_i
if min_length < 100 && min_length > 0
    puts "Enter number of images (N) between 0 to 5:"
    n = gets.chomp.to_i
    if n < 5 && n > 0 
        images = []
        n.times do 
            puts "Enter dimension of image (W x H), where 0 < W < 100 & 0 < H < 100:"
            w_h = gets.chomp
            w,h = w_h.split(" ")
            images << [w.to_i, h.to_i]
        end
        images.each do |(w, h)| 
            if w < 100 && w > 0 || h < 100 && h > 0 
                if w < min_length || h < min_length
                    puts "Image not Valid"
                elsif w == h
                    puts "Image is Perfect"
                else
                    puts "Image needs to be Cropped and Accepted"
                end
            else
                puts "Enter valid Width or Height "
            end 
        end
    else    
        puts "Enter Images Number Between 0 to 5"
    end 
else
    puts "Your Length Value is Invalid"
end 



