module ApiMessages
  def no_data
    { data: 'No Data Found' }
  end

  def error_saving_data(e)
    { data: 'Error Saving the data set', errors: e.messages }
  end

  def data_deleted
    { data: 'Record Deleted Successfully' }
  end

  def data_operation_not_success
    { data: 'Record Could not be deleted' }
  end
end
