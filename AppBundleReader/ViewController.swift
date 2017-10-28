//
//  ViewController.swift
//  AppBundleReader
//
//  Created by Eliel A. Gordon on 10/26/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var robots = [Robot]()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let path = Bundle.main.path(forResource: "robo-profiles", ofType: ".json")
        let path = Bundle.main.url(forResource: "robo-profiles", withExtension: ".json")!
        
        let data = try? Data(contentsOf: path)
        if let data = data {
            let robots = try? JSONDecoder().decode([Robot].self, from: data)
            
            self.robots = robots!
        }
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "RobotCell", for: indexPath) as! RobotCell
        
        let robot = robots[indexPath.row]
        
        cell.configureCell(robot: robot)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let post = robots[indexPath.row]
//
//        performSegue(withIdentifier: "ViewComments", sender: post)
//    }
}

extension ViewController: UITableViewDelegate {
    
}




