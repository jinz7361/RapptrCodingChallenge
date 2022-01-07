//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
//    @IBOutlet weak var header: UILabel!
//    @IBOutlet weak var body: UILabel!
    
    var message: Message? {
        didSet {
            if let message = message {
                self.usernameLabel.text = message.username
                self.messageLabel.text = message.text
            }
        }
    }
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0) /* #1b1e1f */
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0) /* #1b1e1f */
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var bubbleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        if #available(iOS 13.0, *) {
            view.layer.borderColor = CGColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0) /* #efefef */
        } else {
            // Fallback on earlier versions
            
        }
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    lazy var userAvatarImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = false
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        
        return iv
    }()
    
    // MARK: - Lifecycle
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0) /* #f9f9f9 */
        
        addSubview(userAvatarImage)
        userAvatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        userAvatarImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        userAvatarImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userAvatarImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(usernameLabel)
        usernameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: userAvatarImage.rightAnchor, constant: 7).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -36).isActive = true
        
        addSubview(bubbleView)
        bubbleView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4).isActive = true
        bubbleView.leftAnchor.constraint(equalTo: userAvatarImage.rightAnchor, constant: 7).isActive = true
        bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -36).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        bubbleView.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 8).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: -8).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
//    func setCellData(message: Message) {
//        usernameLabel.text = message.username
//        messageLabel.text = message.text
//    }
}
