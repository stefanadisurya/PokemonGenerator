//
//  PokemonTarget.swift
//  PokemonGenerator
//
//  Created by stefan.adisurya on 19/05/22.
//

import Moya

internal enum PokemonTarget {
    case getPokemon
}

extension PokemonTarget: TargetType {
    
    internal var baseURL: URL {
        return URL(string: "https://pokeapi.co")!
    }
    
    internal var path: String {
        switch self {
        case .getPokemon:
            return "/api/v2/pokemon"
        }
    }
    
    internal var method: Method {
        switch self {
        case .getPokemon:
            return .get
        }
    }
    
    internal var task: Task {
        switch self {
        case .getPokemon:
            return .requestPlain
        }
    }
    
    internal var headers: [String : String]? {
        return nil
    }
    
}
