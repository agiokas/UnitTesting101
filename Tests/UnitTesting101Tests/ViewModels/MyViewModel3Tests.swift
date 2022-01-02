//
//  MyViewModelTests.swift
//
//
//  Created by Apostolos Giokas on 02.01.22.
//

import XCTest
@testable import UnitTesting101

final class MyViewModel3Tests: XCTestCase {
    func testListData() throws {
        guard let userDefaults = UserDefaults(suiteName: "MyViewModel3Tests") else {
            XCTFail("User defaults needed")
            return
        }
        
        let encodedPets = try PropertyListEncoder().encode(samplePets())
        let encodedPersons = try PropertyListEncoder().encode(samplePersons())
        
        userDefaults.set(encodedPets, forKey: "Pets")
        userDefaults.set(encodedPersons, forKey: "Persons")
        userDefaults.synchronize()
        
        let viewModel = MyViewModel3(datasource: userDefaults)
        
        let expectedData: [MyViewModel.Data] = [
            .init(petName: "Max", owner: "Apo"),
            .init(petName: "Azor", owner: "Apo"),
            .init(petName: "Zizou", owner: "Melanie"),
        ]
        
        XCTAssertEqual(viewModel.listData(), expectedData)
    }
}

final class MyViewModel3_v2Tests: XCTestCase {
    func testListData() throws {
        let userDefaults = UserDataStoreInterfaceMock()
        let encodedPets = try PropertyListEncoder().encode(samplePets())
        let encodedPersons = try PropertyListEncoder().encode(samplePersons())
        
        userDefaults.dataVerify = { key in
            if key == "Persons" {
                return encodedPersons
            }
            if key == "Pets" {
                return encodedPets
            }
            return nil
        }
                
        let viewModel = MyViewModel3(datasource: userDefaults)
        
        let expectedData: [MyViewModel.Data] = [
            .init(petName: "Max", owner: "Apo"),
            .init(petName: "Azor", owner: "Apo"),
            .init(petName: "Zizou", owner: "Melanie"),
        ]
        
        XCTAssertEqual(viewModel.listData(), expectedData)
    }
}

final class UserDataStoreInterfaceMock: UserDataStoreInterface {
    var dataVerify: (String) -> Data? = { _ in nil }
    
    func data(forKey defaultName: String) -> Data? {
        dataVerify(defaultName)
    }
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

