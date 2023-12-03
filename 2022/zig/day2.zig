const std = @import("std");
const fs = std.fs;

const lookup = init: {
    const arr = [_]i8{0,1,2};
    var lk = [3][3]i8{
    [_]i8{0, 0, 0},
    [_]i8{0, 0, 0},
    [_]i8{0, 0, 0}
    };
    for (arr) |you, ui| {
        for (arr) |me, mi| {
            lk[ui][mi] = 1 + me + 3 * @mod(me + 1 - you, 3);
        }
    }
    break :init lk;
};
pub fn main() !void {
    const file = try fs.cwd().openFile("../../inputs/2022/in2", fs.File.OpenFlags{});

    var buf = [_]u8{0} ** 4;
    var sum: i32 = 0;
    while (try file.reader().readUntilDelimiterOrEof(&buf, '\n')) |word| {
        if(word.len == 0) continue;
        const you = word[0] - 'A';
        const me = word[2] - 'X';
        sum += lookup[you][me];
    }
    std.debug.print("p1: {any}\n", .{sum});

    //const you = @Vector(1, i8){1}
}
