module ApplicationHelper

	def full_title(page_title = '')
		base_title = 'Writings Hub'
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def current_user?(user)
    user == current_user
  end
  

  def flash_class_name(name)
    case name
    when 'notice' then 'success'
    when 'alert'  then 'danger'
    else name
    end
	end
	
end
