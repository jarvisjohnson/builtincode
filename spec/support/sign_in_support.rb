# HELP FROM:
# http://stackoverflow.com/questions/5865555/how-to-do-integration-testing-with-rspec-and-devise-cancan
module ValidClientHelper
  def signed_in_as_a_valid_client
    @client ||= FactoryGirl.create :client
    sign_in @client # method from devise:TestHelpers
  end
end

# module for helping request specs
module ValidClientRequestHelper

  # for use in request specs
  def sign_in_as_a_valid_client
    @client ||= FactoryGirl.create :client
    post_via_redirect client_session_path, 'client[email]' => @client.email, 'client[password]' => @client.password
  end
end