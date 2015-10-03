module OmakaseLogger
  module Rails
    return unless Rails.env.production?
    # unsubscribe ActionView::LogSubscriber
    ['render_template', 'render_partial', 'render_collection'].each do |event|
      ActiveSupport::Notifications.notifier.listeners_for("#{event}.action_view").each do |x|
        ActiveSupport::Notifications.unsubscribe(x)
      end
    end

    # unsubscribe xxx_fragment
    %w(write_fragment read_fragment exist_fragment? expire_fragment expire_page write_page).each do |event|
      ActiveSupport::Notifications.notifier.listeners_for("#{event}.action_controller").each do |x|
        ActiveSupport::Notifications.unsubscribe(x)
      end
    end
  end
end

module Rails
  module Rack
    class Logger < ActiveSupport::LogSubscriber
      def started_request_message(request)
         'Started %s "%s" for %s at %s by %s' % [
          request.request_method,
          request.filtered_path,
          request.ip,
          Time.now.to_default_s,
          request.env['HTTP_USER_AGENT'] ]
      end
    end
  end
end
