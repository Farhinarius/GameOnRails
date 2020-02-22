require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test '003 сессия не должна создаваться для несуществующего пользователя' do
    post '/login', params: { username: 'master', password: '1' }
    assert session[:user_id].nil?
  end
  
  test '004 сессия должна создаваться для существующего пользователя' do
    post '/signup', params: { user: { username: 'google',
                                      email: 'google@google.com',
                                      password: 'google',
                                      password_confirmation: 'google' } }
      assert !session[:user_id].nil?
      assert (get '/logout'), :success
      post '/login', params: { username: 'google', password: 'google' }
      assert !session[:user_id].nil?
    end
end