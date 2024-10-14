<cfoutput>
<cfscript>

	service = new OpenAIService(secret = getSystemSetting("API_KEY"));

</cfscript>

<pre>
#dump(service.completions("say hello in multiple languages"))#
</pre>
</cfoutput>