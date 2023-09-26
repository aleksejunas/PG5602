//
//  Forelesning_3_23Tests.swift
//  Forelesning_3_23Tests
//
//  Created by Håkon Bogen on 04/09/2023.
//

import XCTest
@testable import Forelesning_3_23

final class Forelesning_3_23Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidProductFromJSON(){
        let json = Product.sampleJSON
        let decoder = JSONDecoder()
        do {
            let product =  try   decoder.decode(Product.self, from: json.data(using: .utf8)!)
            
            XCTAssertEqual(product.name, "Bukse")
            XCTAssertEqual(product.description, "Grå, str 32")
            XCTAssertEqual(product.price, 500)
            XCTAssertEqual(product.images.count,  1)
            let productImage = product.images.first
            XCTAssertEqual(productImage?.url, "https://google.com")
            XCTAssertEqual(productImage?.description, "Buksa i grønn versjon")
            
        } catch let error {
            XCTFail(error.localizedDescription)
        }
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testInvalidJSON() {
        let json = """
        
    {
        "name": "Bukse",
        "desc": "Grå, str 32"
    }
    """
     
        let decoder = JSONDecoder()
        do {
            let product = try decoder.decode(Product.self, from:
                                            json.data(using: .utf8)!)
            XCTFail("Should not make a product without price!")
        } catch let error {
            
        }
    }
    
    func testAnotherProductFromJSON() throws {
        let json = """
        
            {
                "name": "Genser",
                "description": "Grå, str 231",
                "price": 421
                "product_images" : [{
                    "url": "google.com",
                    "description": "fin genser" 
                }]
            }
        """
        
        let _ = try JSONDecoder().decode(Product.self, from: json.data(using: .utf8)!)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
