//
//  Movie+Convenience.swift
//  MyMovies
//
//  Created by Enrique Gongora on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Movie {
    var movieRepresentation: MovieRepresentation? {
        guard let title = title else { return nil }
        
        if identifier == nil {
            identifier = UUID()
        }
        
        return MovieRepresentation(title: title, identifier: identifier, hasWatched: hasWatched)
    }
    
    @discardableResult
    convenience init(title: String,
                     identifier: UUID = UUID(),
                     hasWatched: Bool = false,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.identifier = identifier
        self.hasWatched = hasWatched
    }
    
    @discardableResult
    convenience init?(movieRepresentation: MovieRepresentation,
                      context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        let identifier = movieRepresentation.identifier ?? UUID()
        let hasWatched = movieRepresentation.hasWatched ?? false
        
        self.init(title: movieRepresentation.title,
                  identifier: identifier,
                  hasWatched: hasWatched,
                  context: context)
    }
}
