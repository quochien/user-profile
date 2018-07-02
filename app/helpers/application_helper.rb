module ApplicationHelper
  def display_date(date)
    days = (Date.today - date.to_date).to_i

    case days
    when 0
      "Today"
    when 1
      "Yesterday"
    else
      "#{days} days ago"
    end
  end
end
