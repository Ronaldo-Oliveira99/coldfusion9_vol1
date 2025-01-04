<cfquery name='owner1' datasource='ows_oracle'>
    SELECT *
    FROM MERCHANDISEORDERSITEMS
</cfquery>


<cfquery name='owner2' datasource='ows_oracle'>
    SELECT *
    FROM ows_MERCHANDISEORDERSITEMS
</cfquery>

<cfloop query="owner1">

    <cfquery name='ows_expenses' datasource='ows_oracle'>
       insert into ows_MERCHANDISEORDERSITEMS(ITEMID,ITEMPRICE,ORDERID	,ORDERITEMID,ORDERQTY)
        VALUES ( 

            <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#ITEMID#"/> ,
            <cfqueryparam CFSQLType="CF_SQL_FLOAT" value="#ITEMPRICE#"/>,
            <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#ORDERID#"/> ,
            <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#ORDERITEMID#"/> ,
            <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#ORDERQTY#"/> 




            <!--- 
            <cfqueryparam CFSQLType="CF_SQL_DATE" value="#createODBCDate(DATEINTHEATERS)#"/>,
         
            <cfqueryparam CFSQLType="CF_SQL_CHAR" value="#IMAGENAMELARGE#"/>,
            <cfqueryparam CFSQLType="CF_SQL_CHAR" value="#IMAGENAMESMALL#"/>,
            <cfqueryparam CFSQLType="CF_SQL_CHAR" value="#MERCHDESCRIPTION#"/>,
            <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#MERCHID#"/>,
            <cfqueryparam CFSQLType="CF_SQL_CHAR" value="#MERCHNAME#"/>,
         
            <cfqueryparam CFSQLType="CF_SQL_FLOAT" value="#SALARY#"/> 
            --->

        )

    </cfquery>
    
    <!--- <cfoutput>
        #DESCRIPTION#
        #EXPENSEAMOUNT#
        #EXPENSEDATE#
        #EXPENSEID#
        #EXPENSEID#
    </cfoutput>  --->
</cfloop>

<cfdump  var="#actors#">
<cfdump  var="#tb_vendedores#">