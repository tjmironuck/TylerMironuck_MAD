//
//  MasterViewController.swift
//  nflrapsheet
//
//  Created by Tyler MIRONUCK on 3/4/18.
//  Copyright © 2018 Tyler MIRONUCK. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var records = [Record]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadjson()
    }

    func loadjson(){
        let urlPath = "http://NflArrest.com/api/v1/team"
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
        }
        
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
            }
            //download successful
            print("download complete")
            
            //************************parsing section**************************
            //guard let data = data else {return}
            //let allrecords = String(data: data, encoding: .utf8)
            //print(allrecords)
 
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }


    func parsejson(_ data: Data){
        //print(data)
        do {
            // get json data
            self.records = try JSONDecoder().decode([Record].self, from: data)
            
            //print(records.count)
            //print(records[0])
        
        }   //handle thrown error
        catch {
            print("Error with JSON: \(error)")
            return
        }
        //reload the table data after the json data has been downloaded
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let record = records[indexPath.row]
                let teamName = record.Team_preffered_name
                let teamCity = record.Team_city
                 print(teamCity)
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                //controller.detailItem = teamCity
                
                switch teamName {
                case "Denver Broncos":
                    controller.detailItem = "http://www.nflarrest.com/team/DEN/"
                case "Minnesota Vikings":
                    controller.detailItem = "http://www.nflarrest.com/team/MIN/"
                case "Cincinnati Bengals":
                    controller.detailItem = "http://www.nflarrest.com/team/CIN/"
                case "Tampa Bay Buccaneers":
                    controller.detailItem = "http://www.nflarrest.com/team/TB/"
                case "Jacksonville Jaguars":
                    controller.detailItem = "http://www.nflarrest.com/team/JAC/"
                case "Tennessee Titans":
                    controller.detailItem = "http://www.nflarrest.com/team/TEN/"
                case "Indianapolis Colts":
                    controller.detailItem = "http://www.nflarrest.com/team/IND/"
                case "Kansas City Chiefs":
                    controller.detailItem = "http://www.nflarrest.com/team/KC/"
                case "Cleveland Browns":
                    controller.detailItem = "http://www.nflarrest.com/team/CLE/"
                case "Chicago Bears":
                    controller.detailItem = "http://www.nflarrest.com/team/CHI/"
                case "Miami Dolphins":
                    controller.detailItem = "http://www.nflarrest.com/team/MIA/"
                case "Seattle Seahawks":
                    controller.detailItem = "http://www.nflarrest.com/team/SEA/"
                case "Baltimore Ravens":
                    controller.detailItem = "http://www.nflarrest.com/team/BAL/"
                case "Los Angeles Chargers":
                    controller.detailItem = "http://www.nflarrest.com/team/LAC/"
                case "San Francisco 49ers":
                    controller.detailItem = "http://www.nflarrest.com/team/SF/"
                case "New Orleans Saints":
                    controller.detailItem = "http://www.nflarrest.com/team/NO/"
                case "Pittsburgh Steelers":
                    controller.detailItem = "http://www.nflarrest.com/team/PIT/"
                case "Green Bay Packers":
                    controller.detailItem = "http://www.nflarrest.com/team/GB/"
                case "New York Jets":
                    controller.detailItem = "http://www.nflarrest.com/team/NYJ/"
                case "Arizona Cardinals":
                    controller.detailItem = "http://www.nflarrest.com/team/ARI/"
                case "Washington Redskins":
                    controller.detailItem = "http://www.nflarrest.com/team/WAS/"
                case "Oakland Raiders":
                    controller.detailItem = "http://www.nflarrest.com/team/OAK/"
                case "Carolina Panthers":
                    controller.detailItem = "http://www.nflarrest.com/team/CAR/"
                case "Atlanta Falcons":
                    controller.detailItem = "http://www.nflarrest.com/team/ATL/"
                case "New England Patriots":
                    controller.detailItem = "http://www.nflarrest.com/team/NE/"
                case "Buffalo Bills":
                    controller.detailItem = "http://www.nflarrest.com/team/BUF/"
                case "New York Giants":
                    controller.detailItem = "http://www.nflarrest.com/team/NYG/"
                case "Dallas Cowboys":
                    controller.detailItem = "http://www.nflarrest.com/team/DAL/"
                case "Detroit Lions":
                    controller.detailItem = "http://www.nflarrest.com/team/DET/"
                case "Los Angeles Rams":
                    controller.detailItem = "http://www.nflarrest.com/team/LA/"
                case "Philadelphia Eagles":
                    controller.detailItem = "http://www.nflarrest.com/team/PHI/"
                case "Houston Texans":
                    controller.detailItem = "http://www.nflarrest.com/team/HOU/"
                default:
                    controller.detailItem = "http://www.denverbroncos.com"
                }
                //controller.title = title
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let record = records[indexPath.row]
        cell.textLabel!.text = record.Team_preffered_name
        cell.detailTextLabel!.text = record.arrest_count + " arrests"
        return cell
    }

/*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
*/

}

