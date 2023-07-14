require 'logger'
require 'flight/subprocess'

require_relative './json_web_token'

module ProfileAPI
  class ProfileCLI
    class << self
      def remove_node(token, remove_hunter_node: false)
        name = JsonWebToken.decode(token)['name']
        return unless name

        new(
          *flight_profile,
          'remove',
          name,
          '--wait',
          *hunter_param(remove_hunter_node)
          timeout: 3600
        ).run_local
      end

      private

      def hunter_param(arg)
        ['--remove-hunter-entry'] if arg
      end

      def flight_profile
        Config.profile_command
      end
    end

    def initialize(*cmd, user: nil, stdin: nil, timeout: nil, env: {})
      @timeout = timeout || Config.command_timeout
      @cmd = cmd
      @user = user
      @stdin = stdin
      @env = {
        'PATH' => Config.command_path
      }.merge(env)
    end

    def run_local(&block)
      ProfileAPI.logger.debug("Running subprocess: #{stringified_cmd}")
      process = Flight::Subprocess::Local.new(
        env: @env,
        logger: ProfileAPI.logger,
        timeout: @timeout,
      )
      result = process.run(@cmd, @stdin, &block)

      parse_result(result)
      log_command(result)
      result
    end

    private

    def parse_result(result)
      if result.exitstatus == 0 && expect_json_response?
        begin
          unless result.stdout.nil? || result.stdout.strip == ''
            result.stdout = JSON.parse(result.stdout)
          end
        rescue JSON::ParserError
          result.exitstatus = 128
        end
      end
    end

    def expect_json_response?
      @cmd.any? {|i| i.strip == '--json'}
    end

    def log_command(result)
      ProfileAPI.logger.info <<~INFO.chomp
        COMMAND: #{stringified_cmd}
        USER: #{@user}
        PID: #{result.pid}
        TIMEOUT: #{@timeout}
        STATUS: #{result.exitstatus}
      INFO
      ProfileAPI.logger.debug <<~DEBUG
        ENV:
        #{JSON.pretty_generate @env}
        STDIN:
        #{@stdin.to_s}
        STDOUT:
        #{result.stdout}
        STDERR:
        #{result.stderr}
      DEBUG
    end

    def stringified_cmd
      @stringified_cmd ||= @cmd
        .map { |s| s.empty? ? '""' : s }.join(' ')
    end
  end
end
