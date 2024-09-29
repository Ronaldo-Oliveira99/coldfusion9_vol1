<!--- mesclar  um  diretório  inteiro  de  arquivos  PDF  em  um  arquivo  PDF. --->


<cfpdf action="merge" overwrite="yes" order="name" ascending="yes"
       stoponerror="yes" directory="samples/pdfsToMerge"
       destination="pdfs/titlepagemerge3.pdf" />