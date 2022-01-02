//
//  MyViewModelTests.swift
//  
//
//  Created by Apostolos Giokas on 02.01.22.
//

import XCTest
@testable import UnitTesting101

final class MyViewModelTests: XCTestCase {    
    func testListData() {
        let viewModel = MyViewModel(persons: samplePersons(), pets: samplePets())
        
        let expectedData: [MyViewModel.Data] = [
            .init(petName: "Max", owner: "Apo"),
            .init(petName: "Azor", owner: "Apo"),
            .init(petName: "Zizou", owner: "Melanie"),
        ]
        
        XCTAssertEqual(viewModel.listData(), expectedData)
    }
    
    private func samplePets() -> [Pet] {
        [
            Pet(id: "1", name: "Max", ownerId: "1"),
            Pet(id: "2", name: "Azor", ownerId: "1"),
            Pet(id: "3", name: "Monty", ownerId: "2"),
            Pet(id: "4", name: "Zizou", ownerId: "3"),
        ]
    }
    
    private func samplePersons() -> [Person] {
        [
            Person(id: "1", firstName: "Apo", lastName: ""),
            Person(id: "3", firstName: "Melanie", lastName: ""),
            Person(id: "4", firstName: "Mustermann", lastName: ""),
        ]
    }
}
