require 'test_helper'

class AppTest < ActionDispatch::IntegrationTest
# нельзя выполнять действия без ввода логина и пароля
test 'не должны получать страницу если не прошли аутентификацию' do
    get '/new'
    assert_redirected_to '/login'
    get '/posts/show'
    assert_redirected_to '/login'
    get '/users/profile'
    assert_redirected_to '/login'
    get '/posts/new'
    assert_redirected_to '/login'
end

test 'должны получать страницу если не прошли аутентификацию' do
    assert (get '/login'), :success
    assert (get '/signup'), :success
end

test 'не должны получать страницу если прошли аутентификацию' do
    post '/signup', params: { user: { name: 'google',
        username: 'google',
        password: 'google',
        password_confirmation: 'google' } }
        assert_response :redirect
        follow_redirect!
        get '/login'
        assert_redirected_to '/'
        get '/signup'
        assert_redirected_to '/'
        get '/logout'
        assert_redirected_to '/login'
    end

test 'должны получать страницу если прошли аутентификацию' do
    post '/signup', params: { user: { name: 'google',
            username: 'google',
            password: 'google',
            password_confirmation: 'google' } }
            assert_redirected_to '/'
            assert (get '/users/profile'), :success
    end
end