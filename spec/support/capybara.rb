Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
end

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit
