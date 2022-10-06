module ApiMessages
  def no_data
    { data: 'No Data Found' }
  end

  def error_saving_data(e)
    { data: 'Error Saving the data set', errors: e.messages }
  end
end
