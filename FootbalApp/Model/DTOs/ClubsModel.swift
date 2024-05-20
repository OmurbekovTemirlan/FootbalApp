//
//  ClubsModel.swift
//  FootbalApp
//
//  Created by Apple on 19.5.2024.
//

import Foundation

struct ClubsModel: Codable {
    var teams: [ClubModel] = []
}
struct ClubModel: Codable {
    var strTeam: String
    var intFormedYear: String
    var strLeague: String
    var strStadium: String
    var strStadiumThumb: String
    var strStadiumDescription: String
    var strStadiumLocation: String
    var intStadiumCapacity: String
    var strInstagram: String
    var strCountry: String
    var strTeamBadge: String
    var strTeamLogo: String
}
