//
//  ProductModel.swift
//  Homework 6
//
//  Created by Chinara on 6/8/23.
//

import Foundation
import UIKit


struct Products {
    
    var name: String
    var image: UIImage
}


class Menu {
    var products = [Products]()
    init(){
        setup()
        
        
    }
    func setup(){
        let p1 = Products(name: "Tony Romas", image: UIImage(named: "image1")!)
        let p2 = Products(name: "Tony Romas", image: UIImage(named: "image2")!)
        self.products = [p1, p2]
    }
}
