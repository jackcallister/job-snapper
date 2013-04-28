def sign_up_with(email, password)
  fill_in "Email", :with => email
  find('.js-password').set password
  find('.js-password-confirmation').set password
  click_button "Sign up"
end

def sign_in_employer(user)
  visit new_employer_session_path
  fill_in_new_session_form(user)
end

def sign_in_candidate(user)
  visit new_candidate_session_path
  fill_in_new_session_form(user)
end

def fill_in_new_session_form(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end
