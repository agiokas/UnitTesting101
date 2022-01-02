//
//  File.swift
//  
//
//  Created by Apostolos Giokas on 02.01.22.
//

import Foundation

protocol UserDataStoreInterface {
    func data(forKey defaultName: String) -> Data?
}

extension UserDefaults: UserDataStoreInterface {}

final class MyViewModel3 {
    private let datasource: UserDataStoreInterface

    init(datasource: UserDataStoreInterface) {
        self.datasource = datasource
    }

    func listData() -> [MyViewModel.Data] {
            pets()
            .compactMap { pet in
                guard let owner = persons()
                    .first(where: { $0.id == pet.ownerId }) else {
                    return nil
                }
                return MyViewModel.Data(petName: pet.name, owner: owner.firstName)
            }
    }
    
    private func pets() -> [Pet] {
        guard let data = datasource.data(forKey: "Pets"),
              let petsData = try? PropertyListDecoder().decode([Pet].self, from: data) else {
            return []
        }
        return petsData
    }
    
    private func persons() -> [Person] {
        guard let data = datasource.data(forKey: "Persons"),
              let personsData = try? PropertyListDecoder().decode([Person].self, from: data) else {
            return []
        }
        return personsData
    }
}
