# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pictgame_session',
  :secret      => '046ead0413e87034230a54d7f042e3038197e3b6cf9a9f35c6ba131df1dc682de336669d99c2b405d4b9635a58aeb7268e88826859078e64b5de3f0fa5e68079'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
