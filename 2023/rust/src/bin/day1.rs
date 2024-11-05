mod util;

use std::{borrow::Borrow, env, fs, ops::DivAssign};

use util::Solver;


pub struct Day1{
    inp: String,
}

impl Solver for Day1 {

    fn part1(&self) -> Option<i32> {
        Some(self.inp
            .lines()
            .map(|s| s.chars()
                .filter(|c| c.is_digit(10))
                .collect::<Vec<char>>())
            .map(|s| 10*s.first().parse()
                + s.last().parse()
            )
            .sum())
    }


    fn part2(&self) -> Option<i32> {
        let r = self.inp
            .lines()
            .map(|s| {
                let mut digs = 0;
                for j in 0..s.len() {
                    if let Some(d) = (s[j..]).borrow().try_parse() {
                        digs = d*10;
                        break;
                    }
                }
                for j in (0..s.len()).rev() {
                    if let Some(d) = (s[j..]).borrow().try_parse() {
                        digs += d;
                        break;
                    }
                }
                digs

            }).sum();
        Some(r)
    }
}

trait TryParse {
    fn try_parse(&self) -> Option<i32>;
}

impl TryParse for &str {
    fn try_parse(&self) -> Option<i32> {
        let Nums: Vec<(&str, &str)> = vec![
            ("1" , "one"),
            ("2" , "two" ),
            ("3" , "three"),
            ("4" , "four" ),
            ("5" , "five" ),
            ("6" , "six" ),
            ("7" , "seven"),
            ("8" , "eight"),
            ("9" , "nine" ),
        ];

        for i in 1..=9 {
            let (ni, si) = Nums[i-1];
            if self.starts_with(ni) || self.starts_with(si) {
                return Some(i as i32);
            }
        }
        None
    }
}

pub trait Parse {
    fn parse(&self) -> i32;
}

impl Parse for Option<&char> {
 fn parse(&self) -> i32 {
        self.and_then(|c| c.to_digit(10)).unwrap() as i32
    }   
}

pub fn main() {
    let inp = util::getin(1);
    //let inp = fs::read_to_string("./test").unwrap();
    let day = Day1{inp};
    println!("p1: {}", day.part1().unwrap());
    println!("p2: {}", day.part2().unwrap());
}
