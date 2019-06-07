class Computers::CLI

  def call
    system('clear')
    puts "Gaming PCs of 2019"
    Computers::Scraper.scrape
    list_pcs
    menu
    user_input
    goodbye
  end

  def list_pcs
    @pcs = Computers::PCs.all
    @pcs.each.with_index(1) do |pc|
      puts "#{pc.name}"
    end
  end

  def menu
    puts "Please enter the number for the computer your would like more info on, or type exit:"
  end

  def user_input
    input = nil

    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @pcs[input.to_i-1].cpu
        puts @pcs[input.to_i-1].graphics
        puts @pcs[input.to_i-1].ram
        puts @pcs[input.to_i-1].storage
        puts @pcs[input.to_i-1].brand
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
