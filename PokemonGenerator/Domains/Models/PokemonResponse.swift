//
//  PokemonResponse.swift
//  PokemonGenerator
//
//  Created by stefan.adisurya on 19/05/22.
//

import Foundation

// MARK: - Data Model
internal struct PokemonResponse: Decodable {
    internal let results: [ResultResponse]
}

internal struct ResultResponse: Decodable {
    internal let name: String
}
