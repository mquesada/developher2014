//
//  PeopleListViewController.swift
//  DevelopHer2014
//
//  Created by Ya Kao on 11/15/14.
//  Copyright (c) 2014 Maricel-Betsy-Cindy-Alexa-Diana. All rights reserved.
//

import UIKit

class PeopleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var allUsers:[ParseUser]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\n[ ]>>>>>> \(__FILE__.pathComponents.last!) >> \(__FUNCTION__) < \(__LINE__) >")
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
//          
//        tableView.registerNib(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 96
        var peopleTitleImageView = UIImageView(image: UIImage(named: "peopleList.png"))
        self.navigationItem.titleView = peopleTitleImageView
        self.fetchAllUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      func fetchAllUsers(){
        var query = ParseUser.query()
        query.findObjectsInBackgroundWithBlock { (allUsers:[AnyObject]!, error:NSError!) -> Void in
             self.allUsers = allUsers as? [ParseUser]
             self.tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //temp
        println("row number is \(self.allUsers?.count ?? 0)")
        return self.allUsers?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("PeopleCell") as PeopleTableViewCell
        let user = self.allUsers?[indexPath.row] as  ParseUser!
        cell.nameLabel.text = user.name!
        cell.headLineLabel.text = user.headline!
        cell.industryLabel.text = user.Industry!
         let url = NSURL(string: user.profileImageUrl!)
        cell.profileImageView.setImageWithURL(url)
  
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetailSegue"){
            println("Go to user detail")
        }
    }



}
