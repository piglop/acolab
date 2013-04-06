module ApplicationHelper
  def user_name(user)
    if user and user.name.present?
      name = h(user.name)
    else
      name = content_tag(:span, t("anonymous"), class: "anonymous-user")
    end
    name.html_safe
  end
  
  def link_to_user(user)
    if user
      name = user.display_name
      if user.anonymous?
        name = content_tag(:span, name, class: "anonymous-user")
      end

      link_to(name, user)
    end
  end
  
  def link_to_record(record)
    return nil if record.nil?
    
    case record
    when User
      link_to_user(record)
    when Profile
      link_to_user(record.user)
    else
      link_to record.to_label, record
    end
  end
  
  # See http://blog.chrisblunt.com/rails-getting-the-id-of-form-fields-inside-a-fields_for-block/
  def sanitized_object_name(object_name)
    object_name.gsub(/]\[|[^-\[\]a-zA-Z0-9:.]/,"_").sub(/_$/,"")
  end

  def sanitized_object_name_for_id(object_name)
    object_name.gsub(/]\[|[^-a-zA-Z0-9:.]/,"-").sub(/-$/,"")
  end

  def sanitized_method_name(method_name)
    method_name.sub(/\?$/, "")
  end
  
  def form_tag_id(object_name, method_name)
    "#{sanitized_object_name_for_id(object_name.to_s)}-#{sanitized_method_name(method_name.to_s)}"
  end

  def form_tag_name(object_name, method_name)
    "#{sanitized_object_name(object_name.to_s)}[#{sanitized_method_name(method_name.to_s)}]"
  end
  
  def render_content(content)
    Redcarpet::Markdown.new(ContentRenderer, autolink: true).render(content).html_safe if content
  end
end
