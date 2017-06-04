@_exported import Vapor

extension Droplet {
    public func setup() throws {
        let controller = MithaiController(self)
        try collection(controller)
    }
}
