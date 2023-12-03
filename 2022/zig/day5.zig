const std = @import("std");
const fs = std.fs;
const mem = std.mem;
const print = std.debug.print;

const string = std.ArrayList(u8);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{ .safety = true }){};
    var alloc = gpa.allocator();
    defer _ = gpa.deinit();

    const file = try fs.cwd().openFile("../../inputs/2022/in5", fs.File.OpenFlags{});
    //const file = try fs.cwd().openFile("test5", fs.File.OpenFlags{});

    var crates1 = [_]string{string.init(alloc)} ** 10;
    var crates2 = [_]string{string.init(alloc)} ** 10;

    var line = string.init(alloc);
    defer line.deinit();

    var crate: u8 = 1;
    while (file.reader().streamUntilDelimiter(line.writer(), '\n', null)) {
        if (line.items.len == 0) continue;
        if (line.items[0] != 'm') {
            try crates1[crate].appendSlice(line.items);
            try crates2[crate].appendSlice(line.items);
            crate += 1;
        } else {
            var iter = mem.splitScalar(u8, line.items, ' ');
            _ = iter.next(); //move
            const cnt = try std.fmt.parseInt(u32, iter.next().?, 10);
            _ = iter.next(); //from
            const src = try std.fmt.parseInt(u32, iter.next().?, 10);
            _ = iter.next(); //to
            const dest = try std.fmt.parseInt(u32, iter.next().?, 10);

            //print("{any}, {c}, {c}\n", .{ cnt, crates[src].items, crates[dest].items });
            for (0..cnt) |_| {
                try crates1[dest].append(crates1[src].pop());
            }
            const l = crates2[src].items.len;
            try crates2[dest].appendSlice(crates2[src].items[l - cnt ..]);
            try crates2[src].resize(crates2[src].items.len - cnt);
        }

        const s = line;
        _ = s;

        line.clearRetainingCapacity();
    } else |err| {
        if (err != error.EndOfStream) @panic("");
    }

    var p1 = string.init(alloc);
    defer p1.deinit();
    var p2 = string.init(alloc);
    defer p2.deinit();

    for (crates1) |stack| {
        if (stack.getLastOrNull()) |c| try p1.append(c);
        stack.deinit();
    }
    for (crates2) |stack| {
        if (stack.getLastOrNull()) |c| try p2.append(c);
        stack.deinit();
    }
    print("p1: {c}\n", .{p1.items});
    print("p2: {c}\n", .{p2.items});
}
