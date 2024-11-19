public class createWorkspaceUsers {
    public static void createUser() {
    String ContactId;
    String email = 'test24@YourGoogleWorkspaceName.com';
    String firstName = 'Testfirst';
    String lastName = 'Testlast';
    
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    
   
    request.setEndpoint('callout:google');
    request.setMethod('POST');
    request.setHeader('Content-Type', 'application/json');

    String userJson = JSON.serialize(new Map<String, Object>{
        'primaryEmail' => email,
        'name' => new Map<String, String>{
            'givenName' => firstName,
            'familyName' => lastName
        },
        'password' => 'TemporaryPassword123' 
    });

    request.setBody(userJson);

    HttpResponse response = http.send(request);

    if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
      
        System.debug('User created successfully: ' + response.getBody());
    } else {
        System.debug('Error creating user: ' + response.getBody());
        System.debug('Response Status Code: ' + response.getStatusCode());
System.debug('Response Status: ' + response.getStatus());
System.debug('Response Body: ' + response.getBody());
    }
}

}