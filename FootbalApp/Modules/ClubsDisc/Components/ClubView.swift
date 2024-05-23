//
//  ClubView.swift
//  FootbalApp
//
//  Created by Apple on 20.5.2024.
//

import UIKit
import SnapKit

class ClubView: BaseView {
    
    private let scrollViewDetails: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private let conteinerView = UIView()
    
    private let strTeamBadge = UIImageView()
    
    private let strTeam: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        return view
    }()
    
    private let intFormedYear: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    private let strLeague: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    private let strStadium: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        return view
    }()
    
    private let strStadiumThumb = UIImageView()
    
    private let strStadiumDescription: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private let strStadiumLocation:  UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    private let intStadiumCapacity: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    private let strInstagram:  UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        return view
    }()
    
    private let strCountry:  UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        return view
    }()
    
    private let strTeamLogo = UIImageView()
    
    override func setup() {
        super.setup()
        
    }
    
    override func setupAdd() {
        super.setupAdd()
        add {
            scrollViewDetails
        }
        scrollViewDetails.add { conteinerView }
        conteinerView.add {
            strTeamBadge
            strTeam
            intFormedYear
            strLeague
            strStadiumThumb
            strStadium
            strStadiumDescription
            intStadiumCapacity
            strStadiumLocation
            strInstagram
            strCountry
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        scrollViewDetails.snp.makeConstraints { make in
            make.directionalEdges.width.equalToSuperview()
        }
        conteinerView.snp.makeConstraints { make in
            make.directionalEdges.width.equalToSuperview()
        }
        strTeamBadge.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        strTeam.snp.makeConstraints { make in
            make.top.equalTo(strTeamBadge.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        intFormedYear.snp.makeConstraints { make in
            make.top.equalTo(strTeam.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
        }
        strLeague.snp.makeConstraints { make in
            make.top.equalTo(intFormedYear.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
        }
        strStadiumThumb.snp.makeConstraints { make in
            make.top.equalTo(strLeague.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(200)
        }
        strStadium.snp.makeConstraints { make in
            make.top.equalTo(strStadiumThumb.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        strStadiumDescription.snp.makeConstraints { make in
            make.top.equalTo(strStadium.snp.bottom).offset(15)
            make.directionalHorizontalEdges.equalToSuperview().inset(15)
        }
        intStadiumCapacity.snp.makeConstraints { make in
            make.top.equalTo(strStadiumDescription.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
        }
        strStadiumLocation.snp.makeConstraints { make in
            make.top.equalTo(intStadiumCapacity.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
        }
        strCountry.snp.makeConstraints { make in
            make.top.equalTo(strStadiumLocation.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
        }
        strInstagram.snp.makeConstraints { make in
            make.top.equalTo(strCountry.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
    }
    
    func fill(with item: ClubModel) {
        ImageDownloader.shared.loadImage(from: item.strTeamBadge) { [weak self] result in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if case .success(let image) = result {
                    self.strTeamBadge.image = image
                }
            }
        }
        strTeam.text = item.strTeam
        intFormedYear.text = "Date of club creation: \(item.intFormedYear)"
        strLeague.text = "League name: \(item.strLeague)"
        ImageDownloader.shared.loadImage(from: item.strStadiumThumb) { [weak self] result in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                if case .success(let image) = result {
                    self.strStadiumThumb.image = image
                }
            }
        }
        strStadium.text = item.strStadium
        strStadiumDescription.text = item.strStadiumDescription
        intStadiumCapacity.text = "Stadium capacity: \(item.intStadiumCapacity)"
        strStadiumLocation.text = "Сlub location: \(item.strStadiumLocation)"
        strCountry.text = "Сountry: \(item.strCountry)"
        strInstagram.text = "Instagram club: \(item.strInstagram)"
    }
    
}
