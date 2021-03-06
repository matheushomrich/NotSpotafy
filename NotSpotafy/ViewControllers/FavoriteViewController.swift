//
//  FavoriteViewController.swift
//  NotSpotify
//
//  Created by Enzo Degrazia on 21/06/21.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var favorite: UITableView!
    private var musicService: MusicService?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicService = appDelegate.musicService
        favorite.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favorite.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (musicService?.favoriteMusics.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favorite-cell", for: indexPath) as? FavoritesTableViewCell else { fatalError("Could not convert from cell to FavoriteTableViewCell") }
        
        let favoriteItem = musicService?.favoriteMusics[indexPath.row]
        cell.favoriteImage.image = UIImage(named: favoriteItem!.id)
        cell.favoriteLabel.text = favoriteItem?.title
        cell.favoriteSubtitleLabel.text = favoriteItem?.artist
        cell.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        cell.heartButton.tintColor = .red
        cell.music = favoriteItem
        cell.musicService = musicService
        
        return cell
    }
    
    
    
}
