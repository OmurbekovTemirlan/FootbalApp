//
//  ligueCollectionViewCell.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit
import SnapKit


class LigueCollectionViewCell: UICollectionViewCell {
    
    private let ligueImageView = UIImageView()
    
    private let ligueTitleLabel = UILabel()
    
    private let ligueSeeasonLabel = UILabel()
    
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
            ligueImageView
            ligueTitleLabel
            ligueSeeasonLabel
        }
    }
    
    private func setupLayouts() {
        ligueImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.directionalHorizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
        ligueTitleLabel.snp.makeConstraints { make in
            <#code#>
        }
        ligueSeeasonLabel.snp.makeConstraints { make in
            <#code#>
        }
    }
}
