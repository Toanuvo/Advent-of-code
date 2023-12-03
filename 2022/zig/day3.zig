const std = @import("std");
const fs = std.fs;
const set = std.AutoHashMap(void, u8);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const file = try fs.cwd().openFile("../../inputs/2022/in3", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});
    defer file.close();

    var word = std.ArrayList(u8).init(alloc);
    defer word.deinit();

    var p2buf: ?std.bit_set.StaticBitSet(52) = null;

    var p1: usize = 0;
    var p2: usize = 0;
    var gid: u8 = 0;

    while (file.reader().streamUntilDelimiter(word.writer(), '\n', null)) {
        gid += 1;
        var p1buf = std.bit_set.StaticBitSet(52).initEmpty();
        var group = std.bit_set.StaticBitSet(52).initEmpty();
        var found = false;

        const half = word.items.len / 2;
        for (word.items, 0..) |c, idx| {
            const i: u8 = if (c >= 97) c - 97 else (c - 65) + 26;
            group.set(i);
            if (idx < half) {
                p1buf.set(i);
            } else if (!found and p1buf.isSet(i)) {
                p1 += i + 1;
                found = true;
            }
        }
        group.setIntersection(p2buf orelse group);
        p2buf = group;

        if (gid == 3) {
            p2 += 1 + p2buf.?.findFirstSet().?;
            p2buf = null;
            gid = 0;
        }

        word.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) {
            @panic("");
        }
    }

    //p2 += 1 + p2buf.?.findFirstSet().?;
    std.debug.print("p1: {any}\n", .{p1});
    std.debug.print("p2: {any}\n", .{p2});
}
