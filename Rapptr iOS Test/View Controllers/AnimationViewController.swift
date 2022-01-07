//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    
    lazy var fadeImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "ic_logo")
        iv.isUserInteractionEnabled = true
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(didDragImage(recognizer:)))
        iv.addGestureRecognizer(pan)
        
        return iv
    }()
    
    lazy var fadeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = constants.menuBackgroundColor
        button.setTitle("FADE OUT", for: .normal)
        button.addTarget(self, action: #selector(didPressFade), for: .touchUpInside)
        button.titleLabel?.font = constants.fadeButtonFont
        button.titleLabel?.tintColor = .white
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = constants.animationViewTitle
//        self.navigationController?.navigationBar.backgroundColor = constants.menuBackgroundColor
//        view.backgroundColor = .white
        
        self.setupView()
    }
    
    private func setupView() {
        view.addSubview(fadeImage)
        fadeImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        fadeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(fadeButton)
        fadeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constants.fadeButtonBottomSpace).isActive = true
        fadeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constants.fadeButtonSideSpace).isActive = true
        fadeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -constants.fadeButtonSideSpace).isActive = true
        fadeButton.heightAnchor.constraint(equalToConstant: constants.menuButtonHeight).isActive = true
    }
    
    @objc func didPressFade() {
        if self.fadeButton.titleLabel?.text == "FADE OUT" {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.fadeImage.alpha = 0
            }, completion: { (finished: Bool) -> Void in
                self.fadeButton.setTitle("FADE IN", for: .normal)
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.fadeImage.alpha = 1
            }, completion: { (finished: Bool) -> Void in
                self.fadeButton.setTitle("FADE OUT", for: .normal)
            })
        }
    }
    
    @objc func didDragImage(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    // MARK: - Actions
//    @IBAction func backAction(_ sender: Any) {
//        let mainMenuViewController = MenuViewController()
//        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
//    }
    
//    @IBAction func didPressFade(_ sender: Any) {
//    }
}
