module ApplicationHelper

  def title(*parts)
    @title = (parts << 'TestApp').join(' - ') unless parts.empty?
    @title || 'TestApp'
  end

  def admins_only(&block)
    if current_user && current_user.admin?
      block.call
    end
    nil
  end
  
  def authorized?(permission, object, &block)
    if can?(permission.to_sym, object) || (current_user && current_user.admin?)
      block.call
    end
    nil
  end

end
