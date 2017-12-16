//
//  ViewController.swift
//  TextField
//
//  Created by dinesh danda on 02/09/16.
//  Copyright © 2016 dinesh danda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    // ui obj
    @IBOutlet weak var writeTextView: UITextView!
    @IBOutlet weak var readTextView: UITextView!
    

    // first load func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TextView Programmatically
        let coolTextView = UITextView()
        coolTextView.frame.origin.x = 16
        coolTextView.frame.origin.y = 280
        coolTextView.frame.size.width = 343
        coolTextView.frame.size.height = 75
        coolTextView.delegate = self
            
        coolTextView.text = "TextView Programmatically"
        coolTextView.font = UIFont.boldSystemFont(ofSize: 17)
        coolTextView.textColor = .red
        coolTextView.textAlignment = NSTextAlignment.left
        
        coolTextView.isEditable = true
        coolTextView.isSelectable = true
        coolTextView.allowsEditingTextAttributes = true
        coolTextView.clearsOnInsertion = false
        
        coolTextView.dataDetectorTypes = [.address, .link, .calendarEvent, .phoneNumber]
        coolTextView.backgroundColor = .yellow
        coolTextView.returnKeyType = UIReturnKeyType.done
        
        self.view.addSubview(coolTextView)
        
    }
    
    
    // called when Send button is pressed
    @IBAction func send_clicked(_ sender: AnyObject) {
        
        readTextView.text = writeTextView.text
        
        writeTextView.text = ""
        
    }
    

    // first called -> about to edit TextView
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        readTextView.text = "Should Begin"
        return true
    }
    
    // first called -> about to end editing TextView
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        readTextView.text = "Should End"
        return true
    }
    
    // second called -> did start editing TextView
    func textViewDidBeginEditing(_ textView: UITextView) {
        readTextView.text = "Did Begin"
    }
    
    // second called -> did end editing TextView
    func textViewDidEndEditing(_ textView: UITextView) {
        readTextView.text = "Did End"
    }
    
    // first called -> we are editing text TextView
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        readTextView.text = readTextView.text + " 1"
        return true
    }
    
    // seccond called -> did change some chars in TextView
    func textViewDidChange(_ textView: UITextView) {
        readTextView.text = readTextView.text + " 2"
    }

    
}
