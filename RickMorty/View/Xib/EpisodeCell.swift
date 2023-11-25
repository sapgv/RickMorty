//
//  EpisodeCell.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import UIKit

class EpisodeCell: UICollectionViewCell {

    @IBOutlet weak var wrapperView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.wrapperView.layer.cornerRadius = 8
        self.wrapperView.clipsToBounds = true
    }
    
    func setup(episode: Episode) {
        self.nameLabel.text = episode.name
        self.episodeLabel.text = episode.episode
    }

}
