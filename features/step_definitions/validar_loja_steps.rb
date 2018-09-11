Dado("possuir credenciais válidas") do
  @email = 'senainfo2018@mailsac.com'
  @senha = 'teste'
end

Dado("acessar a página inicial da loja") do
  @home = Home.new
  @home.load
end

Dado("clicar no botão de login") do
  wait_for { @home.has_btn_login? }
  @home.btn_login.click
end

Quando("informar credenciais no formulario de login") do
  @login = Login.new
  @login.input_email.set @email
  @login.input_password.set @senha
  @login.btn_sign_in.click
end

Então("validar que usuário está logado na loja") do
  @my_account = MyAccount.new
  expect(@my_account.span_nome_usuario).to have_content 'Thiago Trentin'
end
