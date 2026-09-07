extension Error.Context: Swift.CustomStringConvertible {

    public var description: Swift.String {
        "\(operation) at \(function) (\(file.id):\(line))"
    }
}
