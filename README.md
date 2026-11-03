# swift-error

Use this package when a platform call fails and you need to throw that failure as a value: the raw POSIX or Win32 error number, optionally with the operation that failed and where it was called from. Start from `Error`, building it with `Error.capturing` at the failing call site, or with `Error(code:)` when no location is wanted; the number itself is an `Error.Code`.

## Laws

- `Error.Code` carries the platform's number unchanged. No mapping or normalisation happens between platforms, and a POSIX code and a Win32 code with the same number are different codes.
- Equality and hashing of `Error` include its `Error.Context`. The same code raised from two call sites, or once with context and once without, gives two unequal errors. Compare `code` to ask whether two failures are the same failure.
- `Error.capturing` records the location of its immediate caller: the `#fileID` form of the file as an `Error.File` (`Storage/Writer.swift`), the function as Swift spells it (`load()`), and the line. A helper that calls `Error.capturing` records the helper's location, not its caller's. An explicit `file:` or `line:` replaces the captured one.
- Descriptions have fixed shapes: a code reads `posix(13)` or `win32(5)`; a context reads `write at saveData() (Storage/Writer.swift:100)`; an error with context reads `read: posix(13) at load() (Storage/Writer.swift:42)`, and an error without context reads as its code alone.
