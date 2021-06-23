//
//  AlbumDetailViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 22/06/21.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
//    @IBOutlet weak var topCell: DetailViewCell!
//    @IBOutlet weak var bottomCell: DetailViewBottomCell!
    @IBOutlet weak var tableView: UITableView!
    var musicCollection: MusicCollection?
//    @IBOutlet weak var albumCover: UIImageView!
//    @IBOutlet weak var albumName: UILabel!
//    @IBOutlet weak var albumArtist: UILabel!
//    @IBOutlet weak var numberOfSongs: UILabel!
//    @IBOutlet weak var releaseDate: UILabel!
//    @IBOutlet weak var albumDescription: UILabel!
//    @IBOutlet weak var aboutArtirst: UILabel!
//    @IBOutlet weak var artistDescription: UILabel!
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        topCell.imageView!.image = UIImage(named: musicCollection!.id)
//        topCell.albumName!.text = musicCollection?.title
//        topCell.albumArtist!.text = musicCollection?.mainPerson
//        topCell.numberOfSongs.text = "\(String(describing: musicCollection!.musics.count)) songs"
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM dd yyyy"
//        topCell.releaseDate.text = "Released \(dateFormatter.string(from: musicCollection!.referenceDate))"
//        topCell.albumDescription.text = musicCollection?.albumDescription
//        bottomCell.aboutArtirst.text = musicCollection?.mainPerson
//        bottomCell.artistDescription.text = musicCollection?.albumArtistDescription
    }
}
