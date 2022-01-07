//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
*/

class LoginClient {
//    var session: URLSession?
    
    func login(email: String, password: String, completion: @escaping (String) -> Void) {
        let postString = "email=\(email)&password=\(password)";
        let url = URL(string:"http://dev.rapptrlabs.com/Tests/scripts/login.php")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if error != nil {
                if let errorMessage = error?.localizedDescription {
                    completion(errorMessage)
                }
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    completion("Success")
                } else {
                    let errorMessage = httpResponse.description
                    completion(errorMessage)
                }
            }
        })
        task.resume()
    }
}
