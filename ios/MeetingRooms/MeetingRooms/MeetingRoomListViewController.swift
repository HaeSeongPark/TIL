//
//  MeetingRoomListViewController.swift
//  MeetingRooms
//
//  Created by cord7894 on 2017. 6. 21..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {

    var service:Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = service?.name
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        let categoryValues = Array(meetingRooms.values)[section]
//        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        
        
//        let rowCount = orderedMeetingRomms[section].1.count
        guard let rowCount = service?.items?.count else {
            return 0
        }
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        guard let mettingRoom = service?.items?[indexPath.row] else {
            return cell
        }
        
        cell.textLabel?.text = mettingRoom.name
        cell.detailTextLabel?.text = String(mettingRoom.capacity)
        
        return cell
    }
 
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
////        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
//
////        return orderedMeetingRomms[section].key
//        
//        return meetingRommsAtIndex(index: section).key
//    }
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        
////        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
////
////        let rowCount = orderedMeetingRomms[section].value.count
//        
//        let rowCount = meetingRommsAtIndex(index: section).value.count
//        return "\(rowCount) rooms"
//    }
    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ReservationSegue" {
            guard let destination = segue.destination as? ReservationViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row, let meetingRoom = service?.items?[selectedIndex] else {
                return
            }
            destination.meetingRoom = meetingRoom
        }
    }
 

}
