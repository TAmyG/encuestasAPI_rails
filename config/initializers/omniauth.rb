Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "914900141827-vhnc2qteqp542fvkautc344fn6hv8s2d.apps.googleusercontent.com", "sYmKMQc5aLIR9CoKx1-CP1dc"
end