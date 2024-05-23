//
//  ClubVC.swift
//  FootbalApp
//
//  Created by Apple on 20.5.2024.
//

import UIKit
import SnapKit

class ClubViewController: BaseViewController {
    
    private let clubView = ClubView()
    
    private let networkService = NetworkService()
    
    private var clubs: [ClubModel] = []
    
    var selectedTeams: String?
    
    override func setup() {
        super.setup()
        view.backgroundColor = .systemBackground
        title = selectedTeams
        getClubDetails(with: selectedTeams!)
    }
    
    override func setupAdd() {
        super.setupAdd()
        view.add {
            clubView
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        clubView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.bottom.equalToSuperview().inset(-10)
            make.directionalHorizontalEdges.equalToSuperview().inset(10)
        }
    }
    
    private func getClubDetails(with name: String) {
        networkService.getClubDetails(with: name) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.clubView.fill(with: model)
                }
            case .failure(let error):
                showAlert(title: "error", massage: error.localizedDescription)
            }
        }
    }
}
