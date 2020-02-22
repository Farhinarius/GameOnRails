require 'test_helper'
class UserTest < ActiveSupport::TestCase
  test 'не должен сохраняться пользователь пустой или с одним пустым полем' do
    assert User.create(username: nil, email: 't@t.ru', password_digest:
      '1').invalid?, '1'
      assert User.create(username: 't', email: nil, password_digest: '1').invalid?,
      '2'
      assert User.create(username: 't', email: 't@t.ru', password_digest:
        nil).invalid?, '3'
        assert User.create(username: nil, email: nil, password_digest: '1').invalid?,
        '4'
        assert User.create(username: nil, email: 't@t.ru', password_digest:
          nil).invalid?, '5'
          assert User.create(username: 't', email: nil, password_digest: nil).invalid?,
          '6'
          assert User.create(username: nil, email: nil, password_digest: nil).invalid?,
          '7'
        end
        test 'должен сохраняться пользователь с правильно заполненными полями' do
          assert User.create(username: 't', email: 't', password_digest: '1').invalid?,
          '1'
          assert User.create(username: 't', email: 't@t.ru', password_digest: '1').valid?,
          '2'
end

test 'не должен сохраняться пользователь с неуникальными именем или почтой' do
  assert User.create(username: 't', email: 't@t.ru', password_digest: '1').valid?,
  '1'
  assert User.create(username: 'r', email: 't@t.ru', password_digest:
    '1').invalid?, '2'
    assert User.create(username: 't', email: 'y@y.ru', password_digest:
      '1').invalid?, '3'
    end
    test 'должен происходить поиск в бд' do
      assert User.create(username: 't', email: 't@t.ru', password_digest: '1').valid?,
      '1'
      assert User.find_by_email('t@t.ru'), '2'
      assert User.find_by_name('t'), '3'
    end
end