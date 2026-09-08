import Error
import Testing

@Suite
struct `Error contexts preserve operation and source location details` {
    @Suite struct `Error context storage and descriptions retain every supplied field` {}
    @Suite struct `No error context boundary cases are defined` {}
    @Suite struct `No error context integration cases are defined` {}
}

extension `Error contexts preserve operation and source location details`.`Error context storage and descriptions retain every supplied field` {

    @Test
    func `Error contexts retain the supplied operation function file and line`() {
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

    @Test
    func `Error context descriptions combine the operation and source location`() {
        let context = Error.Context(
            operation: "write",
            function: "saveData()",
            file: .init(id: "Storage/Writer.swift"),
            line: 100
        )

        #expect(context.description == "write at saveData() (Storage/Writer.swift:100)")
    }
}
