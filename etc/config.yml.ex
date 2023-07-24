# =============================================================================
# Bind Address
# Specify which pam configuration file should be used to authenticate requests.
# It should correlate to a filename stored within /etc/pam.d
#
# The environment variable flight_PROFILE_API_bind_address takes precedence.
# =============================================================================
# bind_address: tcp://127.0.0.1:924
#
# =============================================================================
# Profile Command
#
# The command to used to run the Flight Profile executable.
#
# The default value uses the 'flight_ROOT' environment variable.  Expanding
# environment variables is only supported when using the default value.  You
# will need to use explicit full path if you override this value.
#
# The environment variable flight_PROFILE_API_profile_command takes
# precedence.
# =============================================================================
# profile_command: ${flight_ROOT}/bin/flight profile

# ==============================================================================
# Command PATH
# The PATH the profile command will be executed with.
#
# The environment variable flight_PROFILE_API_command_path takes precedence.
# ==============================================================================
# command_path: /usr/sbin:/usr/bin:/sbin:/bin

# ==============================================================================
# Command Timeout
# The maximum time to wait when running a profile command. Commands which
# take longer then this period will be terminated.
#
# The environment variable flight_PROFILE_API_command_timeout takes precedence.
# ==============================================================================
# command_timeout: 30

# ==============================================================================
# Log Path
# The file the logger will write to. It will write to standard error if
# omitted.
#
# Relative paths are expanded according to the "Relative path expansion" rules
# described below.
#
# The environment variable flight_PROFILE_API_log_path takes precedence.
# ==============================================================================
# log_path: /dev/stdout

# =============================================================================
# Log Level
# Specify which level of logging should be used. The supported values are:
# fatal, error, warn, info, or debug
#
# The environment variable flight_PROFILE_API_log_level takes precedence.
# =============================================================================
# log_level: info
#
# =============================================================================
# Shared Secret Path
# The path to the file containing the shared secret used to verify the login
# credentials.
#
# The environment variable flight_PROFILE_API_shared_secret_path takes
# precedence.
# =============================================================================
# shared_secret_path: etc/shared-secret.conf
