module ApplicationHelper

  def title(*parts)
G    @title = (parts << 'TestApp').join(' - ') unless parts.empty?
    @title || 'TestApp'
  end

end
