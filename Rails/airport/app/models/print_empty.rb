class PrintEmpty
  def after_commit(record)
    if record.flight_id.blank?
      print "Flight Is empty"
    end
    if record.aircraft_id.blank?
      print "Aricraft id is empty"
    end
  end
end