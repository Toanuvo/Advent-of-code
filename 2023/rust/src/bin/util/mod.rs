use std::{fs, env};

pub trait Solver {
    fn part1(&self) -> Option<i32>;
    fn part2(&self) -> Option<i32>;
}

pub static YEAR: &str = "2023";

pub fn getin(day: u32) -> String {
    let dir = format!( "../../inputs/{}/in{}", YEAR, day);
     fs::read_to_string(dir).unwrap()
}
