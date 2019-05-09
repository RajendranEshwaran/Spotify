//
//  CreateAccountViewController.swift
//  Spotify
//
//  Created by gomathi saminathan on 5/9/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var dobView: UIView!
    @IBOutlet weak var pwdView: UIView!
    @IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var genderTxt: UITextView!
    @IBOutlet weak var pwdTxt: UITextView!
    @IBOutlet weak var dobTxt: UITextView!
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    var email:String?
    var dob:String?
    var pwd:String?
    var gender:String?
    var currentIndex:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 20
        nextBtn.clipsToBounds = true
        nextBtn.isHighlighted = true
        
        emailTxt.delegate = self
        
        currentIndex = 1
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextAccCreate(_ sender: Any) {
        
        if !(emailTxt.text?.isEmpty)!{
            currentIndex = currentIndex! + 1
            //animateViewOut(index: currentIndex!)
                        
            let presentedVC = self.storyboard!.instantiateViewController(withIdentifier: "SelectionViewController")
            present(presentedVC, animated: false, completion: nil)
        }
        
    }
    //MARK:- Animate the views from IN to OUT
    
    func animateViewOut(index:Int)
    {
        UIView.animate(withDuration: 0.5, animations: {
            self.emailView.frame.origin.x -= 400
        }, completion: nil)
        
    }
    
    // MARK:- Animate the views from OUT to IN
    func animateViewIn(index:Int)
    {
        UIView.animate(withDuration: 1, animations: {
            self.emailView.frame.origin.x += 400
        }, completion: nil)
        
    }
    
    // MARK:-  validate an email for the right format
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    // MARK:- Verificating the text value with email notation
    
    @IBAction func textFieldWhileEditing(_ sender: Any) {
        if isValidEmail(email: emailTxt.text) == true
        {
            nextBtn.isHighlighted = false
        }else{
            nextBtn.isHighlighted = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.resignFirstResponder()
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        emailTxt.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
