class TocRenderer < Redcarpet::Render::HTML_TOC
  include ERB::Util

  def self.sanitize_id(text)
    text.parameterize
  end
  
  def initialize(*args)
    super
    @headers = []
  end
  
  def doc_header
    ""
  end
  
  def doc_footer
    output = ""
    @headers.each do |text, sub|
      output << %Q{<li><a href="##{text.parameterize}">#{h text}</a>}
      if sub.any?
        output << "<ul>"
        sub.each do |sub_text|
          output << %Q{<li><a href="##{sub_text.parameterize}">#{h sub_text}</a></li>}
        end
        output << "</ul>"
      end
      output << %Q{</li>}
    end
    output
  end
  
  def header(text, level)
    case level
    when 1
      @headers << [text, []]
    when 2
      @headers << [text, []] if @headers.empty?
      @headers.last.last << text
    end
    ""
  end
end
