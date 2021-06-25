//
//  AlbumDetailViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 22/06/21.
//

import UIKit

class AlbumDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var musicCollection: MusicCollection?
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            //top cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "top-cell", for: indexPath) as? DetailViewCell else { fatalError("Could not convert from cell to DetailViewCell") }
            
            cell.albumCover.image = UIImage(named: musicCollection!.id)
            cell.albumName!.text = musicCollection?.title
            cell.albumArtist!.text = musicCollection?.mainPerson
            cell.numberOfSongs.text = "\(String(describing: musicCollection!.musics.count)) songs"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd yyyy"
            cell.releaseDate.text = "Released \(dateFormatter.string(from: musicCollection!.referenceDate))"
            cell.albumDescription.text = musicCollection?.albumDescription
            
            cell.stackView.setCustomSpacing(20, after: cell.albumName)
            cell.stackView.setCustomSpacing(20, after: cell.releaseDate)
            
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bottom-cell", for: indexPath) as? DetailViewBottomCell else { fatalError("Could not convert from cell to DetailViewBottomCell") }
            
            cell.aboutArtirst.text = "About \(String(describing: musicCollection!.mainPerson))"
            cell.artistDescription.text = musicCollection?.albumArtistDescription
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}
