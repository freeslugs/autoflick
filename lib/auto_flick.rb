require "auto_flick/version"
require 'auto_flick/api'
require 'flickraw'

module AutoFlick
  def self.config(config)
    FlickRaw.api_key = config[:api_key]
    FlickRaw.shared_secret = config[:shared_secret]
    @username = config[:username]
    @password = config[:password]

    authenticate
  end

  def self.upload(path)
    id = flickr.upload_photo path, :title => "Title", :description => "This is the description", :is_public => true
    info = flickr.photos.getInfo(:photo_id => id)
    FlickRaw.url_o(info)
  end

  private

  def self.authenticate
    token = flickr.get_request_token
    auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'write')
    verify = Api.get_key(auth_url, @username, @password)
    
    begin
      flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
      login = flickr.test.login
    rescue FlickRaw::FailedResponse => e
      puts "Authentication failed : #{e.msg}"
    end 
  end
end
