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
}
