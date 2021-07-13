//
//  ViewController.swift
//  Chapter16SimpleCollectionViewApp
//
//  Created by Sam WU on 2021-07-12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    var cellColor = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        collectionVIew.dataSource = self
//        collectionVIew.delegate = self
        
    }

}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath)
        
        if cellColor {
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.green
        }
        
        cellColor = !cellColor
        
        return cell
    }
    
}
