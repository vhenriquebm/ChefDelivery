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
        var filteredStores: [RestaurantSearch] = []
        
        do {
            filteredStores = try sut.filteredStores()
            XCTAssertEqual(1, filteredStores.count)
            XCTAssertEqual("Carbron", filteredStores[0].name)
        } catch {
            XCTFail("Failed to search stores")
            print(error)
        }
        
        
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
        
        var filteredStores: [RestaurantSearch] = []
        
        do {
            filteredStores = try sut.filteredStores()
            XCTFail("Failed to search")
        } catch {
            XCTAssertTrue(filteredStores.isEmpty)
            
        }
    }
    
    func testfilteredStoresUsingTerms() {
        sut.storesType = [ RestaurantSearch(id: 1,
                                            name: "Monstro Burger",
                                            location: "",
                                            stars: 4,
                                            specialties: [
                                                "pizza",
                                                "lanchonete"
                                            ]),
                           
                           RestaurantSearch(id: 2,
                                            name: "Temaki",
                                            location: "",
                                            stars: 4,
                                            specialties: [
                                                "sushi",
                                                "Japonês"
                                            ]),
                           
                           RestaurantSearch(id: 3,
                                            name: "Carbron",
                                            location: "",
                                            stars: 4,
                                            specialties: [
                                                "tacos",
                                                "mexicana"
                                            ]),
                           
        ]
        
        sut.searchText = "pizza"
        
        var filteredStores: [RestaurantSearch] = []
        
        do {
            filteredStores = try sut.filteredStores()
            XCTAssertEqual("Monstro Burger", filteredStores[0].name)
        } catch {
            XCTFail("Failed to search")
        }
    }
    
    func testFilteredStoresException() {
        sut.storesType = [ RestaurantSearch(id: 1,
                                            name: "Monstro Burger",
                                            location: "",
                                            stars: 4,
                                            specialties: [
                                                "pizza",
                                                "lanchonete"
                                            ]),
                           
                           RestaurantSearch(id: 2,
                                            name: "Temaki",
                                            location: "",
                                            stars: 4,
                                            specialties: [
                                                "sushi",
                                                "Japonês"
                                            ]),
                           
                           RestaurantSearch(id: 3,
                                            name: "Carbron",
                                            location: "",
                                            stars: 4,
                                            specialties: [
                                                "tacos",
                                                "mexicana"
                                            ]),
                           
        ]
        
        sut.searchText = "xxZZz"
        
        XCTAssertThrowsError(try sut.filteredStores())
    }
}
