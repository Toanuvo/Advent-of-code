const std = @import("std");
const fs = std.fs;

pub fn main() !void {
    var hep: [1048576]u8 = undefined;
    var allocator = std.heap.FixedBufferAllocator.init(&hep);
    var alloc = allocator.allocator();
    const file = try fs.cwd().openFile("../../inputs/2022/in1", fs.File.OpenFlags{});
    defer file.close();

    var lines: [2256][]u8 = undefined;
    var j: u32 = 0;
    while (try file.reader().readUntilDelimiterOrEofAlloc(alloc, '\n', 10)) |word| {
        lines[j] = word;
        j += 1;
    }

    var block:u32 = 0;





    var timer = try std.time.Timer.start();

    
    j = 0;
    var best: [3]u32 = undefined;
    var bestTime: u64 = std.math.inf_u64;
    const mul4 = @Vector(4, u32){1000, 100, 10, 1};
    const mul5 = @Vector(5, u32){10000, 1000, 100, 10, 1};
    const diff: u32 = 48;
    const sub4 = @splat(4, diff);
    const sub5 = @splat(5, diff);

    while (j < 10000) {
        j += 1;

        var lap: u32 = 0;
        timer.reset();
        while (lap < 10000){
            lap += 1;
            best =  init: {
                var initial: [3]u32  = undefined;
                for(initial) |*v| {
                    v.* = 0;
                }
                break :init initial;
            };
            for (lines) |word| {
                if(word.len == 0){
                    addToArr(block, &best);
                    block = 0;
                    continue;
                }
                //var sum:u32 = 0;
                //var dig:u32 = 1;


                if(word.len == 4){
                    block += compute(4, word[0..4].*, mul4, sub4);
                } else {
                    block += compute(5, word[0..5].*, mul5, sub5);
                }
                //for (word) |_, i| {
                //const n = word[(word.len - 1) - i] - 48 ;
                //sum += n * dig;
                //dig *= 10;
                //}

                //block += sum;
            }
            addToArr(block, &best);
        }
        bestTime = @min(bestTime, timer.lap());
    }
    std.debug.print("time {any}\n", .{bestTime});
    //std.debug.print("p1 {any}\n", .{best[0]});
    //std.debug.print("p2 {any}\n", .{best[0] + best[1] + best[2]  });
}

pub fn compute(comptime sz: u32, word: [sz]u8, mul: @Vector(sz, u32), sub: @Vector(sz, u32)) u32 {
    var vec: @Vector(sz, u32) = word;
    vec -= sub;
    vec *= mul;
    return @reduce(std.builtin.ReduceOp.Add, vec);
}

pub fn addToArr(num: u32, arr: *[3]u32) void {
    var item = num;
    for (arr) |*v| {
        if(v.* < item) {
            var tmp:u32 = v.*;
            v.* = item;
            item = tmp;
        }
    }
}

