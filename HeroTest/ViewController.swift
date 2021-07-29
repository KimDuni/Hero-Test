//
//  ViewController.swift
//  HeroTest
//
//  Created by 성준 on 2021/07/29.
//

import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var grayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.hero.id = "redView"
        grayView.hero.id = "grayView"
    }
    
    @IBAction func nextView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let target = storyboard.instantiateViewController(withIdentifier: "SViewController")
        target.hero.isEnabled = true
        target.hero.modalAnimationType = .selectBy(presenting: .fade, dismissing: .fade)
        present(target, animated: true, completion: nil)
    }
}





// MARK: - SecondViewController
class SViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.hero.modifiers = [.fade , . scale(0.5)]
        return cell
    }
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.hero.id = "redView"
        grayView.hero.id = "grayView"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: collectionView.frame.width / 3 - 5, height: collectionView.frame.width / 3 - 5)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        collectionView.hero.modifiers = [.cascade]
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
