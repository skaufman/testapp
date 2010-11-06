module ApplicationHelper

  def title(*parts)
    @title = (parts << 'TestApp').join(' - ') unless parts.empty?
    @title || 'TestApp'
  end

end
