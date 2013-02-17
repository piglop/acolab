class TocRenderer < Redcarpet::Render::HTML_TOC
  include ERB::Util
  
  def doc_header
    @header_count = 0
    %Q{<ul class="nav nav-list">}
  end
  
  def doc_footer
    %Q{</ul>}
  end
  
  def header(text, level)
    result = %Q{<li><a href="#toc_#@header_count"><i class="icon-chevron-right"></i> #{h text}</a></li>}
    @header_count += 1
    result
  end
end
