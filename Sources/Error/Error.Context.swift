extension Error.Error {

    public struct Context: Sendable, Equatable, Hashable {

        public let operation: Swift.String

        public let function: Swift.String

        public let file: File

        public let line: UInt32

        @inlinable
        public init(
            operation: Swift.String,
            function: Swift.String,
            file: File,
            line: UInt32
        ) {
            self.operation = operation
            self.function = function
            self.file = file
            self.line = line
        }
    }
}
