//
//  SelectionViewController.swift
//  Spotify
//
//  Created by gomathi saminathan on 5/9/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    let artistCollectionArray:[String] = ["Adele","Alanis","Carrie","Crystal","Harry","Wayne","Justin Biebar","Katy","Madona","Mandy","Marry","Michel Jackson","Miley Cyrus","Obit","Paul","Rajay","Rihana","Selena Gom","Singer14","Singer15","Singer16","Singer17","Singer18","Singer19","Singer23","Singer24","Taylor Swift","Usher Ray","Ariana G","Lady Gaga"]
    
    let artistImgGallery:[String] = ["Adele.jpg","Alanis.jpg","Carrie.jpg","Crystal.jpg","harry.jpg","John Wayne.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return  artistCollectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectionCell", for: indexPath ) as! SelectionViewCell
        cell.artistNameLbl.text = artistCollectionArray[indexPath.row]
        return cell
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
