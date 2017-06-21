//
//  MeetingRoomListViewController.swift
//  MeetingRooms
//
//  Created by cord7894 on 2017. 6. 21..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class MeetingRoomListViewController: UITableViewController {

    var meetingRooms:[String:[String:Int]] = ["Meeting":["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10],"Seminar":["Cezanne":20, "Matisse":30, "Renoir":40]]
    
    func meetingRommsAtIndex(index:Int) -> (key:String,value:[String:Int]) {
        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        return orderedMeetingRomms[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meetingRooms.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
//        let categoryValues = Array(meetingRooms.values)[section]
//        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
        
        
//        let rowCount = orderedMeetingRomms[section].1.count
        let rowCount = meetingRommsAtIndex(index: section).value.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

//        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
//        let categoryValue = Array(meetingRooms.values)[indexPath.section]
//        let categoryValue = orderedMeetingRomms[indexPath.section].1
        
        let categoryValue = meetingRommsAtIndex(index: indexPath.section).value
        
        //        let orderedCategoryValue = categoryValue.sorted(by: {$0.0.value < $0.1.value})
        //        let orderedCategoryValue = categoryValue.sorted(by: { $0.value < $1.value})
        
        let orderedCategoryValue = categoryValue.sorted(by: {$0.value < $1.value})
        
        let roomName = orderedCategoryValue[indexPath.row].0
        
        let capacity = orderedCategoryValue[indexPath.row].1
        
        cell.textLabel?.text = roomName
        cell.detailTextLabel?.text = "\(capacity)"
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})

//        return orderedMeetingRomms[section].key
        
        return meetingRommsAtIndex(index: section).key
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
//        let orderedMeetingRomms = meetingRooms.sorted(by: {$0.1.first!.1 < $1.1.first!.1})
//
//        let rowCount = orderedMeetingRomms[section].value.count
        
        let rowCount = meetingRommsAtIndex(index: section).value.count
        return "\(rowCount) rooms"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
