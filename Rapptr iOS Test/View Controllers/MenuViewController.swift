//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - Rapptr Labs
     * =========================================================================================
     */
    
    // MARK: - Outlets
//    @IBOutlet weak var chatButton: UIButton!
//    @IBOutlet weak var loginButton: UIButton!
//    @IBOutlet weak var animationButton: UIButton!
    
    // MARK: - UI elements declaration
    lazy var homeBackgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "bg_home_menu")
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [chatButton, loginButton, animationButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = constants.menuStackSpace
        
        return sv
    }()
    
    lazy var chatButton: UIButton = {
        let button = menuButton(title: "CHAT", imageName: "ic_chat")
        button.addTarget(self, action: #selector(didPressChatButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = menuButton(title: "LOGIN", imageName: "ic_login")
        button.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var animationButton: UIButton = {
        let button = menuButton(title: "ANIMATION", imageName: "ic_animation")
        button.addTarget(self, action: #selector(didPressAnimationButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Coding Tasks"
        view.backgroundColor = constants.viewBackgorundColor
        
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = constants.menuBackgroundColor
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 17, weight: .semibold)]
            
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        } else {
            // Fallback on earlier versions
            view.backgroundColor = constants.menuBackgroundColor
        }
    }
    
    private func setupView() {
        view.addSubview(homeBackgroundImage)
        homeBackgroundImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        homeBackgroundImage.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        homeBackgroundImage.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        homeBackgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        view.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constants.menuStackSideSpace).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constants.menuStackSideSpace).isActive = true
    }
    
    // MARK: - Actions
    @objc func didPressChatButton(_ sender: Any) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }

    @objc func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }

    @objc func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
}
