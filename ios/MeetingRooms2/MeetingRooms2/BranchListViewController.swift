//
//  BranchListViewController.swift
//  MeetingRooms2
//
//  Created by cord7894 on 2017. 6. 26..
//  Copyright © 2017년 rhino. All rights reserved.
//
// 지점목록

import UIKit

class BranchListViewController: UITableViewController {

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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = dataCenter.branches.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BranchCell", for: indexPath)

        let branch = dataCenter.branches[indexPath.row]
        cell.textLabel?.text = branch.name

        return cell
    }
 

    @IBAction func locationTurnOn(_ sender: Any)
    {
        let locationAlert = UIAlertController(title: "위치 정보 요청", message: "위치 정보를 기반으로 가까운 지점을 자동으로 선택할 수 있습니다. 또는 지도앱에서 지점의 위치 정보를 제공해 드립니다. 선택하신 기능이 계속 제공되빈다. 환경설정에서 제공되는 기능을 변경할 수 있습니다.", preferredStyle: .actionSheet)
        let locationAction = UIAlertAction(title: "위치정보 켜기", style:.default, handler: {(action:UIAlertAction)->Void in print("위치정보 켜기 선택")})
        
        let openMapAction = UIAlertAction(title: "지도앱에서 열기", style:.default, handler: {(action:UIAlertAction)->Void in print("지도앱에서 열기 선택")})
        
        locationAlert.addAction(locationAction)
        locationAlert.addAction(openMapAction)
        
        self.present(locationAlert, animated: true, completion: nil)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServiceSegue" {
            if let destination = segue.destination as? ServiceListViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                destination.branch = dataCenter.branches[selectedIndex] as Branch
            }
        }
    }
 

}
