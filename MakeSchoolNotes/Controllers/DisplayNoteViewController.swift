//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let note = note {
            titleTextField.text = note.title
            contentTextField.text = note.content
        } else {
            titleTextField.text = ""
            contentTextField.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? ListNotesTableViewController
            else { return }
        
        switch identifier {
        case "save" where note != nil:
            note?.title = titleTextField.text ?? ""
            note?.content = contentTextField.text ?? ""
            
            destination.tableView.reloadData()
        case "save" where note == nil:
            let note = Note()
            
            note.title = titleTextField.text ?? ""
            note.content = contentTextField.text ?? ""
            note.modificationTime = Date()
            
            destination.notes.append(note)
        case "cancel":
            print("cancel bar button tapped")
        default:
            print("unexpected segue identifier")
        }
    }
    
}
