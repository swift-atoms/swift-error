import Error
import Error_Standard_Library_Integration
import Testing

@Suite
struct `Error.Context CustomStringConvertible Tests` {

    @Test
    func `Context description`() {
        let context = Error.Context(
            operation: "write",
            function: "saveData()",
            file: .init(id: "Storage/Writer.swift"),
            line: 100
        )

        #expect(context.description == "write at saveData() (Storage/Writer.swift:100)")
    }
}
