class ContentRenderer < Redcarpet::Render::HTML
  include ERB::Util
  
  def initialize
    super
  end
  
  def header(text, level)
    level += 1
    %Q{<h#{level} id="#{text.parameterize}">#{text}</h#{level}>}
  end
end
