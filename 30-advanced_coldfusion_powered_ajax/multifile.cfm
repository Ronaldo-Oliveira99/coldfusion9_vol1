 <!---
	Nome:   multifile.cfm 
	Autor: Raymond  Camden  (ray@camdenfamily.com)
	Descri��o:  Controle  de  upload  de  v�rios  arquivos.
 --->

<!--- esta com problemas no flash --->
 <form action="multifile.cfm" method="post"> 
	<cffileupload name="files" maxfileselect="5" url="multiupload.cfm">
</form>