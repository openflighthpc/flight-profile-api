require 'logger'
require_relative 'profile_api/config'
require_relative 'profile_api/profile_cli'

module ProfileAPI
  class << self
    def logger
      @logger ||= Logger.new(Config.log_path).tap do |log|
        next if Config.log_level == 'disabled'

        level = case Config.log_level
                when 'fatal'
                  Logger::FATAL
                when 'error'
                  Logger::ERROR
                when 'warn'
                  Logger::WARN
                when 'info'
                  Logger::INFO
                when 'debug'
                  Logger::DEBUG
                end

        if level.nil?
          log.level = Logger::ERROR
          log.error "Unrecognised log level: #{config.log_level}"
        else
          log.level = level
        end
      end
    end
  end
end
