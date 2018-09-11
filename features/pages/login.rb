class Login < SitePrism::Page
  element :input_email, '#email'
  element :input_password, '#passwd'
  element :btn_sign_in, '#SubmitLogin'
end