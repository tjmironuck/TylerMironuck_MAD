//
//  SecondVC.swift
//  Yahtzee
//
//  Created by Tyler MIRONUCK on 11/26/17.
//  Copyright © 2017 Gabriel Chapel. All rights reserved.
//

import UIKit

class SecondVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var intArrayPassed:[Int] = []
    
    
    private let howToScore = [
        "Total 1's", "Total 2's", "Total 3's", "Total 4's", "Total 5's", "Total 6's", "Score 35", "Total Dice", "Total Dice", "Score 25", "Score 30", "Score 40", "Score 50", "Total Dice", "100 Each" ," "
    ]
    
    private let logoImage: [UIImage] = [
        UIImage(named: "ace.png")!,
        UIImage(named: "two.png")!,
        UIImage(named: "three.png")!,
        UIImage(named: "four.png")!,
        UIImage(named: "five.png")!,
        UIImage(named: "six.png")!,
        UIImage(named: "bonus.png")!,
        UIImage(named: "3ofKind.png")!,
        UIImage(named: "4ofKind.png")!,
        UIImage(named: "fullHouse.png")!,
        UIImage(named: "smStraight.png")!,
        UIImage(named: "lgStraight.png")!,
        UIImage(named: "yahtzee.png")!,
        UIImage(named: "chance.png")!,
        UIImage(named: "yahtzeeBonus.png")!,
        UIImage(named: "grandTotal.png")!,
        
        ]
    
    //private var score: [Int] = [3, 10, 12, 12, 15, 24, 35, 22, 17, 25, 30, 40, 50, 22, 100, 417]
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return howToScore.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: simpleTableIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.value1,
                reuseIdentifier: simpleTableIdentifier)
        }
        
        //let image = UIImage(named: "ace")
        let image = logoImage[indexPath.row]
        cell?.imageView?.image = image
        
        cell?.detailTextLabel?.text = String(intArrayPassed[indexPath.row])
        if indexPath.row == 15 {
            cell?.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        }
        cell?.textLabel?.text = howToScore[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 41
    }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        /*
         if indexPath.row < 6 {
         return 5
         }
         */
        if indexPath.row == 15 {
            return 0
        }
        return 3
    }
    
}
