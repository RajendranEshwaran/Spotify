//
//  HomeViewController.swift
//  Spotify
//
//  Created by gomathi saminathan on 5/10/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var homeGalleryScroll: UIScrollView!
   
   
    let imageWidth:CGFloat = 240
    var imageHeight:CGFloat = 176
    var scrolViewContentSize:CGFloat = 0
    var yPosition:CGFloat = 50
    let artistImgGallery = ["Adele.jpg","Alanis.jpg","Carrie.jpg","Crystal.jpg","harry.jpg","John Wayne.jpg","justin bieber.jpg","Katy Perry.jpg","Madona.jpg","Mandy.jpg","Marry.jpg","Michel Jackson.jpg","miley cyrus.jpg","obit.jpg","Paul.jpg","rajay.jpeg","rihanna.jpg","Selena Gomez.jpg","Singer14.jpg","Singer15.jpg","dua.jpg","singer17.jpg","Singer18.jpg","singer19.jpg","singer23.jpg","singer24.jpg","TaylorSwift.jpeg","usher raymond.jpg","ArianaGrande.jpg","ladyvgaga.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<artistImgGallery.count {
            
            let image:UIImage = UIImage (named: artistImgGallery[i])!
            let imageView:UIImageView = UIImageView()
            imageView.image = image
            imageView.frame.size.width = imageWidth
            imageView.frame.size.height = imageHeight
            imageView.frame.origin.x = 67
            imageView.frame.origin.y = yPosition
//            imageView.frame = CGRect(x: 10, y: yPosition, width: imageWidth, height: imageHeight)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.masksToBounds = true
            homeGalleryScroll.addSubview(imageView)
            yPosition += imageHeight
            yPosition += 30
            scrolViewContentSize += imageHeight
            homeGalleryScroll.contentSize = CGSize(width: imageWidth, height: scrolViewContentSize)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
