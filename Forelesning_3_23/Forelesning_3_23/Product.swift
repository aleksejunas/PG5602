//
//  Product.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import Foundation


struct Product: Identifiable, Codable {
    
    let id: UUID = UUID()
    
    let name: String
    let description: String
    let price: Int
    
    let images: [ProductImage]
    
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "Description"
        case price
        case images = "product_images"
    }
}




extension Product {
    static var sampleJSON: String {
        """
        
        {
            "name": "Bukse",
            "description": "Grå, str 32",
            "price": 500,
            "product_images": [

                {
                    "url": "https://google.com",
                    "description": "Buksa i grønn versjon"
                }
            ]
        }
        """
    }
}


extension Product {
    
    static let demoProducts = [
        Product.init(name: "Bukse", description: "Grå, str 32", price: 500, images: []),
        Product.init(name: "T-skjorte", description: "hvit, medium. Laget av egyptisk bomull", price: 800, images: [] )
        
    ]
    
    static func testReturnProducts() -> [Product] {
        return [
            Product.init(name: "Genser", description: "Brun med mønster på magen, str 34", price: 890, images: []),
            Product.init(name: "Olabukse", description: "str 34/34", price: 1230, images: [])
        ]
    }
    
}

//func aMethod() {
//
//    Product.testReturnProducts()
//
//}
