const std = @import("std");
const fs = std.fs;

const nums = [_][]const u8{ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const stdout = std.io.getStdOut().writer();
    _ = stdout;

    const file = try fs.cwd().openFile("../../inputs/2023/in1", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});
    defer file.close();

    var line = std.ArrayList(u8).init(alloc);
    defer line.deinit();

    var p1buf = std.ArrayList(u8).init(alloc);
    defer p1buf.deinit();
    var p2buf = std.ArrayList(u8).init(alloc);
    defer p2buf.deinit();

    var p1: i64 = 0;
    var p2: i64 = 0;

    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        while (line.items.len > 0) {
            const c = line.items[0];
            if (std.ascii.isDigit(c)) {
                const x = line.orderedRemove(0) - 48;
                try p1buf.append(@intCast(x));
                try p2buf.append(@intCast(x));
            } else {
                for (nums, 1..) |n, i| {
                    if (std.mem.startsWith(u8, line.items, n)) {
                        try p2buf.append(@intCast(i));
                        try line.replaceRange(0, n.len - 1, "");
                        break;
                    }
                } else {
                    // junk char
                    _ = line.orderedRemove(0);
                }
            }
        }
        const a = p1buf.items[0] * 10;
        const b = p1buf.items[p1buf.items.len - 1];
        p1 += a + b;
        const a2 = p2buf.items[0] * 10;
        const b2 = p2buf.items[p2buf.items.len - 1];
        p2 += a2 + b2;

        line.clearRetainingCapacity();
        p1buf.clearRetainingCapacity();
        p2buf.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) {
            @panic("");
        }
    }

    std.debug.print("p1: {any}\n", .{p1});
    std.debug.print("p2: {any}\n", .{p2});
}
