//
//  NetworkManager.swift
//  Messages
//
//  Created by Jerry Turcios on 4/23/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import Foundation

struct NetworkManager {
    static func fetchMessages(completion: @escaping ([ChatMessage]) -> Void) {
        // Pretend an API call was made
        let messagesFromServer = [
            ChatMessage(
                text: "Here is my very first message",
                isIncoming: true,
                date: Date.dateFromCustomString("08/03/2018")
            ),
            ChatMessage(
                text: "I am going to message another long message that will word wrap.",
                isIncoming: true,
                date: Date.dateFromCustomString("08/03/2018")
            ),
            ChatMessage(
                text: "I am going to message another long message that will word wrap. I am going to message another long message that will word wrap. I am going to message another long message that will word wrap.",
                isIncoming: false,
                date: Date.dateFromCustomString("09/15/2018")
            ),
            ChatMessage(
                text: "Wassup dawg",
                isIncoming: false,
                date: Date.dateFromCustomString("09/15/2018")
            ),
            ChatMessage(
                text: "This message should appear on the left with a white background bubble",
                isIncoming: true,
                date: Date.dateFromCustomString("09/15/2018")
            ),
            ChatMessage(
                text: "Third section message",
                isIncoming: true,
                date: Date.dateFromCustomString("10/31/2018")
            )
        ]

        completion(messagesFromServer)
    }
}
