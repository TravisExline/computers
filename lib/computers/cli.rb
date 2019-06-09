class Computers::CLI

  def call
    system('clear')
    Computers::Brand.scrape_brand
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
    puts "Please enter the number for the computer you would like more info on, brands to see a list of brands, or type exit:"
  end

  def find_by_brand
    puts "Please select which brand you would like to see:"
    puts Computers::Brand.all
    input=gets.strip.to_i
    if (1..10).to_a.include?(input)
      Computers::PCs.all.select{|pc| pc.brand == Computers::Brand.all[input-1]}
    elsif input == "exit"
      list_pcs
    else
      puts "Please enter a valid number"
    end
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
      elsif input == "brands"
        find_by_brand
      else
        puts "Invalid input, try again!"
      end
    end
  end

  def goodbye
    puts "Thanks for browsing!"
  end
end
