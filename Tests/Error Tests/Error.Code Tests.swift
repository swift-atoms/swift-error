import Error
import Testing

@Suite
struct `Error.Code Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Error.Code Tests`.Unit {

    @Test
    func `POSIX code storage`() {
        let code = Error.Code.posix(2)
        #expect(code.isPosix)
        #expect(!code.isWin32)
    }

    @Test
    func `Win32 code storage`() {
        let code = Error.Code.win32(2)
        #expect(code.isWin32)
        #expect(!code.isPosix)
    }

    @Test
    func `Code equality`() {
        let a = Error.Code.posix(1)
        let b = Error.Code.posix(1)
        let c = Error.Code.posix(2)
        let d = Error.Code.win32(1)

        #expect(a == b)
        #expect(a != c)
        #expect(a != d)
    }

    @Test
    func `Code description`() {
        let posix = Error.Code.posix(13)
        let win32 = Error.Code.win32(5)

        #expect(posix.description == "posix(13)")
        #expect(win32.description == "win32(5)")
    }
}
