//
//  ReserveRoomViewController.swift
//  MeetingRooms
//
//  Created by cord7894 on 2017. 6. 22..
//  Copyright © 2017년 rhino. All rights reserved.
//

import UIKit

class ReserveRoomViewController: UITableViewController {

    @IBOutlet weak var hostNameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var attendeesField: UITextField!
    @IBOutlet weak var equipmentField: UITextField!
    @IBOutlet weak var cateringSwitch: UISwitch!
    
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
    
    @IBAction func cancelReservation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func newReservation() -> Reservation? {
        let reservation = Reservation()
        let host = hostNameField.text!
        if host.isEmpty { return nil }
        reservation.hostName = host
        reservation.date = datePicker.date as NSDate
        if let equipmentArray = equipmentField.text?.characters.split(separator: ",").map(String.init) {
            reservation.equipments = equipmentArray
        }
        reservation.catering = cateringSwitch.isOn
        return reservation
    }

    @IBAction func makeReservation(_ sender: Any) {
        guard let reservation = newReservation() else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        switch self.presentingViewController {
        case let tabBarC as UITabBarController :
            if let navigationC = tabBarC.selectedViewController as? UINavigationController, let reservationListVC = navigationC.topViewController as? ReservationViewController {
                reservationListVC.addNewItem(reservation: reservation)
            }
        case let navigationC as UINavigationController:
            if let reservationListVC = navigationC.topViewController as? ReservationViewController {
                reservationListVC.addNewItem(reservation: reservation)
            }
        case let reservationListVC as ReservationViewController:
                reservationListVC.addNewItem(reservation: reservation)
        default:
            break;
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        if segue.identifier == "ReserveDone"
        {
            guard let reservation = newReservation(), let reservationListVC = segue.destination as? ReservationViewController else {
                return
            }
            reservationListVC.addNewItem(reservation: reservation)
        }
    }
 

}
