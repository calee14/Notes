//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Cappillen on 7/5/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

struct CoreDataHelper {
    
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
        
        return note
    }
    
    static func saveNote() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteNote(_ note: Note) {
        context.delete(note)
        
        saveNote()
    }
    
    static func retrieveNotes() -> [Note] {
        // create a NSFetchRequest to retrieve all Person objects
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        let sort = NSSortDescriptor(key: #keyPath(Note.modificationTime), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        // use the NSManagedObjectContext to execute the NSFetchRequest
        do {
            let results = try context.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            return [Note]()
        }
        
    }
}
