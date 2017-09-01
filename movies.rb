movies = Hash.new
movies = {Drive: 4}
choice = ""
while choice != "quit"
    puts "What would you like to do?"
    puts "add, update, display, delete, quit"
    choice = gets.chomp
    case choice
    when "add"
        puts "Movie title: "
        title = gets.chomp
        puts "Rating of #{title}:"
        rating = gets.chomp
        if movies[title.to_sym] == nil
            movies[title.to_sym] = rating.to_i
            puts "Added!"
        else
            puts "Movie already exists!"
        end
    when "update"
        puts "Movie title:"
        title = gets.chomp
        if movies[title.to_sym] = nil
            puts "Movie cannot be found!"
        else
            puts "New rating"
            rating = gets.chomp
            movies[title.to_sym] = rating.to_i
            puts "Done!"
        end
    when "display"
        movies.each do |movie, rating|
            puts "#{movie}: #{rating}"
        end
    when "delete"
        puts "What is the movie you'd like to delete?"
        title = gets.chomp
        if movies[title.to_sym] = nil
            puts "Movie cannot be found!"
        else
            movies.delete(title.to_sym)
            puts "Done!"
        end
    when "quit"
        puts "Thanks for using my program!"
    else
        puts "Error! Please enter 'add', 'update', 'display', 'delete', or 'quit'"
        choice = gets.chomp
    end
end
