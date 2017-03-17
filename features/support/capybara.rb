Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
  config.ignore_ssl_errors
end
