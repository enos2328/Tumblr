//
//  PhotoViewController.swift
//  Tumblr
//
//  Created by Athena Enosara on 1/29/20.
//  Copyright © 2020 codepath. All rights reserved.
//
//
//
//
// REQUEST - https://www.tumblr.com/oembed
// FULL REQUEST - https://www.tumblr.com/oembed/?format=json&url=http%3A//www.flickr.com/photos/bees/2341623661/
//  supports tumblr post in the format of https://*.tumblr.com/post/*
//
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Photo cells being initialized !
    @IBOutlet weak var PhotoCell1: UIView!
    @IBOutlet weak var PhotoCell2: UIView!
    @IBOutlet weak var PhotoCell3: UIView!
    @IBOutlet weak var PhotoCell4: UIView!
    @IBOutlet weak var PhotoCell5: UIView!
    @IBOutlet weak var PhotoCell6: UIView!
    @IBOutlet weak var PhotoCell: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "This is row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        
        // Configure YourCustomCell using the outlets that you've defined.
        
        return cell
    }
    
    var posts: [[String : Any]]?
    
    //TABLE VIEW OUTLET
    @IBOutlet weak var tableView: UITableView!
    
    // PHOTO VIEW CONTROLLER'S VIEW DID LOAD METHOD
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
            // TODO: Get the posts and store in posts property
                
                
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as? [[String: Any]]
            // TODO: Reload the table view
            }
        }
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}
