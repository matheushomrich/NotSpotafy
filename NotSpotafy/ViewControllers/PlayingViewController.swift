//
//  PlayingView.swift
//  NotSpotafy
//
//  Created by Enzo Degrazia on 24/06/21.
//

import UIKit
import Foundation

class PlayingViewController: UIViewController {
    
    @IBOutlet weak var playingImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var music: Music?
    var musicService: MusicService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playingImageView.image = UIImage(named: music!.id)
        songNameLabel.text = music?.title
        authorName.text = music?.artist
        heartButton.setImage(UIImage(systemName: isFavorited(music: music!) ? "heart.fill" : "heart"), for: .normal)
        
        if isFavorited(music: music!) {
            heartButton.tintColor = .red
        } else {
            heartButton.tintColor = .black
        }
        

    }
    @IBAction func favorite(_ sender: Any) {
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
