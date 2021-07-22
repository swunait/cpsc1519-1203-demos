//
//  FontSelectViewController.swift
//  CustomFontsManagerApp
//
//  Created by Sam WU on 2021-07-21.
//

import UIKit

class FontSelectViewController: UIViewController {
    
    let dataManager = CustomFontDataManager.sharedDataManger
    var selectedFontName: String?
    
    @IBOutlet weak var fontCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontCollectionView.dataSource = self
        fontCollectionView.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FontSelectViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CustomFontDataManager.fontFamilyNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fontCell", for: indexPath) as! FontSelectCollectionViewCell
        
        let currentFontName = CustomFontDataManager.fontFamilyNames[indexPath.item]
        cell.fontNameLabel.text = currentFontName
        cell.fontNameLabel.font = UIFont(name: currentFontName, size: CGFloat(16))
        
        return cell
    }
    
    
}

extension FontSelectViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedFontName = CustomFontDataManager.fontFamilyNames[indexPath.item]
        
        self.performSegue(withIdentifier: "manualSelectFontSegue", sender: self)
    }
}
