require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test '001 пользователь добавляется в БД' do
    post '/signup', params: { user: 
                            { username: 'google',
                              email: 'google@google.com',
                              password: 'google',
                              password_confirmation: 'google' } }
      assert_redirected_to '/'
      assert User.find_by_username('google')
    end
end
  