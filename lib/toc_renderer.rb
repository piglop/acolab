class TocRenderer < Redcarpet::Render::HTML_TOC
  include ERB::Util

  def self.sanitize_id(text)
    text.parameterize
  end
  
  def doc_header
    ""
  end
  
  def doc_footer
    ""
  end
  
  def header(text, level)
    if level == 1
      %Q{<li><a href="##{text.parameterize}">#{h text}</a></li>}
    else
      nil
    end
  end
end
