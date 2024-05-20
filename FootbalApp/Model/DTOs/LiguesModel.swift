//
//  DTOs.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit

struct AllLigues: Codable {
    var leagues: [Ligue] = []
}
struct Ligue: Codable {
    var strLeague: String
    var strLeagueAlternate: String
}


