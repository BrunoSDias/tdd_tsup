module Requests
  def login
    password = '123456'
    user = create(:user, password: password, password_confirmation: password)

    post "/sessions/login", params: { session: { email: user[:email], password: password } }
    return user
  end
end