module FileString
  def get_file_string
    file = File.open('spec/support/test_response.html')
    contents = ''
    file.each{|line| contents << line}
    contents
  end

  def get_empty_file_string
    file = File.open('spec/support/empty_response.html')
    contents = ''
    file.each{|line| contents << line}
    contents
  end
end
