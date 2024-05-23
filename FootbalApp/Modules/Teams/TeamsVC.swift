//
//  TeamsVC.swift
//  FootbalApp
//
//  Created by Apple on 19.5.2024.
//

import UIKit
import SnapKit
 
class TeamsViewController: BaseViewController {
    
    private let TeamsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 3
        let interItemSpacing: CGFloat = 15
        let totalSpacing = (numberOfItemsPerRow - 1) * interItemSpacing
        let itemWidth = (UIScreen.main.bounds.width - totalSpacing) / numberOfItemsPerRow
        layout.itemSize = CGSize(width: itemWidth, height: 280)
        layout.minimumInteritemSpacing = interItemSpacing
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let networkService = NetworkService()
    
    private var teams: [TeamModel] = []
    
    var selectedLigue: String?
   
    override func setup() {
        super.setup()
        view.backgroundColor = .systemBackground
        
        setupCollection()
        title = selectedLigue
        getTeams(with: selectedLigue!)
    }
    
    override func setupAdd() {
        super.setupAdd()
        view.add {
            TeamsCollectionView
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        TeamsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.directionalHorizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupCollection() {
        TeamsCollectionView.dataSource = self
        TeamsCollectionView.register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: TeamsCollectionViewCell.reusID)
        TeamsCollectionView.delegate = self
    }
    
    private func getTeams(with sport: String) {
        networkService.getTeams(
            sport: sport
        ) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                switch result {
                case .success(let model):
                    self.teams = model
                    self.TeamsCollectionView.reloadData()
                case .failure(let error):
                    self.showAlert(title: "Ошибка", massage: "\(error.localizedDescription)")
                }
            }
        }
    }

}

extension TeamsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeamsCollectionViewCell.reusID,
            for: indexPath) as! TeamsCollectionViewCell
        cell.fill(with: teams[indexPath.row])
        return cell
    }
}

extension TeamsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ClubViewController()
        let selectedTeamsCategory = teams[indexPath.row]
        vc.selectedTeams = selectedTeamsCategory.strTeam
//        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}
