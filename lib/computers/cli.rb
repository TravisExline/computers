class Computers::CLI

  def call
    Computers::Scraper.get_page
    puts "Gaming PCs of 2019"
    list_pcs
    menu
    goodbye
  end

  def list_pcs
    @pcs = Computers::PCs.all
    @pcs.each.with_index(1) do |pc, i|
      puts "#{i}: #{pc.name}"
    end
  end

  def menu
    puts "Please enter the number for the computer your would like more info on, or type exit:"
    input = nil

    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @pcs[input.to_i-1]
      elsif input == "computers"
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
