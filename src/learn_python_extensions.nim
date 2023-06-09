# external
import
  nimpy

proc fibonacci*(num: uint32): uint64 {.exportpy.} =
    if num <= 0:
        return 0'u64

    if num == 1:
        return 1'u64

    var fibonacci = @[0'u64,1'u64]
    for i in 2..num:
        try:
            let sum = fibonacci[i - 1] + fibonacci[i - 2]
            fibonacci.add(sum)

        except Exception as ex:
            echo ex.getStackTrace()
            return 0'u64

    return fibonacci[^1]

proc square*(num: uint32): uint64 {.exportpy.} =
    return num * num