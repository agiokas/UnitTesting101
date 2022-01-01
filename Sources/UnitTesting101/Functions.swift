public func addInt(_ a: Int, _ b: Int) throws -> Int {
    let result = a.addingReportingOverflow(b)
    if result.overflow {
        throw AddError.overflow
    }
    return result.partialValue
}

enum AddError: Error {
    case overflow
}
