//
//  NetworkService.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import Foundation

class NetworkService {
    enum HttpMethods: String {
        case GET, POST, PUT, DELETE
    }
    
    private let decoder = JSONDecoder()
    
    func getLigues(complition: @escaping (Result<[Ligue], Error>) -> Void) {
        let request = URLRequest(url: Constant.baseURL.appendingPathComponent("all_leagues.php"))
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                complition(.failure(error))
            }
            
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try self.decoder.decode(AllLigues.self, from: data)
                complition(.success(model.leagues))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    func getTeams(sport: String, complition: @escaping (Result<[TeamModel], Error>) -> Void) {
        var urlComponents = URLComponents(url: Constant.baseURL.appendingPathComponent("search_all_teams.php"), resolvingAgainstBaseURL: false)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "l", value: sport),
        ]
        
        guard let components = urlComponents else { return }
        
        let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                complition(.failure(error))
            }
            
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try self.decoder.decode(TeamsModel.self, from: data)
                complition(.success(model.teams))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
    
    func getClubDetails(with name: String, complition: @escaping (Result<ClubModel, Error>) -> Void) {
        var urlComponents = URLComponents(url: Constant.baseURL.appendingPathComponent("searchteams.php"), resolvingAgainstBaseURL: false)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "t", value: name),
        ]
        
        guard let components = urlComponents else { return }
        
        let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                complition(.failure(error))
            }
            
            guard let data = data else {
                complition(.failure(error!))
                return
            }
            do {
                let model = try self.decoder.decode(ClubsModel.self, from: data)
                if let clubsDetails = model.teams.first {
                    complition(.success(clubsDetails))
                }
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}
