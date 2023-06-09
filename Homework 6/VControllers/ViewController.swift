//
//  ViewController.swift
//  Homework 6
//
//  Created by Chinara on 5/30/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var basketButton: UIButton!
    @IBOutlet weak var deliveryLabelButton: UIStackView!
    
    @IBOutlet weak var optionButton: UIButton!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var routeButton: UIButton!
    
    
    @IBOutlet weak var priceButton: UIView!
    
    @IBOutlet weak var findTextField: UITextField!
    
    @IBOutlet weak var menu1View: UIView!
    
    @IBOutlet weak var cView: UICollectionView!
    
    @IBOutlet weak var menu3View: UIView!
    
    @IBOutlet weak var checkButton: UIButton!
    var menu: Menu = Menu()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 30.05)
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    var data: [Product] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        cornerRadius()
        updateFoodCollections()
        editing()
        
        ApiManager.shared.getRequest { result in
                    switch result {
                    case .success(let data):
                        DispatchQueue.main.async {
                            self.data = data.products
                            self.cView.reloadData()
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        
        
    }
    
private func cornerRadius() {
    basketButton.layer.cornerRadius = 15
    deliveryLabelButton.layer.cornerRadius = 10
    optionButton.layer.cornerRadius = 15
    menuButton.layer.cornerRadius = 15
    routeButton.layer.cornerRadius = 10
    priceButton.layer.cornerRadius = 10
    findTextField.layer.cornerRadius = 30
    menu3View.layer.cornerRadius = 30
    }
    
    private func updateFoodCollections() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 236)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 21
        layout.sectionInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        layout.scrollDirection = .horizontal
        cView.collectionViewLayout = layout
        cView.backgroundColor = .clear
        cView.showsHorizontalScrollIndicator = false
        cView.delegate = self
        cView.dataSource = self
        cView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
      
    private func editing (){
        deliveryLabelButton.layer.shadowColor = UIColor.black.cgColor
        deliveryLabelButton.layer.shadowOpacity = 0.5
        deliveryLabelButton.layer.shadowOffset = CGSize(width: 4, height: 1)
        deliveryLabelButton.layer.shadowRadius = 4
        
        optionButton.layer.shadowColor = UIColor.black.cgColor
        optionButton.layer.shadowOpacity = 0.5
        optionButton.layer.shadowOffset = CGSize(width: 4, height: 1)
        optionButton.layer.shadowRadius = 4
        
        menuButton.layer.shadowColor = UIColor.black.cgColor
        menuButton.layer.shadowOpacity = 0.5
        menuButton.layer.shadowOffset = CGSize(width: 4, height: 1)
        menuButton.layer.shadowRadius = 4
        
        routeButton.layer.shadowColor = UIColor.black.cgColor
        routeButton.layer.shadowOpacity = 0.5
        routeButton.layer.shadowOffset = CGSize(width: 4, height: 1)
        routeButton.layer.shadowRadius = 4
        
        priceButton.layer.shadowColor = UIColor.black.cgColor
        priceButton.layer.shadowOpacity = 0.5
        priceButton.layer.shadowOffset = CGSize(width: 4, height: 1)
        priceButton.layer.shadowRadius = 4
        
        
        menu3View.layer.shadowColor = UIColor.black.cgColor
        menu3View.layer.shadowOpacity = 2
        menu3View.layer.shadowOffset = CGSize(width: 6, height: 7)
        menu3View.layer.shadowRadius = 6
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.changeData(food: data[indexPath.row])
        return cell
    }
}

    
  
