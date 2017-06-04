//
//  MithaiModel.swift
//  meetupDemo
//
//  Created by Ishaan Sejwal on 02/06/17.
//
//

import Vapor
import Node

struct MithaiModel {
    
    var name: String,
    location: String,
    date: String,
    experience: String
    
    init(name: String,
         location: String?,
        date: String?,
        experience: String?
    ) {
        self.name = name
        self.location = location ?? ""
        self.date = date ?? ""
        self.experience = experience ?? ""
    }
    
    init(body: Content) {
        self.init(
            name: body["name"]?.string ?? "",
            location: body["location"]?.string,
            date: body["date"]?.string,
            experience: body["experience"]?.string)
    }
    
}

extension MithaiModel: NodeRepresentable {
    func makeNode(in context: Context?) throws -> Node {
        var node = Node(context)
        try node.set("name", name)
        try node.set("location", location)
        try node.set("date", date)
        try node.set("experience", experience)
        return node
    }
}
