module InstagramCrawler
  module JSONParser

    protected

      def get_parsed_json(page_content)
        json_matcher = 'window._sharedData = '
        sibling = page_content.css('#react-root').last

        begin
          sibling = sibling.next_element
        end while sibling && sibling.text.empty? && !(sibling.text =~ /#{json_matcher}/)

        inline_text = sibling.text

        unparse_json = inline_text.split(/#{json_matcher}/).last.chomp(';')
        JSON.parse(unparse_json)
      end
  end
end
