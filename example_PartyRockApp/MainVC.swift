//
//  ViewController.swift
//  example_PartyRockApp
//
//  Created by quang nguyen on 12/9/16.
//  Copyright © 2016 quang nguyen. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/eWNNjIIq4TA/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/eWNNjIIq4TA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "You are my friend")
        
        let p2 = PartyRock(imageURL: "http://orig11.deviantart.net/3904/f/2008/116/c/1/naruto_blue_bird_feather_by_xpand_your_mind.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/48hWGEbBVjw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Blue bird")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/B3qgryHtaXk/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/F5dZfuQXOiw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Naruto Opening 2")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

