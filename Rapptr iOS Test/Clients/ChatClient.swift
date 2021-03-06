//
//  ChatClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 *
 */

class ChatClient {
    var session: URLSession?
    
    func fetchChatData(completion: @escaping ([Message]) -> Void, error errorHandler: @escaping (String?) -> Void) {
        guard let url = URL(string: constants.chatTableMessageUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, respond, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let parsedJSON = try jsonDecoder.decode(Messages.self, from: data)
                    let messages = parsedJSON.data
                    completion(messages)
                } catch {
                    print(error)
                    errorHandler(error.localizedDescription)
                }
            }
        }.resume()
    }
}
