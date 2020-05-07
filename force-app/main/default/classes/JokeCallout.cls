public class JokeCallout {
    
	public String joke {get;set;}
    
    public String makeJokeCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.chucknorris.io/jokes/random');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            joke = (String)results.get('value');
        }
        return null;
    }
}