extension Error {

    public enum Code: Sendable, Equatable, Hashable {

        case posix(Int32)

        case win32(UInt32)
    }
}

extension Error.Code {

    @inlinable
    public var posix: Int32? {
        if case .posix(let v) = self { v } else { nil }
    }

    @inlinable
    public var win32: UInt32? {
        if case .win32(let v) = self { v } else { nil }
    }

    @inlinable
    public var isPosix: Bool {
        if case .posix = self { true } else { false }
    }

    @inlinable
    public var isWin32: Bool {
        if case .win32 = self { true } else { false }
    }
}
