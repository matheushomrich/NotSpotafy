//
//  FavoritesTableViewCell.swift
//  NotSpotify
//
//  Created by Enzo Degrazia on 21/06/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
   
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var favoriteSubtitleLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    var music: Music?
    var musicService: MusicService?
    
    @IBAction func unfavorite(_ sender: Any) {
        musicService?.toggleFavorite(music: music!, isFavorite: false)
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.tintColor = .black
    }
    
}
