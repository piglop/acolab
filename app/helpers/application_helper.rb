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
end
