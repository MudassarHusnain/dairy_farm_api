#config/initializers/cookie_serailizer.rb
Rails.application.config.action_dispatch.cookies_serializer = :hybrid
#config/initializers/session_store.rb
if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_user_signup_using_password_digestion', domain: 'user_signup_using_password_digestion-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_user_signup_using_password_digestion'
end