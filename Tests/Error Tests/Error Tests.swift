import Error
import Testing

@Suite
struct `Errors capture their call site and describe themselves` {

    @Test
    func `capturing records the operation, calling function and line`() {
        let line: UInt32 = #line + 1
        let error = Error.capturing(.posix(2), operation: "open")
        #expect(error.code == .posix(2))
        #expect(error.context?.operation == "open")
        #expect(error.context?.function == "capturing records the operation, calling function and line()")
        #expect(error.context?.line == line)
    }

    @Test
    func `an error without context describes only its code`() {
        #expect(Error(code: .win32(5)).description == "win32(5)")
    }

    @Test
    func `an error with context describes operation, code and location`() {
        let error = Error(
            code: .posix(13),
            context: .init(operation: "read", function: "load()", file: .init(id: "Module/File.swift"), line: 42)
        )
        #expect(error.description == "read: posix(13) at load() (Module/File.swift:42)")
    }

    @Test
    func `extreme code values keep their platform and value`() {
        #expect(Error.Code.posix(.min).posix == .min)
        #expect(Error.Code.posix(.max).win32 == nil)
        #expect(Error.Code.win32(.max).win32 == .max)
        #expect(Error.Code.win32(0) != Error.Code.posix(0))
    }

    @Test
    func `errors with the same code but different context are distinct`() {
        let a = Error(code: .posix(1))
        let b = Error.capturing(.posix(1), operation: "close")
        #expect(a != b)
        #expect(a == Error(code: .posix(1)))
    }
}
