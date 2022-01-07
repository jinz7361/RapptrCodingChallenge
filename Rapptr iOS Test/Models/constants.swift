//
//  constants.swift
//  Rapptr iOS Test
//
//  Created by Jin on 12/16/21.
//

import UIKit

struct constants {
    // MARK: - menuButton Constants
    static let menuButtonBackgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.8) /* #f9f9f9 */
    static let menuButtonTextColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0) /* #1B1E1F */
    static let menuButtonTextFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let menuButtonCornerRadius = 8.0
    static let menuButtonHeight = 55.0
    
    // MARK: - MenuViewController Constants
    static let menuStackSpace = 24.0
    static let menuStackSideSpace = 30.0
    static let menuBackgroundColor = UIColor(red: 14/255, green: 92/255, blue: 137/255, alpha: 1.0) /* #0E5C89 */
    static let viewBackgorundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0) /* #f9f9f9 */
    
    // MARK: - ChatViewController Constants
    static let chatViewTitle = "Chat"
    static let chatTableCellID = "ChatTableViewCell"
    static let chatTableRowHeight = 44.0
    static let chatTableMessageUrl = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
    
    // MARK: - LoginViewController Constants
    static let loginViewTitle = "Login"
    static let loginStackTopSpace = 64.0
    static let loginStackSideSpace = 30.0
    
    static let inputFieldBackgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.5) /* #f9f9f9 */
    static let inputFieldPlaceholderColor = UIColor(red: 95/255, green: 96/255, blue: 99/255, alpha: 1.0) /* #5f6063 */
    static let inputFieldTextColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0) /* #1b1e1f */
    static let inputSideViewWidth = 24
    
    // MARK: - AnimationViewController Constants
    static let animationViewTitle = "Animation"
    static let fadeButtonBottomSpace = 50.0
    static let fadeButtonSideSpace = 30.0
    static let fadeButtonFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
}

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWithUrlString(_ urlString: String) {
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            //download hit an error so lets return out
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                }
            })
        }).resume()
    }
    
}
