//
//  ViewController.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit
import SnapKit

class homeViewController: BaseViewController {

    private let ligueCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 350, height: 70)
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private var ligues: [Ligue] = []
    
    private let networkService = NetworkService()
    
    override func setup() {
        super.setup()
        view.backgroundColor = .systemBackground
        title = "Футбольные лиги"
        setupCollection()
        getLigues()
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
            make.top.equalToSuperview().offset(15)
            make.directionalHorizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(10)
        }
    }
    
    private func setupCollection() {
        ligueCollectionView.dataSource = self
        ligueCollectionView.register(LigueCollectionViewCell.self, forCellWithReuseIdentifier: LigueCollectionViewCell.reusID)
        ligueCollectionView.delegate = self
    }
    
    private func getLigues() {
        networkService.getLigues { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                switch result {
                case .success(let model):
                    self.ligues = model
                    self.ligueCollectionView.reloadData()
                case .failure(let error):
                    self.showAlert(title: "Ошибка", massage: "\(error.localizedDescription)")
                }
            }
        }
    }
}

extension homeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ligues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LigueCollectionViewCell.reusID, for: indexPath) as! LigueCollectionViewCell
        cell.fill(with: ligues[indexPath.row])
        return cell
    }
}

extension homeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TeamsViewController()
        let selectedLigueCategory = ligues[indexPath.row]
        vc.selectedLigue = selectedLigueCategory.strLeague
//        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}
