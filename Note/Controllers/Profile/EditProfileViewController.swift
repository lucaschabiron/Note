//
//  EditProfileViewController.swift
//  Note
//
//  Created by Lucas Chabiron on 06/01/2024.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var profilePictureField: UITextField!
    var prevData: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = prevData{
            usernameField.text = data.userName
            profilePictureField.text = data.profilePictureURL
            
        }
        
        
        
    }
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender as? UIBarButtonItem != saveButton { return }
        
        let username = usernameField.text ?? ""
        let profilePictureURL = profilePictureField.text ?? ""
        addUserProfile(userName: username, profilePictureURL: profilePictureURL)
        
        if let vc = segue.destination as? ProfileViewController{
            vc.user = User(id: 0, userName: username, profilePictureURL: profilePictureURL)
        }
        
    }
    
    

}
