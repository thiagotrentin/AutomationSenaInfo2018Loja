#language: pt

Funcionalidade: Validar loja de exemplo
  Eu como um usuário cadastrado
  Quero acessar validar o fluxo de login do site
  Para que possa ser possível acessar o mesmo

  @validar_login_loja
  Cenário: Validar login de usuário existente na loja
    Dado possuir credenciais válidas
    E acessar a página inicial da loja
    E clicar no botão de login
    Quando informar credenciais no formulario de login
    Então validar que usuário está logado na loja


