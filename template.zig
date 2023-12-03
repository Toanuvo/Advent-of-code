const std = @import("std");
const fs = std.fs;
const mem = std.mem;
const print = std.debug.print;

const string = std.ArrayList(u8);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    //const file = try fs.cwd().openFile("../../inputs/2023/in1", fs.File.OpenFlags{});
    const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});

    var line = string.init(alloc);
    defer line.deinit();

    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        const s = line;
        _ = s;

        line.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) @panic("");
    }
    print("{any}\n", .{});
}
