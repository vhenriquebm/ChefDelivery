//
//  SearchStoreViewModel.swift
//  ChefDeliveryTests
//
//  Created by Vitor Henrique Barreiro Marinho on 28/11/24.
//

import XCTest
@testable import ChefDelivery

final class SearchStoreViewModelTests: XCTestCase {
    
    //MARK: - Attributes
    
    var sut: SearchStoreViewModel!
    
    //MARK: - Setup
    
    override func setUpWithError() throws {
        sut = SearchStoreViewModel(service: SearchService())
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - Unit tests
    
    func testFilteredStores() {
        sut.storesType = [ RestaurantSearch(id: 1,
                                            name: "Monstro Burger",
                                            location: "",
                                            stars: 4,
                                            specialties: []),
                           
                           RestaurantSearch(id: 2,
                                            name: "Temaki",
                                            location: "",
                                            stars: 4,
                                            specialties: []),
        
                           RestaurantSearch(id: 3,
                                            name: "Carbron",
                                            location: "",
                                            stars: 4,
                                            specialties: []),
        
        ]
        
        sut.searchText = "Ca"
        
        let filteredStores = sut.filteredStores()
        
        XCTAssertEqual(1, filteredStores.count)
        XCTAssertEqual("Carbron", filteredStores[0].name)
    }
    
    func testFilteredStoresWithSpecialCharactersInSearch() {
        sut.storesType = [ RestaurantSearch(id: 1,
                                            name: "Monstro Burger",
                                            location: "",
                                            stars: 4,
                                            specialties: []),
                           
                           RestaurantSearch(id: 2,
                                            name: "Temaki",
                                            location: "",
                                            stars: 4,
                                            specialties: []),
        
                           RestaurantSearch(id: 3,
                                            name: "Carbron",
                                            location: "",
                                            stars: 4,
                                            specialties: []),
        
        ]
        
        sut.searchText = "!@#"
        
        let filteredStores = sut.filteredStores()
        
        XCTAssertTrue(filteredStores.isEmpty)
        
    }
}
