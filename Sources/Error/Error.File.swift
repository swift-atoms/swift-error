extension Error::Error {

    public struct File: Sendable, Equatable, Hashable {

        public let id: Swift.String

        @inlinable
        public init(id: Swift.String) {
            self.id = id
        }
    }
}

extension Error::Error.File {

    @inlinable
    public init(id: StaticString) {
        self.init(id: Swift.String(describing: id))
    }
}
