module ProfilesHelper
  def profile_avatar(user, size: "w-20 h-20", class_name: "", **options)
    return unless user.avatar_attacher&.stored?
  
    classes = "#{size} rounded-full shadow #{class_name} #{options[:class]}"
    image_tag user.avatar_url(:thumb), class: classes.strip
  end
  def labeled_field(label, value)
    return if value.blank?
  
    content_tag :div, class: "mb-2" do
      concat content_tag(:strong, "#{label}: ")
      concat value
    end
  end

  def formatted_bio(user)
    return unless user.bio.present?
  
    content_tag(:div, class: "mb-2") do
      concat content_tag(:strong, "Bio:")
      concat tag.br
      concat simple_format(user.bio)
    end
  end
end
