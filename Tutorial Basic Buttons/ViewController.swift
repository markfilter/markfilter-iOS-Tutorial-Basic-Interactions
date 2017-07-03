/*
 Copyright (c) 2017 Mark Z Filter
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell coppies of the software and to permit persons to whome the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
//
//  ViewController.swift
//  Tutorial Basic Buttons
//
//  Created by Mark Filter on 7/2/17.
//  Copyright © 2017 Mark Filter. All rights reserved.
//



import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets & Properties
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var outputTextView: UITextView!
    var messages: [String] = []
    
    
    // MARK: - View Life Cycle Callbacks
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Clear TextView before shown to user
        outputTextView.text = ""
    }
    
    
    // MARK: - Actions
    
    // handles "Add Message" button press
    @IBAction func addTextTapped(_ sender: UIButton) {
        
        // Validate User Input
        if validateTextField() {
            addText()
        }
        else {
            // Alert the user of error
            let alert = UIAlertController(title: "Please Type a Message", message: "You cannot leave the field blank", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
        
    }
    
    // Add Text
    func addText() {
        // Add Text to messages Array
        messages.append(inputTextField.text!)
        
        // Clear Contents of TextView (Prevents Duplicates)
        outputTextView.text = ""
        
        
        // Reload Values in OutputTextView
        for message in messages {
            outputTextView.text! += message + "\n"
        }
        
        // Clear inputTextField
        inputTextField.text! = ""
    }
    
    
    // Validate TextField
    func validateTextField() -> Bool {
        if (inputTextField.text?.isEmpty)! {
            return false
        }
        else {
            return true
        }
    }
    
    
    
    
    // MARK: - TextField & Keyboard Callbacks
    
    // Handles "Done" Button Press from Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // NOTE: - set delegate
        
        if validateTextField() {
            self.view.endEditing(true)
            addText()
            return true
        }
        return false
    }
    
    // MARK: - Dismiss Keyboard on Tap
    
    // Handles event when user taps on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    


}

