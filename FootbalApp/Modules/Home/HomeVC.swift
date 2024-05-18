//
//  ViewController.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {

    private let ligueCollectionView: UICollectionView = {
        let loyaut = UICollectionViewFlowLayout()
        loyaut.scrollDirection = .vertical
        loyaut.itemSize = .init(width: 200, height: 200)
        let view = UICollectionView(frame: .zero, collectionViewLayout: loyaut)
        view.backgroundColor = .brown
        return view
    }()
    
    override func setup() {
        super.setup()
        view.backgroundColor = .lightGray
        
    }
    
    override func setupAdd() {
        super.setupAdd()
        view.add {
            ligueCollectionView
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        ligueCollectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
}

