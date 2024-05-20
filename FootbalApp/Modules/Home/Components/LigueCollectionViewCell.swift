//
//  ligueCollectionViewCell.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit
import SnapKit


class LigueCollectionViewCell: UICollectionViewCell {
    
    private let ligueTitleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textColor = .systemBlue
        view.textAlignment = .center
        return view
    }()
    
    private let ligueSeeasonLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    static let reusID = "LigueCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        backgroundColor = .lightGray
        layer.cornerRadius = 12
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
            ligueTitleLabel
            ligueSeeasonLabel
        }
    }
    
    private func setupLayouts() {
        ligueTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.directionalHorizontalEdges.equalToSuperview()
        }
        ligueSeeasonLabel.snp.makeConstraints { make in
            make.top.equalTo(ligueTitleLabel.snp.bottom)
            make.directionalHorizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func fill(with item: Ligue) {
        ligueTitleLabel.text = item.strLeague
        ligueSeeasonLabel.text = item.strLeagueAlternate
    }
}
