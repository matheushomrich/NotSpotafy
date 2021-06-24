//
//  AlbumViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 21/06/21.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var musicService: MusicService?
    var musicCollection: MusicCollection?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumCreator: UILabel!
    @IBOutlet weak var numberOfSongs: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var albumTable: UITableView!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    //@IBOutlet weak var heartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.title = musicCollection?.title
        albumCover.image = UIImage(named: musicCollection!.id)
        albumName.text = musicCollection?.title
        albumCreator.text = "Album by \(String(describing: musicCollection!.mainPerson))"
        numberOfSongs.text = "\(String(describing: musicCollection!.musics.count)) songs"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        releaseDate.text = "Released \(dateFormatter.string(from: musicCollection!.referenceDate))"
        if musicCollection?.type.rawValue == "playlist" {
            infoButton.isEnabled = false
        }
        musicService = appDelegate.musicService
        albumTable.dataSource = self
        albumTable.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        albumTable.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (musicCollection?.musics.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "album-detail", for: indexPath) as? AlbumViewCell
        else { fatalError("Could not convert from cell to AlbumViewCell") }
        
        let music = musicCollection?.musics[indexPath.row]
        cell.musicImage.image = UIImage(named: music!.id)
        cell.musicName.text = music?.title
        cell.musicSubtitle.text = music?.artist
        cell.heartButton.setImage(UIImage(systemName: isFavorited(music: music!) ? "heart.fill" : "heart"), for: .normal)
        
        if isFavorited(music: music!) {
            cell.heartButton.tintColor = .red
        } else {
            cell.heartButton.tintColor = .black
        }
        cell.music = music
        cell.musicService = musicService
        return cell
    }
    
    func isFavorited(music: Music) -> Bool {
        for m in musicService!.favoriteMusics {
            if m == music {
                return true
            }
        }
        return false
    }
    
    @IBAction func infoButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "detailSegue", sender: musicCollection)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            let music: Music = (musicCollection?.musics[indexPath.row])!
            self.performSegue(withIdentifier: "playing-segue", sender: music)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let mc = sender as? MusicCollection
            let vc = segue.destination as? AlbumDetailViewController
            vc!.musicCollection = mc
        } else if segue.identifier == "playing-segue" {
            let music = sender as? Music
            let vc = segue.destination as? PlayingViewController
            vc!.music = music
            vc?.musicService = musicService
            vc!.albumTable = albumTable
        }
    }
    
}
