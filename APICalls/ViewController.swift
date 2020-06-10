//
//  ViewController.swift
//  APICalls
//
//  Created by VijayNew on 09/06/20.
//  Copyright © 2020 VijayNew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var inputTF: UITextField!
    
   
    var user:NewUser?
    var users:[NewUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let viewModel = ViewModel()

    @IBAction func fetchUserDetails(_ sender: Any) {
        viewModel.getUsersDetails(pageID: Int(inputTF.text!)!) { (fetchedUserDetails) in
            print("Fetching the information: \(fetchedUserDetails)")
            self.users = fetchedUserDetails
      
        }
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")
        
        let singleUser = users[indexPath.row]
        cell?.textLabel?.text = singleUser.first_name
        cell?.detailTextLabel?.text = singleUser.last_name
        
        if let imageString = singleUser.avatar, let url = URL(string: imageString) {
            cell?.imageView?.image = UIImage(data: try! Data(contentsOf: url))
        }
        
        return cell ?? UITableViewCell()
    }
}






/*

 @IBAction func fetchUserDetails(_ sender: Any) {
     viewModel.getUserDetails(userID: Int(inputTF.text!)!) { (fetchedUserDetails) in
         print("Fetching the information: \(fetchedUserDetails)")
         self.user = fetchedUserDetails.data
         print(fetchedUserDetails.data?.email ?? "")
     }
     DispatchQueue.main.async {
         self.usersTableView.reloadData()
     }
     
 }

 */




/*
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")
     
     cell?.textLabel?.text = user?.first_name
     cell?.detailTextLabel?.text = user?.last_name
     
     if let imageString = user?.avatar, let url = URL(string: imageString) {
         cell?.imageView?.image = UIImage(data: try! Data(contentsOf: url))
     }
     
     return cell ?? UITableViewCell()
 }
 */
