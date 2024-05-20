//
//  TeamsView.swift
//  FootbalApp
//
//  Created by Apple on 19.5.2024.
//

import UIKit
import SnapKit

class TeamsView: BaseView {
    
   private var strTeam: UILabel = {
       let view = UILabel()
       view.font = .systemFont(ofSize: 16, weight: .regular)
       return view
   }()
    
   private var intFormedYear: UILabel = {
       let view = UILabel()
       view.font = .systemFont(ofSize: 16, weight: .regular)
       return view
   }()
    
   private var strLeague: UILabel = {
       let view = UILabel()
       view.font = .systemFont(ofSize: 16, weight: .regular)
       return view
   }()
    
   private var strStadium: UILabel = {
       let view = UILabel()
       view.font = .systemFont(ofSize: 16, weight: .regular)
       return view
   }()
    
   private var strStadiumThumb: UIImageView = {
       let view = UIImageView()
       return view
   }()
    
    private var strStadiumDescription: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        return view
    }()
    
    private var strStadiumLocation: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        return view
    }()
    
    private var intStadiumCapacity: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        return view
    }()
    
    private var strInstagram: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private var strCountry: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    private var strTeamBadge: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private var strTeamLogo: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    override func setup() {
        super.setup()
        
    }
    
    override func setupAdd() {
        super.setupAdd()
        add {
            strTeam
            intFormedYear
            strLeague
            strStadium
            strStadiumThumb
            strStadiumDescription
            strStadiumLocation
            intStadiumCapacity
            strInstagram
            strCountry
            strTeamBadge
            strTeamLogo
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        strTeam.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    func fill(with item: TeamModel) {
        strTeam.text =  "Имя: /n \(item.strTeam)"
        intFormedYear.text = item.intFormedYear
        strLeague.text = item.strLeague
        strStadium.text = item.strStadium
        ImageDownloader.shared.loadImage(
            from: item.strStadiumThumb) { [weak self] result in
                if case .success(let image) = result {
                    DispatchQueue.main.async {
                        self?.strStadiumThumb.image = image
                    }
                }
            }
        strStadiumDescription.text = item.strStadiumDescription
        strStadiumLocation.text = item.strStadiumLocation
        intStadiumCapacity.text = item.intStadiumCapacity
        strInstagram.text = item.strInstagram
        strCountry.text = item.strCountry
        ImageDownloader.shared.loadImage(
            from: item.strTeamBadge) { [weak self] result in
                if case .success(let image) = result {
                    DispatchQueue.main.async {
                        self?.strTeamBadge.image = image
                    }
                }
            }
        ImageDownloader.shared.loadImage(
            from: item.strTeamLogo) { [weak self] result in
            if case .success(let image) = result {
                self?.strTeamLogo.image = image
            }
        }
    }
}
