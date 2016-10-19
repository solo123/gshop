module ApplicationHelper
  def object_url(object, options = {})
    if object
      send "#{object.class.name.underscore.split('/').last}_path", object, options
    else
      ''
    end
  end	

  ALERT_TYPES = [:error, :info, :success, :warning]
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                 content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") + msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def icon_link(link_text, icon, link_url, options = {})
    link_to(raw("<i class='glyphicon glyphicon-#{icon}'></i> #{link_text}"), link_url, options)
  end
  def row_icon_link(link_text, link_url, options = {})
    icon = nil
    if link_text == 'Show'
      icon = 'eye-open'
    elsif link_text == 'Edit'
      icon = 'edit'
    elsif link_text == 'Del'
      icon = 'remove'
    end
    icon_link(link_text, icon, link_url, options)
  end
  def issue_date_class(dt)
    if dt < Time.now
      'danger'
    elsif dt < -7.days.ago
      'warning'
    else
      ''
    end
  end

end
