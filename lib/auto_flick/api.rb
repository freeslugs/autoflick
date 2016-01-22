require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

include Capybara::DSL

module AutoFlick
  class Api
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, {
        :js_errors => false, 
        :cookies_enabled => true, 
        :phantomjs_options => ["--cookies-file=cookies.text"]
      })
    end

    Capybara.javascript_driver = :poltergeist

    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :poltergeist
    end

    def self.get_key(auth_url, username, password)
      begin
        visit auth_url

        fill_in('username', :with => username)
        fill_in('passwd', :with => password)
        click_button "login-signin"

        visit auth_url

        fill_in('username', :with => username)
        fill_in('passwd', :with => password)
        click_button "login-signin"

        click_button "OK, I'LL AUTHORIZE IT"  
        
        key = find("#Main span").text
        
      rescue Exception => e
        puts e.message
      end

      page.driver.quit
      File.delete("cookies.text")

      return key
    end
  end
end