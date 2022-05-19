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
    
    var baseURL: URL {
        return URL(string: "https://pokeapi.co")!
    }
    
    var path: String {
        switch self {
        case .getPokemon:
            return "/api/v2/pokemon"
        }
    }
    
    var method: Method {
        switch self {
        case .getPokemon:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPokemon:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
