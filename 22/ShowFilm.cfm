 <!--- FilmID must be passed in URL --->
 <CFPARAM NAME="URL.FilmID" TYPE="numeric">
 <!--- Retrieve information about films from database --->
<CFQUERY NAME="GetFilms" DATASOURCE="ows"
    CACHEDWITHIN="#CreateTimeSpan(0,0,15,0)#">
    SELECT FilmID, MovieTitle, PitchText, Summary
    FROM Films
</CFQUERY>
<!--- Use Query-of-Queries to grab this film?s information a--->
<CFQUERY DBTYPE="query" NAME="GetFilm">
    SELECT * FROM GetFilms
    WHERE FilmID = #URL.FilmID#
    </CFQUERY>
<HTML>
<HEAD>
<TITLE>Film Detail</TITLE>
<!--- Some CSS-based classes for formatting --->
<STYLE TYPE="text/css">
    .Title {font-family:sans-serif;font-size:15px;background:orange;color:white;}
    .Summary {font-family:sans-serif;font-size:12px;background:white;color:black;
    height:110px}
</STYLE>
</HEAD>
<BODY BGCOLOR="yellow" onLoad="focus()">
<!--- Display film information --->
<CFOUTPUT>
    <TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="5" CELLSPACING="0">
        <TR HEIGHT="20%">
            <TD CLASS="Title">
                <B>#GetFilm.MovieTitle#</B><BR>
                <I>#GetFilm.PitchText#</I>
                </TD>
        </TR>
        <TR HEIGHT="80%">
            <TD CLASS="Summary" VALIGN="top">
                #GetFilm.Summary#
            </TD>
        </TR>
    </TABLE>
</CFOUTPUT>
</BODY>
</HTML>
