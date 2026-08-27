import Error
import Testing

@Suite
struct `Error.Context Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Error.Context Tests`.Unit {

    @Test
    func `Context storage`() {
        let context = Error.Context(
            operation: "open",
            function: "readFile()",
            file: .init(id: "MyModule/File.swift"),
            line: 42
        )

        #expect(context.operation == "open")
        #expect(context.function == "readFile()")
        #expect(context.file.id == "MyModule/File.swift")
        #expect(context.line == 42)
    }
}
