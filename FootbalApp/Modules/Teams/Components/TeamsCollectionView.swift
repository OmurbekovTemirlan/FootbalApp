//
//  TeamsView.swift
//  FootbalApp
//
//  Created by Apple on 19.5.2024.
//

import UIKit
import SnapKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    static let reusID = "TeamsCollectionViewCell"
    
    private var strTeamBadge: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    
    private var strTeam: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private var strLeague: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupAdd()
        setupLayouts()
    }
    
    private func setupAdd() {
        add {
            strTeamBadge
            strTeam
            strLeague
        }
    }

    private func setupLayouts() {
        strTeamBadge.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.directionalHorizontalEdges.equalToSuperview().inset(1)
            make.height.equalTo(120)
        }
        strTeam.snp.makeConstraints { make in
            make.top.equalTo(strTeamBadge.snp.bottom).offset(15)
            make.directionalHorizontalEdges.equalToSuperview()
        }
        strLeague.snp.makeConstraints { make in
            make.top.equalTo(strTeam.snp.bottom).offset(15)
            make.directionalHorizontalEdges.equalToSuperview().inset(5)
        }
    }
    
    func fill(with item: TeamModel) {
        strTeam.text =  item.strTeam
        strLeague.text = item.strLeague
        ImageDownloader.shared.loadImage(from: item.strTeamBadge) { [weak self] result in
                if case .success(let image) = result {
                    DispatchQueue.main.async {
                    self?.strTeamBadge.image = image
                }
            }
        }
    }
}
