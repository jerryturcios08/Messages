//
//  ViewController.swift
//  Messages
//
//  Created by Jerry Turcios on 4/22/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var chatMessages = [[ChatMessage]]()

    // MARK: Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
        groupMessages()
    }

    // MARK: Defined methods

    private func configureScreen() {
        navigationItem.title = "Messages"

        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: Cell.id)
        tableView.backgroundColor = .systemGray6
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }

    fileprivate func groupMessages() {
        var groupedMessages = Dictionary<Date, [ChatMessage]>()

        NetworkManager.fetchMessages { messages in
            groupedMessages = Dictionary(grouping: messages) { message -> Date in
                return message.date
            }
        }

        let sortedKeys = groupedMessages.keys.sorted()

        sortedKeys.forEach { key in
            let values  = groupedMessages[key]
            chatMessages.append(values ?? [])
        }
    }

    // MARK: Table view methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let firstMessageInSection = chatMessages[section].first else { fatalError() }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: firstMessageInSection.date)

        let label = DateHeaderLabel()
        label.text = dateString

        let containerView = UIView()
        containerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])

        return containerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id, for: indexPath) as? ChatMessageCell else { fatalError() }

        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage

        return cell
    }
}
