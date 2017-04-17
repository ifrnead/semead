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

  def fa_icon(icon, title: '', classes: '')
    "<i class='fa fa-#{icon} #{classes}' title='#{title}' aria-hidden='true'></i>".html_safe
  end

end
