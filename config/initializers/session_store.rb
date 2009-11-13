# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_superilmo_session',
  :secret      => 'c7b5dda858fd72cde5107bd034a0f10cec0e46f117833cae4e9f018fcafabafa6e795f60aee85fc47c554c53210ee7b1c8f7057731bc83bac5f8f55e4b92f83f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
