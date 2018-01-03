OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['client_id'], ENV['client_secret'], skip_jwt: true#, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

