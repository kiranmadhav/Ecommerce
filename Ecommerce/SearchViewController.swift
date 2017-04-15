//
//  SearchViewController.swift
//  Ecommerce
//
//  Created by Pragati on 07/04/17.
//  Copyright © 2017 Technosoftcorp. All rights reserved.
//

import UIKit

import Alamofire

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rooms : Array<LocationModel>!

    @IBOutlet weak var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        loadSearchResult()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        guard (self.rooms != nil) else {
            return 0
        }
        
        return self.rooms.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//     
//        // Configure the cell...
//     
//        return cell
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        
        cell.textLabel?.text = self.rooms[indexPath.row].locName
        
        return cell
     }
    


    @IBAction func SearchTextChange(_ sender: Any) {
        
        let searchText : UITextField = sender as! UITextField
        
        loadSearchResult(searchKey: searchText.text!)
        
    }
    
    
    //$(PROJECT_DIR)/build/Debug-iphoneos/Alamofire
    
    func loadSearchResult(searchKey : String) {
        
        Alamofire.request(
            URL(string: Constants.Google.Base + searchKey)!,
            method: .get,
            parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { (response) -> Void in
                
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    return
                }

                guard let value = response.result.value as? [String: Any],
                    let rows = value["predictions"] as? NSArray else {
                        print("Malformed data received from fetchAllRooms service")
                        return
                }

                self.rooms = rows.flatMap({ (roomDict) -> LocationModel? in
                    return LocationModel(rawData: roomDict as! NSDictionary)!
                })

//                let locObj : LocationModel! = self.rooms[0]
//                
//                print("Rows \(String(describing: locObj.locName))")
                
                self.searchResultTableView.reloadData()

        }
    }

}
