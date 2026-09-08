import Error
import Testing

@Suite
struct `Error codes preserve platform identity value equality and descriptions` {
    @Suite struct `Error code predicates equality and descriptions distinguish cases and values` {}
    @Suite struct `No error code boundary cases are defined` {}
    @Suite struct `No error code integration cases are defined` {}
}

extension `Error codes preserve platform identity value equality and descriptions`.`Error code predicates equality and descriptions distinguish cases and values` {

    @Test
    func `POSIX error codes identify their platform case`() {
        let code = Error.Code.posix(2)
        #expect(code.isPosix)
        #expect(!code.isWin32)
    }

    @Test
    func `Win32 error codes identify their platform case`() {
        let code = Error.Code.win32(2)
        #expect(code.isWin32)
        #expect(!code.isPosix)
    }

    @Test
    func `Error code equality distinguishes numeric values and platforms`() {
        let a = Error.Code.posix(1)
        let b = Error.Code.posix(1)
        let c = Error.Code.posix(2)
        let d = Error.Code.win32(1)

        #expect(a == b)
        #expect(a != c)
        #expect(a != d)
    }

    @Test
    func `Error code descriptions include their platform and numeric value`() {
        let posix = Error.Code.posix(13)
        let win32 = Error.Code.win32(5)

        #expect(posix.description == "posix(13)")
        #expect(win32.description == "win32(5)")
    }
}
