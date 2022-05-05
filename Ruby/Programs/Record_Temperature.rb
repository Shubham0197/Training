# Record_Temperatures

def record_temps(records, current_week)
  x = 0
  while x < 7

    if records[x][0] > current_week[x][0]
      records[x][0] = current_week[x][0]
    end

    if records[x][1] < current_week[x][1]
      records[x][1] = current_week[x][1]
    end

    x += 1

  end

  records

end
