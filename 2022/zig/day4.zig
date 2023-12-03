const std = @import("std");
const fs = std.fs;
const mem = std.mem;
const print = std.debug.print;

const string = std.ArrayList(u8);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const file = try fs.cwd().openFile("../../inputs/2022/in4", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});

    var line = string.init(alloc);
    defer line.deinit();

    var p1: u32 = 0;
    var p2: u32 = 0;

    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        var iter = mem.splitAny(u8, line.items, ",-");
        const s1 = try std.fmt.parseInt(u32, iter.next().?, 10);
        const e1 = try std.fmt.parseInt(u32, iter.next().?, 10);
        const s2 = try std.fmt.parseInt(u32, iter.next().?, 10);
        const e2 = try std.fmt.parseInt(u32, iter.next().?, 10);

        if ((s1 <= s2 and e2 <= e1) or
            (s2 <= s1 and e1 <= e2))
        {
            p1 += 1;
            p2 += 1;
        }
        if (((e1 >= s2) and (s1 < s2) and (e1 < e2)) or
            ((e2 >= s1) and (s2 < s1) and (e2 < e1)))
        {
            p2 += 1;
        }

        line.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) @panic("");
    }

    print("p1: {any}\n", .{p1});
    print("p2: {any}\n", .{p2});
}
