//
//  ListTVC.swift
//  LoginPage
//
//  Created by Ashot on 10/22/18.
//  Copyright © 2018 Ashot. All rights reserved.
//

import UIKit

class ListTVC: UITableViewController {

    @IBOutlet weak var btnCount: UIBarButtonItem!
    var notesList: [[String]] = []
    var editNoteId: Int?
    var editNote: String?
    var dateTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let standardUD = UserDefaults.standard
        notesList = standardUD.array(forKey: "notes") as? [[String]] ?? []
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        btnCount.title = String(notesList.count)
        return notesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellNote", for: indexPath)
        cell.textLabel?.text = notesList[indexPath.row][0]
        cell.detailTextLabel?.text = notesList[indexPath.row][1]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editNoteId = indexPath.row
        editNote = notesList[editNoteId!][0]
        dateTitle = notesList[editNoteId!][1]
        performSegue(withIdentifier: "SegueNote", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            notesList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            let standardUD = UserDefaults.standard
            standardUD.set(notesList, forKey: "notes")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueNote" || segue.identifier == "SegueNewNote" {
            let dest: NoteVC = segue.destination as! NoteVC
            dest.listTvc = self
            if segue.identifier == "SegueNote" {
                dest.dateTitle = dateTitle
                dest.editNote = editNote
                dest.editNoteId = editNoteId
            } else {
                dest.editNoteId = -1
            }
        }
    }

}
