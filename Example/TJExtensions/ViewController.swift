//
//  ViewController.swift
//  TJExtensions
//
//  Created by Yutaka Tajika on 12/20/2015.
//  Copyright (c) 2015 Yutaka Tajika. All rights reserved.
//

import UIKit
import TJExtensions

class ViewController: UIViewController {

    @IBOutlet weak var borderedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ビューの背景色を指定
        borderedView.backgroundColor = UIColor(hex: 0x859495, alpha: 1.0)
    }
    
    override func viewDidLayoutSubviews() {
        // 線の色をUIColorのExtensionで指定
        let borderColor = UIColor(intRed: 255, green: 30, blue: 20, alpha: 1.0)
        
        // TopとRightに線をつける
        borderedView.border([.Top, .Right], borderWidth: 3.5, borderColor: borderColor)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }


}

