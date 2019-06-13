class Computers::CLI

  def call
    system('clear')
    #Computers::Brand.scrape_brand
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
    Computers::Brand.all.each_with_index do |brand, i|
      puts "#{i+1}: " + brand.name
    end
    input=gets.strip.to_i
    if (1..9).to_a.include?(input)
      brand = Computers::Brand.find_by_index(input-1)
      puts "Please enter the number for the computer you would like to see."
      brand.computers.each do |pc|
        puts pc.name
        #brand_pc
        #input=gets.strip.downcase
        # if (1..2).to_a.include?(input)
        #   puts brand.computers[input]
        # end
      end
      # Computers::PCs.all.select do |pc|
      #   pc.brand == Computers::Brand.all[input-1].name
      # end.each do |pc|
      #   puts pc.name
      # end
    elsif input == "exit"
      list_pcs
    else
      puts "Please enter a valid number"
    end
  end

  # def brand_pc
  #   "Which pc by this brand would you like to see?"
  #   input = gets.strip.to_i
  #   if (1..10).to_a.include?(input)
  #     computer = Computers::PCs.all
  #     computer.all.each do |pc|
  #       puts pc[input-1].cpu
  #       puts pc[input-1].graphics
  #       puts pc[input-1].ram
  #       puts pc[input-1].storage
  #     end
  #   end
  # end

  def user_input
    input = nil

    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @pcs[input.to_i-1].cpu
        puts @pcs[input.to_i-1].graphics
        puts @pcs[input.to_i-1].ram
        puts @pcs[input.to_i-1].storage
        puts @pcs[input.to_i-1].brand.name
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
