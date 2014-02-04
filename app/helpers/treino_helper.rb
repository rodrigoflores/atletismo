module TreinoHelper

  def convert(date)
    date.strftime('%d/%m/%Y')
  end

  def week_day(date)
    date.strftime('%a')
  end

  def create_new_line(string)
     string.gsub(/\n/, '<br>') if !string.nil?
  end


end
