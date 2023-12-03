const std = @import("std");
const fs = std.fs;
const mem = std.mem;
const print = std.debug.print;

const string = std.ArrayList(u8);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const file = try fs.cwd().openFile("../../inputs/2023/in3", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test", fs.File.OpenFlags{});

    var line = string.init(alloc);
    defer line.deinit();
    var lines = std.ArrayList([]i32).init(alloc);
    defer lines.deinit();

    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        if (line.items.len == 0) continue;
        var s = line.items;
        var parsed = std.ArrayList(i32).init(alloc);

        var num: ?i32 = null;

        for (s, 0..) |c, i| {
            if (std.ascii.isDigit(c)) {
                if (num == null) {
                    var j: usize = i;
                    while (j < s.len and std.ascii.isDigit(s[j])) j += 1;
                    num = -try std.fmt.parseInt(i32, s[i..j], 10);
                }
                try parsed.append(num.?);
            } else {
                num = null;
                try parsed.append(c);
            }
        }

        try lines.append(try parsed.toOwnedSlice());
        line.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) @panic("");
    }

    var p1: i64 = 0;
    var p2: i64 = 0;
    const grid = lines.items;

    for (grid, 0..) |row, y| {
        var counted = false;
        for (row, 0..) |c, x| {
            if (c > 0) counted = false;
            if (c == '.') continue;
            const o = [_]isize{ -1, 0, 1 };
            var g = [_]i64{0} ** 3;
            for (o) |i| {
                for (o) |j| {
                    const a: isize = i + @as(isize, @intCast(y));
                    const b: isize = j + @as(isize, @intCast(x));
                    if (a < 0 or a >= grid.len) continue;
                    if (b < 0 or b >= row.len) continue;
                    const p = grid[@intCast(a)][@intCast(b)];
                    if (c < 0) {
                        if (!counted and p != '.' and p > 0) {
                            counted = true;
                            p1 += c * -1;
                        }
                    }
                    if (c == '*' and p < 0) {
                        for (g, 0..) |r, ri| { // emulate set
                            if (r == p) break;
                            if (r < 0) continue;
                            g[ri] = p;
                            break;
                        }
                    }
                }
            }
            if (g[2] == 0) p2 += g[0] * g[1];
        }
    }

    print("p1: {any}\n", .{p1});
    print("p2: {any}\n", .{p2});

    for (lines.items) |v| {
        alloc.free(v);
    }
}
