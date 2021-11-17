# frozen_string_literal: true

module OmniAuthHelpers
  def mock_google_oauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.on_failure = proc { |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }

    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
                                                                  provider: 'google_oauth2',
                                                                  uid: '123456',
                                                                  info: {
                                                                    name: 'googleuser',
                                                                    email: 'user@test.com'
                                                                  }
                                                                })
  end
end
