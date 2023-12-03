const std = @import("std");
const fs = std.fs;
const string = std.ArrayList(u8);

const Color = enum {
    red,
    blue,
    green,

    const Self = @This();

    pub fn moreThanMax(col: Self, cnt: u64) bool {
        return switch (col) {
            Color.red => cnt > 12,
            Color.blue => cnt > 14,
            Color.green => cnt > 13,
        };
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const file = try fs.cwd().openFile("../../inputs/2023/in2", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});

    var line = string.init(alloc);
    defer line.deinit();

    var id: u32 = 1;
    var p1: u32 = 0;
    var p2: u64 = 0;

    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        const hd = std.mem.indexOfScalar(u8, line.items, ':') orelse @panic("");
        try line.replaceRange(0, hd + 1, "");

        var game = [_]u64{0} ** 3;

        var toomany = false;
        var iter = std.mem.splitScalar(u8, line.items, ';');
        while (iter.next()) |group| {
            var giter = std.mem.splitScalar(u8, group, ',');
            while (giter.next()) |set| {
                const numidx = 1 + std.mem.indexOfScalar(u8, set[1..], ' ').?;
                const num = try std.fmt.parseInt(u32, set[1..numidx], 10);
                const color = std.meta.stringToEnum(Color, set[numidx + 1 ..]).?;

                const i = @intFromEnum(color);
                game[i] = @max(game[i], num);

                if (color.moreThanMax(num)) {
                    toomany = true;
                }
            }
        }
        if (!toomany) {
            p1 += id;
        }

        p2 += game[0] * game[1] * game[2];

        id += 1;
    } else |err| {
        if (err != error.EndOfStream) @panic("");
    }

    std.debug.print("p1: {any}\n", .{p1});
    std.debug.print("p2: {any}\n", .{p2});
}
