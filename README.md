# coldfusion9_vol1
 web application construction kit - volume1

# capitulo21
 - cflogin, authentica��o, 
 - decidindo  oque proteger pag521 v1.
 - variaveis de sessao para authentica��o
 - isUserInRole testa se o usuario esta logado , passando uma string com o nome da permissao
 - tag cf login para definir usuario e senha de usuario (cfloginuser)

# capitulo22
 - exemplo popup, utilizando javascript e fun��es UDFs. exemplo widow.open, savecontent com um link que abre o popup.
 -cfcontent , cria uma variavel com diversas linhas de codigo. (um html </a>)

 # capitulo23
 - custom tags
 - conceito de  GeneratedContent que utiliza uma loginda no fechamento de uma tag. ( thisTag.executionMode eq "end" -> thisTag.GeneratedContent)
 - tags emparelhadas (tag com inico e fim <mytag></mytag>) e tag vazia (<mytag/>), � utilizado para mostrar um conteudo parcial(emparelhadas) ou inteiro(vazia)
 - thisTag.HasendTag -> verifica se � uma tag emparelhada. 

  # capitulo24
 - componentes avan�ados
 - dois tipos de componentes: estatico e baseado em instancia 
 - atributo output em cffunction:  Opcional.  Se  for  falso,  age  como  se  toda  a  fun��o  estivesse  dentro  de  uma  tag  <cfsilent> .
 Se  for  verdade,  age  como  se  toda  a  fun��o  estivesse  dentro  de  uma  tag  <cfoutput> .  Se  n�o  for  
definido,  funciona  normalmente;  vari�veis  sendo  geradas  devem  estar  em  tags  <cfoutput> .