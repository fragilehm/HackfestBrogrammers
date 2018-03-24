//
//  StartingPageViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class StartingPageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var imageName = ["need", "want", "addHelp"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    func configureCollectionView() {
        self.collectionView.isPagingEnabled = true
        collectionView.register(UINib.init(nibName: "StartingPageCollectionViewCell", bundle: nil) , forCellWithReuseIdentifier: "StartingPageCollectionViewCell")
        collectionView.bounces = false
    }
    @IBAction func skipPresed(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginNav")
        self.present(loginVC, animated: true, completion: nil)
    }
}
extension StartingPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StartingPageCollectionViewCell", for: indexPath) as! StartingPageCollectionViewCell
        cell.startingImageView.image = UIImage(named: imageName[indexPath.row])
        cell.startingTitle.text = Constants.StartingPage.StartingTitle[indexPath.row]
        cell.startingDescription.text = Constants.StartingPage.StartingDescription[indexPath.row]
        return cell
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let x = targetContentOffset.pointee.x
            pageControl.currentPage = Int(x / self.view.frame.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width, height: self.collectionView.bounds.height)
    }
}
