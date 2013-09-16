module UsersHelper
  def follow_user_tag(user)
    class_name = "follow"
    text = "follow"
    if current_user.blank?
      return link_to text, login_url, :class => "minibutton"
    end
    if user.followers.include?(current_user)
      class_name = "followed"
      text = "unfollow"
    end
    link_to text, "#", :onclick => "return Users.follow(this);",
            :class => "minibutton",
            'data-user' => user.name,
            'data-followed' => (class_name == "followed")
  end
end
