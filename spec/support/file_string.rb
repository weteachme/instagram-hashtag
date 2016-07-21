module FileString
  def get_file_string(is_user: false)
    path = is_user ? 'test_user_response.html' : 'test_response.html'
    file = File.open("spec/support/#{path}")
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
