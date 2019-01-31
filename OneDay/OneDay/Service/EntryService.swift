//
//  EntryService.swift
//  OneDay
//
//  Created by juhee on 25/01/2019.
//  Copyright © 2019 teamA2. All rights reserved.
//

import CoreData
import UIKit

final class EntryService : CoreDataService {
    public func entry(_ title: String, contents: NSAttributedString) -> Entry {
        let entry = Entry(context: managedObjectContext)
        let today: Date = Date()
        entry.updatedDate = today
        entry.date = today
        entry.entryId = UUID()
        entry.contents = contents
        entry.title = title
        coreDataStack.saveContext()
        return entry
    }
    
    public func entries(from journalIndex: Int16) -> [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Entry.journal.index), journalIndex])
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Entry.date), ascending: false)]
        
        do {
            return try managedObjectContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    public func entries(from journalIndex: Int16, date : Date) -> [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Entry.date), date])
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Entry.date), ascending: false)]
        
        do {
            return try managedObjectContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    public func entry(_ entryId: UUID) -> Entry? {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K = %@", argumentArray: [#keyPath(Entry.entryId), entryId])
        let results: [Entry]?
        do {
            results = try managedObjectContext.fetch(fetchRequest)
        } catch {
            return nil
        }
        return results?.first
    }
    
    public func entry(remove entryId: UUID) {
        guard let entry = entry(entryId) else { return }
        managedObjectContext.delete(entry)
        coreDataStack.saveContext()
    }
}