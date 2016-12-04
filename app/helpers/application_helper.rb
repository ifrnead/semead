module ApplicationHelper

  def data(date)
    return date.strftime("%d/%m/%Y")
  end

  def str_to_date(str)
    Date.parse(str)
  end

  def str_to_hash(str)
    eval(str)
  end

end
