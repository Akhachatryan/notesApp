//
//  NoteVC.swift
//  LoginPage
//
//  Created by Ashot on 10/22/18.
//  Copyright © 2018 Ashot. All rights reserved.
//

import UIKit

class NoteVC: UIViewController {

    var editNoteId: Int?
    var editNote: String?
    var dateTitle: String?
    var table: UITableView?
    var listTvc: ListTVC?
    @IBOutlet weak var txtNote: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = dateTitle
        txtNote.text = editNote
        
        if editNoteId == -1 {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss"
            title = dateFormatter.string(from: date)
            txtNote.text = ""
            txtNote.becomeFirstResponder()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let textAvailable: Bool = txtNote.text != nil && txtNote.text != ""
        
        if editNoteId == -1 {
            if textAvailable {
                listTvc!.notesList.append([txtNote.text, title!])
            }
        } else {
            if textAvailable {
                listTvc!.notesList[editNoteId!] = [txtNote.text, title!]
            } else {
                listTvc!.notesList.remove(at: editNoteId!)
            }
        }
        
        listTvc?.tableView.reloadData()
        let standardUD = UserDefaults.standard
        standardUD.set(listTvc?.notesList, forKey: "notes")
        super.viewWillDisappear(animated)
    }

    
    @IBAction func btnShareAcion(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: [txtNote.text], applicationActivities: [])
        present(vc, animated: true)
    }
    
    @IBAction func noteDeleteAction(_ sender: Any) {
        let alert = UIAlertController(title: "My Alert", message: "Do you want delete this note", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Delete", comment: "Default action"), style: .default, handler: { _ in
            self.txtNote.text = ""
            _ = self.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
