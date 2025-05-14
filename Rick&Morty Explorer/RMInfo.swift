//
//  RMInfo.swift
//  Rick&Morty Explorer
//
//  Created by Eduardo Frederico Sotero da Costa              on 07/05/25.
//

import Foundation

struct RMInfo: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
