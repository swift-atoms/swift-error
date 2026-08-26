public struct Error: Swift.Error, Sendable, Equatable, Hashable {

    public let code: Code

    public let context: Context?

    @inlinable
    public init(code: Code, context: Context? = nil) {
        self.code = code
        self.context = context
    }
}

extension Error.Error {

    @inlinable
    public static func capturing(
        _ code: Code,
        operation: StaticString,
        function: StaticString = #function,
        file: File = File(id: #fileID),
        line: UInt32 = #line
    ) -> Self {
        Self(
            code: code,
            context: Context(
                operation: Swift.String(describing: operation),
                function: Swift.String(describing: function),
                file: file,
                line: line
            )
        )
    }
}

extension Error.Error: CustomStringConvertible {

    public var description: Swift.String {
        if let context {
            return
                "\(context.operation): \(code) at \(context.function) (\(context.file.id):\(context.line))"
        }
        return "\(code)"
    }
}
