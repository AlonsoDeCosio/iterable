//
//  ViewController.swift
//  test
//
//  Created by de Cosio, Alonso on 5/10/21.
//

import UIKit
import IterableSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func updateProfile(_ sender: Any) {
        
        let dataField : [String: Any] = [
            "firstName": "Alonso",
            "isRegisteredUser": true,
            "SA_User_Test_Key": "completed"
            ]
        IterableAPI.updateUser(dataField, mergeNestedObjects: false, onSuccess: myUserUpdateSuccessHandler, onFailure: myUserUpdateFailureHandler)
        
    }
    
    @IBAction func eventAction(_ sender: Any) {
        
        let dataField : [String: Any] = [
            "platform": "iOS",
            "isTestEvent": true,
            "url": "https://iterable.com/sa-test/alonso",
            "secret_code_key": "Code_123"
            ]
        print(dataField)
        
        IterableAPI.track(event: "mobileSATestEvent", dataFields: dataField, onSuccess: myUserUpdateSuccessHandler, onFailure: myUserUpdateFailureHandler)
    }
    
    @IBAction func openInbox(_ sender: Any) {
        let viewController = IterableInboxNavigationViewController()
        present(viewController, animated: true)
    }
    
    
    func myUserUpdateSuccessHandler(data:[AnyHashable:Any]?) -> () {
        // success
        print("sent to Iterable success")
    }

    func myUserUpdateFailureHandler(reason:String?, data:Data?) -> () {
        // failure
        print("sent to Iterable failure")
    }
    

}

