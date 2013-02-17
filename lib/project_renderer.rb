class ProjectRenderer < Redcarpet::Render::HTML
  def header(text, header_level)
    p [text, header_level]
    super
  end
end
