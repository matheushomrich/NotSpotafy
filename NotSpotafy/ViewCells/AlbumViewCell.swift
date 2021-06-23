//
//  AlbumViewCell.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 21/06/21.
//

import UIKit

class AlbumViewCell: UITableViewCell {

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicSubtitle: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    var music: Music?
    var musicService: MusicService?
    
    @IBAction func favoriteMusic(_ sender: Any) {
        if isFavorited(music: music!) {
            musicService?.toggleFavorite(music: music!, isFavorite: !isFavorited(music: music!))
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = .black
            
            
        } else {
            musicService?.toggleFavorite(music: music!, isFavorite: !isFavorited(music: music!))
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .red
        }
    }
    
    func isFavorited(music: Music) -> Bool {
        
        for m in musicService!.favoriteMusics {
            if m == music {
                return true
            }
        }
        return false
    }
    
}
