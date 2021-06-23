//
//  ViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 18/06/21.
//

import UIKit

class LibViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lib: UITableView!
    
    
    private var collections: [MusicCollection] = []
    private var musicService: MusicService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.musicService = try MusicService()
            self.collections = musicService?.loadLibrary() ?? []
        } catch {
            print(error)
        }
        
        lib.delegate = self
        lib.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "title-detail", for: indexPath) as? LibTableViewCell
        else { fatalError("Could not convert from cell to LibTableViewCell") }
        
        let musicCollection = collections[indexPath.row]
        cell.albumImageView.image = UIImage(named: musicCollection.id)
        cell.titleLabel.text = musicCollection.title
        cell.subtitleLabel.text = "\(musicCollection.type.rawValue) · \(musicCollection.mainPerson)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let musicCollection = collections[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: musicCollection)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let mc = sender as? MusicCollection
            let vc = segue.destination as? AlbumViewController
            vc?.musicCollection = mc
            vc?.musicService = musicService
        }
    }
    
}

