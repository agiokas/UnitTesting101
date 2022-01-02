//
//  MyViewModel.swift
//
//
//  Created by Apostolos Giokas on 02.01.22.
//

import Foundation

final class MyViewModel2 {
    private let datasource: DatasourceInterface

    init(datasource: DatasourceInterface) {
        self.datasource = datasource
    }

    func listData() -> [MyViewModel.Data] {
        datasource
            .pets()
            .compactMap { pet in
                guard let owner = datasource
                    .persons()
                    .first(where: { $0.id == pet.ownerId }) else {
                    return nil
                }
                return MyViewModel.Data(petName: pet.name, owner: owner.firstName)
            }
    }
}
