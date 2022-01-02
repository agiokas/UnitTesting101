//
//  MyViewModel.swift
//  
//
//  Created by Apostolos Giokas on 02.01.22.
//

import Foundation

final class MyViewModel {
    private let persons: [Person]
    private let pets: [Pet]

    init(persons: [Person], pets: [Pet]) {
        self.persons = persons
        self.pets = pets
    }
    
    func listData() -> [MyViewModel.Data] {
        pets.compactMap { pet in
            guard let owner = persons.first(where: { $0.id == pet.ownerId }) else {
                return nil
            }
            return MyViewModel.Data(petName: pet.name,
                                    owner: owner.firstName)
        }
    }
    
    struct Data: Equatable {
        let petName: String
        let owner: String
    }
}
