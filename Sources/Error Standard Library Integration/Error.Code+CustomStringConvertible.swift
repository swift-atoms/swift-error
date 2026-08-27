import Error

extension Error.Code: CustomStringConvertible {

    public var description: Swift.String {
        switch self {
        case .posix(let code):
            return "posix(\(code))"

        case .win32(let code):
            return "win32(\(code))"
        }
    }
}
