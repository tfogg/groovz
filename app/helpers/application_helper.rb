module ApplicationHelper
	def flash_class(type)
		case type
		when :alert
			"alert-danger"
		when :notice
			"alert-success"
		else 
			""
		end
	end

	def status_post_link(status)
		html = ""
		if status.post && status.post.attachment?
            
            html << link_to(status.post.attachment_file_name, status.post.attachment.url)
            return html.html_safe
        end 
    end

    def avatar_profile_link(user, image_options={}, html_options={})
    	avatar_url = user.avatar? ? user.avatar.url : user.gravatar_url
    	link_to(image_tag(user.avatar.url, image_options), profile_path(current_user))
    end
	
end
