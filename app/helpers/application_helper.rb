module ApplicationHelper
  def page_class_active (controller, action='')
    action == '' ? (params[:controller] == controller ? 'active' : '') : (params[:controller] == controller && params[:action] == action ? 'active' : '')
  end

  def to_hash data
    Hash[data.map{ |x| [x[0], x[1]] }.flatten]
  end
end
