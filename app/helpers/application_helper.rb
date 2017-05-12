module ApplicationHelper
  def join_or_leave_link(user, chatroom)
    if user.chatrooms.include?(chatroom)
      link_to chatroom_chatroom_memberships_path(chatroom), method: :delete do
        content_tag(:i, "", class: "icon-line-cross", style: "color: #00CDCD")
      end
    else
      link_to chatroom_chatroom_memberships_path(chatroom), method: :post do
        content_tag(:i, "", class: "icon-plus", style: "color: #00CDCD")
      end
    end
  end
end
