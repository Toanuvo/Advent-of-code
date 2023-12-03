const std = @import("std");
const fs = std.fs;
const mem = std.mem;
const Allocator = std.mem.Allocator;
const print = std.debug.print;

const string = std.ArrayList(u8);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const file = try fs.cwd().openFile("../../inputs/2022/in6", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});

    var line = string.init(alloc);
    defer line.deinit();

    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        print("p1: {any}\n", .{try solve(line, 4, alloc)});
        print("p2: {any}\n", .{try solve(line, 14, alloc)});
        line.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) @panic("");
    }
}

pub fn solve(line: string, comptime start: u8, alloc: Allocator) !usize {
    var buf = try std.RingBuffer.init(alloc, start);
    defer buf.deinit(alloc);

    var arr = [_]u8{0} ** 26;

    for (line.items, 0..) |char, i| {
        const ch = char - 97;
        if (buf.isFull()) arr[buf.read().?] -= 1;
        arr[ch] += 1;
        try buf.write(ch);

        var vec: @Vector(26, u8) = arr;
        var uniq = @reduce(std.builtin.ReduceOp.Max, vec) == 1;
        if (buf.isFull() and uniq) return i + 1;
    } else {
        @panic("");
    }
}
