//
//  ViewController.swift
//  Music app
//
//  Created by STUDENT on 4/22/24.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var table: UITableView!

  var songs = [song]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func configureSongs(){
        songs.append(song(name:"God Damn",
                          albumName: "punjabi",
                          artistName:"karan aujhla and badshah",
                          imageName: "cover3" ,
                          trackname: "God Damn_320(PagalWorld.com.sb)"))
        songs.append(song(name:"King shit",
                          albumName: "punjabi",
                          artistName:"shubh",
                          imageName: "cover2" ,
                          trackname: "King Shit_320(PagalWorld.com.sb)"))
        songs.append(song(name:"you and Me",
                          albumName: "punjabi",
                          artistName:"shubh",
                          imageName: "cover1" ,
                          trackname: "You and Me_320(PagalWorld.com.sb)"))
    }
    // table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica-Bold", size: 10)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController  else{
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }

}
struct song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName:String
    let trackname: String
}

