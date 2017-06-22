//
//  BranchListViewContoller.swift
//  MeetingRooms
//
//  Created by cord7894 on 2017. 6. 22..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class BranchListViewContoller: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationController?.isToolbarHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    @IBAction func locationTurnOn(_ sender: Any) {
        let locationAlert = UIAlertController(title: "위치 저보 요청", message: "설명, 안내문구", preferredStyle: .actionSheet)
        let locationAction = UIAlertAction(title: "위치정보 켜기", style: .default, handler: {(action:UIAlertAction)-> Void in
            print("위치정보 켜기")
        })
        let openMapAction = UIAlertAction(title: "지도앱에서 열기", style: .default, handler: {(action:UIAlertAction)-> Void in
            print("지도앱에서 열기 선택")
        })
        
        locationAlert.addAction(locationAction)
        locationAlert.addAction(openMapAction)
        
        self.present(locationAlert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let rowCount = dataCenter.branches.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath)

        let branch = dataCenter.branches[indexPath.row]
        cell.textLabel?.text = branch.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ServiceSegue"
        {
            if let destination = segue.destination as? ServiceListViewController,
                let selectedIndex = self.tableView.indexPathForSelectedRow?.row
                {
                    destination.branch = dataCenter.branches[selectedIndex] as Branch
                }
        }
    }

}
