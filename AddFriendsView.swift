//
//  AddFriendsView.swift
//  PerfectPhoto
//
//  Created by Reinaldo Verdugo on 11/11/14.
//  Copyright (c) 2014 ___PruebaCorp___. All rights reserved.
//

import UIKit

class AddFriendsView: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var friends = [Friend]()
    var filteredFriends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.friends = [Friend(name: "reiverdugo"),
            Friend(name: "rmarquez1"),
            Friend(name: "yueofdark"),
            Friend(name: "whosthemark"),
            Friend(name: "glimonta"),
            Friend(name: "jaescalante02"),
            Friend(name: "esteoliver"),
            Friend(name: "pexison"),
            Friend(name: "giapetto"),
            Friend(name: "jljb1990")
        ]
        self.tableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredFriends = self.friends.filter({( friend:Friend) -> Bool in
            let stringMatch = friend.name.rangeOfString(searchText)
            return (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredFriends.count
        } else {
            return self.friends.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        var friend: Friend
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            friend = filteredFriends[indexPath.row]
        } else {
            friend = friends[indexPath.row]
        }
        
        // Configure the cell
        cell.textLabel.text = friend.name
        
        return cell
    }
}
