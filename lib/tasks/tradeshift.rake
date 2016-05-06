# -*- ruby -*-

namespace :xalg do

  desc "Login to Tradeshift site"
  task :login => :environment do

    @callback_url = 'http://127.0.0.1:3000/oauth/callback'

    @consumer = OAuth::Customer.new("OwnAccount", "OwnAccount", :site => 'https://api-sandbox.tradeshift.com/tradeshift/rest/external')

    @request_token = @consumer.get_request_token(oauth_callback: @callback_url)
    session[:token] = @request_token.token
    session[:token_secret] = @request_token.secret

    redirect_to @request_token.authorized_url(oauth_callback: @callback_url)
  end
end
