class TocRenderer < Redcarpet::Render::HTML_TOC
  include ERB::Util
  
  def doc_header
    @header_count = 0
    %Q{<div class="well"><ul class="nav nav-list"><li class="nav-header">#{I18n.t "toc"}</li>}
  end
  
  def doc_footer
    %Q{</ul></div>}
  end
  
  def header(text, level)
    result = %Q{<li class="level-#{level}"><a href="#toc_#@header_count">#{h text}</a></li>}
    @header_count += 1
    result
  end
end
