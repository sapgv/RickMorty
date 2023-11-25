//
//  EpisodesViewController.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import UIKit

class EpisodesViewController: UIViewController {

    var viewModel: IEpisodesViewModel!
    
    private var collectioView: UICollectionView!
    
    private var refreshControl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Episodes"
        self.view.backgroundColor = .white
        self.setupViewModel()
        self.setupRefreshControl()
        self.setupCollectionView()
        self.layout()
    }
    
    private func setupViewModel() {
        
        self.viewModel.updateCompletion = { [weak self] error in

            self?.refreshControl.endRefreshing()

            self?.collectioView.reloadData()

        }
        
    }
    
    private func setupRefreshControl() {
        
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    @objc
    private func refresh() {
        
        self.viewModel.updateData()
        
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectioView.dataSource = self
        self.collectioView.delegate = self
        self.collectioView.refreshControl = self.refreshControl
        self.collectioView.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellWithReuseIdentifier: "EpisodeCell")
    }
    
    private func layout() {
        
        self.view.addSubview(self.collectioView)
        
        let actionButton = ActionButtonFactory(color: .systemGreen).createActionButton()
        actionButton.action = { [weak self] in
            
            
             
        }
        self.collectioView.translatesAutoresizingMaskIntoConstraints = false
        
        self.collectioView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        self.collectioView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.collectioView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        self.collectioView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
}

extension EpisodesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpisodeCell", for: indexPath) as! EpisodeCell
        
        let episode = self.viewModel.episodes[indexPath.row]
        cell.setup(episode: episode)

        return cell
        
    }
    
}

extension EpisodesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.width, height: 200)
        
    }
    
}
