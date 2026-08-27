import Error
import Error_Standard_Library_Integration
import Testing

@Suite
struct `Error.Code CustomStringConvertible Tests` {

    @Test
    func `Code description`() {
        let posix = Error.Code.posix(13)
        let win32 = Error.Code.win32(5)

        #expect(posix.description == "posix(13)")
        #expect(win32.description == "win32(5)")
    }
}
