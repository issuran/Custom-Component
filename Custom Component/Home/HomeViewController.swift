//
//  HomeViewController.swift
//  Custom Component
//
//  Created by Tiago Oliveira on 30/06/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let MyCollectionViewCellId: String = "MyCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var customLeft: CustomButtonView!
    @IBOutlet var tap: UITapGestureRecognizer!
    
    @IBAction func printOi(_ sender: Any) {
        print("Oi")
        
    }
    
    var tapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
        // Do any additional setup after loading the view.
        
        customLeft.textView.text = "Comprar um bombom"
        
        // Tap
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        customLeft.addGestureRecognizer(tapGesture)
    }
    
    // Tap action
    @objc func handleTap() {
        
        if tapped {
            customLeft.contentView.backgroundColor = UIColor.clear
            customLeft.textView.text = "Comprar um bombom"
        } else {
            
            customLeft.textView.text = "Tap recognized"
            customLeft.contentView.backgroundColor = UIColor.lightGray
        }
        tapped = !tapped
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 10
        return UIEdgeInsetsMake(CGFloat(inset), CGFloat(inset), CGFloat(inset), CGFloat(inset))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! CustomCollectionViewCell
        
        
        return cell
    }
}
