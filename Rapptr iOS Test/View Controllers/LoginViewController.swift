//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    private var client: LoginClient?
    
    lazy var loginViewBackgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "img_login")
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emailInputTextField, passwordInputTextField, loginButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = constants.menuStackSpace
        
        return sv
    }()
    
    lazy var emailInputTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = constants.inputFieldBackgroundColor
        tf.heightAnchor.constraint(equalToConstant: constants.menuButtonHeight).isActive = true
        
        tf.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: constants.inputFieldPlaceholderColor]
        )
        tf.textColor = constants.inputFieldTextColor
        
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: constants.inputSideViewWidth, height: Int(tf.frame.height)))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: constants.inputSideViewWidth, height: Int(tf.frame.height)))
        tf.rightViewMode = .always
        tf.layer.cornerRadius = 4
        tf.autocapitalizationType = .none
        
        return tf
    }()
    
    lazy var passwordInputTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = constants.inputFieldBackgroundColor
        tf.heightAnchor.constraint(equalToConstant: constants.menuButtonHeight).isActive = true
        
        tf.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: constants.inputFieldPlaceholderColor]
        )
        tf.textColor = constants.inputFieldTextColor
        
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: constants.inputSideViewWidth, height: Int(tf.frame.height)))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: constants.inputSideViewWidth, height: Int(tf.frame.height)))
        tf.rightViewMode = .always
        tf.layer.cornerRadius = 4
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = constants.menuButtonTextFont
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = constants.menuBackgroundColor
        button.heightAnchor.constraint(equalToConstant: constants.menuButtonHeight).isActive = true
        button.addTarget(self, action: #selector(didPressLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = constants.loginViewTitle
        view.backgroundColor = constants.viewBackgorundColor
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        view.addSubview(loginViewBackgroundImage)
        loginViewBackgroundImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        loginViewBackgroundImage.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        loginViewBackgroundImage.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        loginViewBackgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: constants.loginStackTopSpace).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constants.loginStackSideSpace).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constants.loginStackSideSpace).isActive = true
    }
    
    @objc func didPressLoginButton() {
        if let email = emailInputTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), let password = passwordInputTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            self.client = LoginClient()
            
            let startTime = DispatchTime.now()
            self.client!.login(email: email, password: password, completion: { response in
                if response == "Success" {
                    let endTime = DispatchTime.now()
                    let apiCallTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1000000
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Login Success!", message: "Your login took \(apiCallTime) milliseconds.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                            self.navigationController?.popViewController(animated: true)
                        }))
                        
                        self.present(alert, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Login Error", message: response, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { _ in
                            self.emailInputTextField.text = ""
                            self.passwordInputTextField.text = ""
                        }))
                        
                        self.present(alert, animated: true)
                    }
                }
            })
        }
    }
    
    // MARK: - Actions
//    @IBAction func backAction(_ sender: Any) {
//        let mainMenuViewController = MenuViewController()
//        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
//    }
//
//    @IBAction func didPressLoginButton(_ sender: Any) {
//    }
}
