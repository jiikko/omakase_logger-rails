require 'json'
require 'logger'

# @log = Logger.new(STDOUT); @log.formatter = OmakaseLogger::Rails::Formatter.new; @log.info "foo bar"

module OmakaseLogger::Rails
  class Formatter < ::Logger::Formatter
    def call(severity, time, program_name, message)
      data = {
        time: time.to_f,
        formatted_time: time,
        pid: $$,
        level: severity,
        program_name: program_name,
        message: message
      }
      data.to_json + "\n"
    rescue JSON::GeneratorError
      (data.each_pair {|k,v| data[k] = v.scrub("?") if v.is_a?(String) }).to_json + "\n"
    end
  end
end


if defined?(ActiveSupport)
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
