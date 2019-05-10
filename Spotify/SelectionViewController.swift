//
//  SelectionViewController.swift
//  Spotify
//
//  Created by gomathi saminathan on 5/9/19.
//  Copyright © 2019 Rajendran Eshwaran. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var artistGallery: UICollectionView!
    
    var selectedCell = [IndexPath]()
    
    let artistCollectionArray:[String] = ["Adele","Alanis","Carrie","Crystal","Harry","Wayne","Justin Biebar","Katy","Madona","Mandy","Marry","Michel Jackson","Miley Cyrus","Obit","Paul","Rajay","Rihana","Selena Gom","Singer14","Singer15","Dua","Singer17","Singer18","Singer19","Singer23","Singer24","Taylor Swift","Usher Ray","Ariana G","Lady Gaga"]
    
    let artistImgGallery:[String] = ["Adele.jpg","Alanis.jpg","Carrie.jpg","Crystal.jpg","harry.jpg","John Wayne.jpg","justin bieber.jpg","Katy Perry.jpg","Madona.jpg","Mandy.jpg","Marry.jpg","Michel Jackson.jpg","miley cyrus.jpg","obit.jpg","Paul.jpg","rajay.jpeg","rihanna.jpg","Selena Gomez.jpg","Singer14.jpg","Singer15.jpg","dua.jpg","singer17.jpg","Singer18.jpg","singer19.jpg","singer23.jpg","singer24.jpg","TaylorSwift.jpeg","usher raymond.jpg","ArianaGrande.jpg","ladyvgaga.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goBtn.layer.cornerRadius = 20
        goBtn.isHidden = true
        artistGallery.delegate = self
        artistGallery.allowsMultipleSelection = true
        artistGallery.allowsSelection = true
        
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
        cell.artistImgThumb.image = UIImage (named: artistImgGallery[indexPath.row])
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        
        let cell = collectionView.cellForItem(at: indexPath) as! SelectionViewCell
        selectedCell.append(indexPath)
        cell.artistSelectImg.isHidden = false
        
        if selectedCell.count >= 3{
            goBtn.isHidden = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {


        let cell = collectionView.cellForItem(at: indexPath)as! SelectionViewCell
        
        if selectedCell.contains(indexPath) {
            selectedCell.remove(at: selectedCell.index(of: indexPath)!)
            cell.artistSelectImg.isHidden = true
        }
        
        if selectedCell.count < 3{
            goBtn.isHidden = true
        }
    }

    @IBAction func goFunc(_ sender: Any) {
        
        
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
