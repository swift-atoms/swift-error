import Error

extension Error.Error: CustomStringConvertible {

    public var description: Swift.String {
        if let context {
            return
                "\(context.operation): \(code) at \(context.function) (\(context.file.id):\(context.line))"
        }
        return "\(code)"
    }
}
