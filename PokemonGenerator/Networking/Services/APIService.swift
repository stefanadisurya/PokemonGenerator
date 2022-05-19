//
//  APIService.swift
//  PokemonGenerator
//
//  Created by stefan.adisurya on 19/05/22.
//

import Moya

internal class APIService {
    
    // MARK: - Singleton
    internal static let shared = APIService()
    
    // MARK: - Provider
    private let provider = MoyaProvider<PokemonTarget>()
    
    // MARK: - GET function
    internal func GET(target: PokemonTarget, completion: @escaping Completion) {
        switch target {
        case .getPokemon:
            provider.request(.getPokemon, completion: completion)
        }
    }
    
}
