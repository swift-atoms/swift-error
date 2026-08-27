import Error

extension Error.Context: CustomStringConvertible {

    public var description: Swift.String {
        "\(operation) at \(function) (\(file.id):\(line))"
    }
}
