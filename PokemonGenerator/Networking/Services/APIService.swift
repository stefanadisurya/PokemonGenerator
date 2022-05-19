//
//  APIService.swift
//  PokemonGenerator
//
//  Created by stefan.adisurya on 19/05/22.
//

import Moya

internal class APIService {
    
    internal static let shared = APIService()
    private let provider = MoyaProvider<PokemonTarget>()
    
    internal func GET(target: PokemonTarget, completion: @escaping Completion) {
        switch target {
        case .getPokemon:
            provider.request(.getPokemon, completion: completion)
        }
    }
    
}
