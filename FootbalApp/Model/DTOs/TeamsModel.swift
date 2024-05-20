//
//  TeamsModel.swift
//  FootbalApp
//
//  Created by Apple on 19.5.2024.
//

import Foundation

struct TeamsModel: Codable {
    var teams: [TeamModel] = []
}
struct TeamModel: Codable {
    var strTeam: String
    var strLeague: String
    var strCountry: String
    var strTeamBadge: String
}
