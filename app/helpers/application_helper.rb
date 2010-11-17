module ApplicationHelper

  def title(*parts)
    @title = (parts << 'TestApp').join(' - ') unless parts.empty?
    @title || 'TestApp'
  end

  def admins_only(&block)
    if current_user && current_user.admin?
      block.call
    end
  end

end
