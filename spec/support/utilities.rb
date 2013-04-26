def sign_up_with(email, password)
  fill_in "Email", :with => email
  find('.js-password').set password
  find('.js-password-confirmation').set password
  click_button "Sign up"
end

def sign_in_employer(user)
  post new_employer_session_path, :email => user.email, :password => user.password
end

def sign_in_candidate(user)
  post new_candidate_session_path, :email => user.email, :password => user.password
end
