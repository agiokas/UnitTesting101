//
//  File.swift
//  
//
//  Created by Apostolos Giokas on 02.01.22.
//

import Foundation

protocol DatasourceInterface {
    func pets() -> [Pet]
    func persons() -> [Person]
}

final class Datasource: DatasourceInterface {
    func pets() -> [Pet] {
        [
            Pet(id: "1", name: "Max", ownerId: "1"),
            Pet(id: "2", name: "Azor", ownerId: "1"),
            Pet(id: "3", name: "Monty", ownerId: "2"),
            Pet(id: "4", name: "Zizou", ownerId: "3"),
        ]
    }
    
    func persons() -> [Person] {
        [
            Person(id: "1", firstName: "Apo", lastName: ""),
            Person(id: "3", firstName: "Melanie", lastName: ""),
            Person(id: "4", firstName: "Mustermann", lastName: ""),
        ]
    }
}
