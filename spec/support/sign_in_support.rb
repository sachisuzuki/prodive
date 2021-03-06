# frozen_string_literal: true

module SignInSupport
  def sign_in(user)
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.actions').click
  end
end
