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
    @IBOutlet weak var customRight: CustomButtonView!
    
    var tapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
        
        // Tap Left
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleTap))
        tapGesture.minimumPressDuration = 0
        customLeft.contentView.addGestureRecognizer(tapGesture)
        
        // Tap Right
        let tapGestureRight = UILongPressGestureRecognizer(target: self, action: #selector(handleTapRight))
        tapGestureRight.minimumPressDuration = 0
        customRight.contentView.addGestureRecognizer(tapGestureRight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Tap action
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        
        // handle touch down and touch up events separately
        if gesture.state == .began {
            customLeft.contentView.backgroundColor = UIColor(red: 0.6667, green: 0.8824, blue: 0.6667, alpha:1)
        } else if  gesture.state == .ended {
            customLeft.contentView.backgroundColor = UIColor.clear
            
            print("Left")
            customLeft.textView.text = "Eitcha lele, funcionou!"
        }
    }
    
    // Tap action Right
    @objc func handleTapRight(gesture: UITapGestureRecognizer) {
        
        // handle touch down and touch up events separately
        if gesture.state == .began {
            customRight.contentView.backgroundColor = UIColor(red: 0.6667, green: 0.8824, blue: 0.6667, alpha:1)
        } else if  gesture.state == .ended {
            customRight.contentView.backgroundColor = UIColor.clear
            
            print("Right")
            customLeft.textView.text = "Transferência eletrônica"
        }
    }
}


// MARK : Collection View
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
