<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<cfscript>
  // Enter your actual Twitter username and password below.
  myTwitter = new com.mhodgson.Twitter('USERNAME','PASSWORD');
  myResult = myTwitter.getPublicTimeline().Result;
</cfscript>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Really Simple Twitter Example</title>
  </head>
  <body>
    <cfif isArray(myResult)>
      <cfloop array="#myResult#" index="tweet">
        <cfoutput>
          <p><img src="#tweet.user.profile_image_url#" alt="#tweet.user.name#" align="left" style="margin-right: 10px;" />
          <strong>#tweet.user.name#</strong><br>
          #tweet.text#</p>
          <hr/>
        </cfoutput>
      </cfloop>
    <cfelse>
      <h3>Oops!</h3><p><cfoutput>#myResult#</cfoutput></p>
    </cfif>
  </body>
</html>