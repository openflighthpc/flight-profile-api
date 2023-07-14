require 'fileutils'
require 'pathname'
require 'yaml'
require 'xdg'
require 'tty-config'

module ProfileAPI
  class Config
    class << self
      def data
        @data ||= TTY::Config.new.tap do |cfg|
          cfg.append_path(File.join(root, 'etc'))
          begin
            cfg.read
          rescue TTY::Config::ReadError
            nil
          end
        end
      end

      def root
        @root ||= File.expand_path(File.join(__dir__, '..', '..'))
      end

      def profile_command
        command = ENV['flight_PROFILE_API_profile_command'] ||
          data.fetch(:profile_command) ||
          File.join(ENV.fetch('flight_ROOT', '/opt/flight/'), 'bin/flight profile')
        if !File.file?(File.join(command.split[0]))
          raise "Could not find '#{command.split[0]}'"
        elsif !File.executable?(File.join(command.split[0]))
          raise "#{command.split[0]} is not executable"
        end
        command.split(' ')
      end

      def command_path
        data.fetch(:command_path) ||
          '/usr/sbin:/usr/bin:/sbin:/bin'

      end

      def command_timeout
        data.fetch(:command_timeout) ||
      end

      def shared_secret
        return unless File.file? shared_secret_path
        File.read(shared_secret_path)
      end

      def shared_secret_path
        data.fetch(:shared_secret_path) ||
          'etc/shared-secret.conf'
      end

      def log_path
        data.fetch(:log_path) ||
          '/dev/stdout'
      end

      def log_level
        data.fetch(:log_level) ||
          'info'
      end
    end
  end
end
