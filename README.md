# coldfusion9_vol1
 web application construction kit - volume1

# capitulo21
 - cflogin, authenticação, 
 - decidindo  oque proteger pag521 v1.
 - variaveis de sessao para authenticação
 - isUserInRole testa se o usuario esta logado , passando uma string com o nome da permissao
 - tag cf login para definir usuario e senha de usuario (cfloginuser)

# capitulo22
 - exemplo popup, utilizando javascript e funções UDFs. exemplo widow.open, savecontent com um link que abre o popup.
 -cfcontent , cria uma variavel com diversas linhas de codigo. (um html </a>)

 # capitulo23
 - custom tags
 - conceito de  GeneratedContent que utiliza uma loginda no fechamento de uma tag. ( thisTag.executionMode eq "end" -> thisTag.GeneratedContent)
 - tags emparelhadas (tag com inico e fim <mytag></mytag>) e tag vazia (<mytag/>), é utilizado para mostrar um conteudo parcial(emparelhadas) ou inteiro(vazia)
 - thisTag.HasendTag -> verifica se é uma tag emparelhada. 

  # capitulo24
 - componentes avançados
 - dois tipos de componentes: estatico e baseado em instancia. Baseados em instancia contem propriedades e funções. Componentes estaticos , são para apenas um retorno ou consumo.
 - atributo OUTPUT em cffunction: Opcional. Se for falso, age como se toda a função estivesse dentro de uma tag <cfsilent> .
 Se for verdade, age como se toda a função estivesse dentro de uma tag <cfoutput>. Se não for definido,  funciona  normalmente;  variáveis  sendo  geradas  devem  estar  em  tags  <cfoutput> .

 TIPOS DE RETURNTYPE: any, array, binary, component, Boolean, date, guid, 
numeric, query, string, struct, uuid

<cfinvoke> => A maneira mais direta de chamar um método CFC. Faz com que seu CFC se pareça muito com  
uma tag personalizada. você pode adicionar atributos adicionais a <cfinvoke> ou pode aninhar uma tag  <cfinvokeargument> dentro da tag <cfinvoke>. atributos: component, method, returnVariable, (method arguments), argumentCollection
O argumento pode ser passado diretamente na tag de cfinvoke, porem pode ser utilizado cfinvokeargument para casos onde o argumento nao é obrigatorio, é uma melhoria em relação ao a tag personalizada onde é necessário codigo para tratar um argumento inexistente.

o método deve usar access=?remote? em sua tag <cffunction>. Caso  contrário, não poderá ser 
acessado diretamente pela Internet por meio  de um formulário ou URL.