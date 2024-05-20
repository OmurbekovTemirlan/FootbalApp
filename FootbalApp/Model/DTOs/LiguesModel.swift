//
//  DTOs.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit

struct AllLigues: Codable {
    var ligues: [Ligue] = []
}

struct Ligue: Codable {
    let strLeague: String
    let strLeagueAlternate: String
}


