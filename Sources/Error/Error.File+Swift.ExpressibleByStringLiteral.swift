extension Error::Error.File: Swift.ExpressibleByStringLiteral {

    @inlinable
    public init(stringLiteral value: Swift.String) {
        self.init(id: value)
    }
}
