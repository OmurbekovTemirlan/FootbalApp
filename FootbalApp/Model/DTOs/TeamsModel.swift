//
//  SportsModel.swift
//  FootbalApp
//
//  Created by Apple on 19.5.2024.
//

import Foundation

struct SportsModel: Codable {
    var sports: [SportModel] = []
}
struct SportModel: Codable {
    var strSport: String
    var strFormat: String
    var strSportThumb: String
    var strSportDescription: String
}
