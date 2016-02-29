module ApplicationHelper
  def collapse_tag
    button_tag(type: 'button', class: 'navbar-toggle collapsed', data: { toggle: 'collapse', target: '#collapse-menu' }) do
      fa_icon('bars')
    end
  end

  def current_fio
    session && session['cas'] && session['cas']['extra_attributes']['fio']
  rescue
    nil
  end

  def error_message_for(obj)
    "#{t('helpers.object_error')} #{@event.errors.count} #{t('helpers.errors', count: @event.errors.count)}:"
  end

  def title(controller, action=nil)
    controller, action = controller.split(?#) if action.nil?
    t action, scope: [:helpers, :titles, controller]
  end

  def circle_button_for(action, options={})
    link_options = (action == :destroy ? { :method => :delete, :data => { :confirm => t('helpers.confirm') } } : {})
    link_to options[:url], link_options do
      content_tag(:div, fa_icon_for(action), class: "btn btn-circle #{options[:class]}")
    end
  end

  def label_for(key)
    t(key, scope: 'activerecord.attributes')
  end

  def attribute_row_for(obj, method)
    content_tag :div, class: 'row' do
      concat content_tag :b, label_for("#{obj.class.name.underscore}.#{method}"), class: 'col-md-2'
      concat content_tag :div, simple_format(obj.send(method)), class: 'col-md-10'
    end
  end

  def try_l(object, options = {})
    if object
      l(object, options)
    end
  end

  private

  def fa_icon_for(action)
    case action
    when :edit
      fa_icon 'pencil'
    when :new
      fa_icon 'plus'
    when :destroy
      fa_icon 'trash-o'
    end
  end
end
