//
//  File.swift
//  
//
//  Created by Apostolos Giokas on 02.01.22.
//

import Foundation

struct Pet: Identifiable, Codable {
    let id: String
    let name: String
    let ownerId: String
}
