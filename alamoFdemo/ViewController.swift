//
//  ViewController.swift
//  alamoFdemo
//
//  Created by abdul ahad on 19/03/2019.
//  Copyright © 2019 abdul ahad. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblview: UITableView!
    
    var contactsArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://randomuser.me/api/?results=20").responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let innerdict = dict ["results"]{
                    print(result)
                    print(response)
                    self.contactsArray = innerdict as! [AnyObject]
                    self.tblview.reloadData()
                }
            }
        }
        
    
        // Do any additional setup after loading the view, typically from a nib.
//        Alamofire.request("https://api.androidhive.info/contacts/").responseJSON { response in
//            let result = response.result
//            if let dict = result.value as? Dictionary<String,AnyObject> {
//                if let innerdict = dict ["contacts"]{
//                    print(result)
//                    print(response)
//                    self.contactsArray = innerdict as! [AnyObject]
//                    self.tblview.reloadData()
//                }
//            }
//        }
        
      
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        let gender = contactsArray[indexPath.row]["gender"]
        cell?.lblgender.text = gender as? String
        if let dict = contactsArray[indexPath.row] as? [String:AnyObject] {
            if let picture = dict["picture"] as? [String:AnyObject] {
                if let imageString = picture["large"] as? String {
                    Alamofire.request(imageString).responseImage(completionHandler: { (response) in
                        print(response)
                        if let picture = response.result.value {
                            let size = CGSize(width: 64, height: 64)
                            let imageround = picture.af_imageRounded(withCornerRadius: 100.0)
                            let imageCircle = picture.af_imageRoundedIntoCircle()
                            DispatchQueue.main.async {
                                cell?.imgView.image = imageCircle
                            }
                        }
                    })
                }
            }
        }
        
        if let dict = contactsArray[indexPath.row] as? [String:AnyObject] {
            if let name = dict["name"] as? [String:AnyObject] {
                if let nameStr = name["first"] as? String {
                    cell?.lblname.text = nameStr as? String
                }
            }
   }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
}



