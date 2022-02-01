//
//  ViewController.swift
//  aMusic
//
//  Created by Anshumali Karna on 01/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var table:UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs(){
        songs.append(Song(name: "BOOMBAYAH",
                          albumName: "YG Entertainment",
                          artistName: "BLACKPINK",
                          imageName: "logo",
                          trackName: "boombayah")
        )
        songs.append(Song(name: "LISA-MONEY",
                          albumName: "YG Entertainment",
                          artistName: "LISA",
                          imageName: "logo",
                          trackName: "lisamoney")
        )
        songs.append(Song(name: "PLAYDATE",
                          albumName: "YG Entertainment",
                          artistName: "PLAYDATE",
                          imageName: "logo",
                          trackName: "playdate")
        )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player")
        else {
            return
        }
        present(vc, animated: true)
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

