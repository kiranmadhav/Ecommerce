//
//  ViewController.swift
//  Ecommerce
//
//  Created by Pragati on 04/04/17.
//  Copyright © 2017 Technosoftcorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    weak var activeField: UITextField?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func loginTap(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        
        let searchViewController = storyBoard.instantiateViewController(withIdentifier: "SearchViewController");
        
        self.navigationController?.pushViewController(searchViewController, animated: true)
        
//        storyBoard.instantiateInitialViewController(withIdentifier: "SearchViewController")
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.activeField?.resignFirstResponder()
        self.activeField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: .UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func keyboardDidShow(notification: NSNotification) {
         let activeField = self.activeField
        
        if activeField != nil {
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: (keyboardSize?.height)!, right: 0.0)
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= (keyboardSize?.size.height)!
            if (!aRect.contains((activeField?.frame.origin)!)) {
                self.scrollView.scrollRectToVisible((activeField?.frame)!, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
}

