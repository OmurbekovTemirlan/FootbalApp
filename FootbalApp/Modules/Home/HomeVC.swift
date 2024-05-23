//
//  ViewController.swift
//  FootbalApp
//
//  Created by Apple on 18.5.2024.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {

    private lazy var ligueCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 350, height: 70)
        layout.minimumInteritemSpacing = 15
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.refreshControl = refreshControll
        return view
    }()
    
    private lazy var refreshControll: UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(reshreshProducts), for: .valueChanged)
        controll.attributedTitle = NSAttributedString(string: "")
        return controll
    }()
    
    private lazy var activity: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        view.style = .large
        return view
    }()
    
    private var isLoading: Bool = false {
        didSet {
            _ = isLoading ? activity.startAnimating() : activity.stopAnimating()
        }
    }
    
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
            activity
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        
        ligueCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.directionalHorizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(10)
        }
        activity.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setupCollection() {
        ligueCollectionView.dataSource = self
        ligueCollectionView.register(LigueCollectionViewCell.self, forCellWithReuseIdentifier: LigueCollectionViewCell.reusID)
        ligueCollectionView.delegate = self
    }
    
    private func getLigues() {
        isLoading = true
        networkService.getLigues { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                self.isLoading = false
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
    
    @objc
    private func reshreshProducts() {
        refreshControll.beginRefreshing()
        getLigues()
        refreshControll.endRefreshing()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ligues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LigueCollectionViewCell.reusID, for: indexPath) as! LigueCollectionViewCell
        cell.fill(with: ligues[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TeamsViewController()
        let selectedLigueCategory = ligues[indexPath.row]
        vc.selectedLigue = selectedLigueCategory.strLeague
//        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
