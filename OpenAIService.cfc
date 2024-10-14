component {

	function init(required string secret){
		variables.apiKey = arguments.secret;
		return this;
	}

	function completions(required string content){

		var envelope = {
			"model": "gpt-4o",
			"messages": [
				{"role": "user", "content": arguments.content}
			]
		}
		cfhttp(url="https://api.openai.com/v1/chat/completions", method="POST"){
			cfhttpparam(type="header", name="content-type", value="application/json");
			cfhttpparam(type="header", name="Authorization", value="Bearer #variables.apiKey#");
			cfhttpparam(type="body", value=serializeJSON(envelope));
		}

		var res = isJSON(cfhttp.fileContent) ? deserializeJSON(cfhttp.fileContent).choices[1].message.content : "";

		return res;
	}

}