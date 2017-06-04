//
//  MithaiController.swift
//  meetupDemo
//
//  Created by Ishaan Sejwal on 28/05/17.
//
//

import Vapor
import HTTP
import FormData
import JSON

final class MithaiController: RouteCollection {
    
    let drop: Droplet
    
    var entries: [MithaiModel] = []
    var homePageData: [String: Any] {
        return [
            "title": "My \u{092e}\u{093f}\u{0920}\u{093e}\u{0908} adventure!",
            "entries": entries
        ]
    }
    
    init(_ drop: Droplet) {
        self.drop = drop
    }
    
    func homePageResponse(_ request: Request) throws -> ResponseRepresentable {
        return try drop.view.make("main", homePageData)
    }
    
    func saveNewEntry(_ request: Request) throws -> ResponseRepresentable {
        entries.append(MithaiModel.init(body: request.data))
        return try homePageResponse(request)
    }
    
    func build(_ builder: RouteBuilder) throws {
        builder.get(handler: homePageResponse)
        builder.post("save-new-entry", handler: saveNewEntry)
    }
}
