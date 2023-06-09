//
//  CollectionViewCell.swift
//  Homework 6
//
//  Created by Chinara on 6/8/23.
//

import UIKit
import SnapKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    private let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()
        
    private var image: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image1")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private var productNameLabel: UILabel = {
        let view = UILabel()
        view.text = "Tony Roma’s"
        view.numberOfLines = 0
        view.font = UIFont(name: "Poppins-Bold", size: 12)
        return view
    }()

    private var typeLabel: UILabel = {
        let view = UILabel()
        view.text = "Ribs & Steaks"
        view.numberOfLines = 0
        view.font = UIFont(name: "Poppins-Light", size: 8)
        return view
    }()
    
    private var optionLabel: UILabel = {
        let view = UILabel()
        view.text = "Delivery: FREE • Minimum: $20"
        view.font = UIFont(name: "Poppins-Light", size: 8)
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bgView)
        
        bgView.addSubview(image)
        
        bgView.addSubview(productNameLabel)
        
        bgView.addSubview(typeLabel)
        
        bgView.addSubview(optionLabel)
        
        constraint()
        
    }

    private func constraint() {

    bgView.snp.makeConstraints { make in
        make.leading.trailing.bottom.equalToSuperview()
        make.height.equalTo(180)
        
    }
    
    image.snp.makeConstraints { make in
        make.height.width.equalTo(150)
        make.top.equalToSuperview().offset(-55)
        make.centerX.equalToSuperview()
        layer.cornerRadius = frame.height/2
    }

    productNameLabel.snp.makeConstraints { make in
        make.top.equalTo(image.snp.bottom).offset(-5)
        make.leading.trailing.equalToSuperview().inset(17)
    }

    typeLabel.snp.makeConstraints { make in
        make.top.equalTo(productNameLabel.snp.bottom)
        make.leading.trailing.equalToSuperview().inset(17)
        }
    optionLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom)
            make.leading.equalToSuperview().offset(17)
        }
        
    }
        
    func changeData(food: Product) {
        image.kf.setImage(with: URL(string: food.thumbnail!))
        productNameLabel.text = food.title
        typeLabel.text = food.brand
        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

