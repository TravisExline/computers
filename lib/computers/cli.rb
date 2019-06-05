class Computers::CLI

  def call
    puts "Gaming PCs of 2019"
    list_pcs
    menu
    goodbye
  end

  def list_pcs
    puts "All PCs will be listed here"
  end

  def menu
    puts "Please enter the number for the computer your would like more info on, or type exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "comp info"
        puts "Type computers to see the other computers, or type exit."
      when "2"
        puts "comp info 2"
        puts "Type computers to see the other computers, or type exit."
      when "computers"
        list_pcs
      else
        puts "Invalid input, try again!"
      end
    end
  end

  def goodbye
    puts "Thanks for browsing!"
  end
end
