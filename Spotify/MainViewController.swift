//
//  ViewController.swift
//  Spotify
//
//  Created by gomathi saminathan on 5/7/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var presentedVC:UIViewController? = nil
    
    @IBAction func goToNextViewController(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
        let presentedVC = self.storyboard!.instantiateViewController(withIdentifier: "PresentedViewController")
        presentedVC.view.backgroundColor = UIColor.white
        presentedVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(didTapCloseButton(_:)))
        let nvc = UINavigationController(rootViewController: presentedVC)
        present(nvc, animated: false, completion: nil)
    }
    
    @objc func didTapCloseButton(_ sender: Any) {
        if let presentedVC = presentedViewController {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = kCATransitionPush
            transition.subtype = kCATransitionFromLeft
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            presentedVC.view.window!.layer.add(transition, forKey: kCATransition)
        }
        
        dismiss(animated: false, completion: nil)
        
        presentedVC = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

