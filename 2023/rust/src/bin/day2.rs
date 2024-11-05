mod util;
use core::{panic, str};

use nom::bytes::complete::tag;
use nom::character::complete::{anychar, char, digit1, multispace0, space0};
use nom::combinator::{all_consuming, eof, map_res, map, opt};
use nom::multi::{many0, many1, separated_list1};
use nom::sequence::{delimited, terminated, tuple};
use util::Solver;

use nom::{complete, ErrorConvert};
use nom::{self, branch::alt, bytes::complete::{take, take_until, take_until1}, character::{complete::digit0}, IResult, Parser};

pub struct Day2 {
    inp: String,
}

type RGB = [i32; 3];

#[derive(Debug)]
enum Color {
    Red,
    Green,
    Blue,
}

#[derive(Debug)]
pub struct Game {
    id: i32,
    turns: Vec<RGB>,
}

impl Game {
    fn maxColor(&self) -> RGB {
        let mut base = [0, 0, 0];
        for t in &self.turns {
            for i in 0..3 {
                base[i] = base[i].max(t[i]);
            }
        }
        base
    }

}

fn parseGame(inp: &str) -> IResult<&str, Game> {
    let (inp, id) = delimited(
        tag("Game"),
        parseNum,
        char(':')
    ).parse(inp)?;

    map(
        separated_list1(
            char(';'),
            parseTurn),
        move |turns| Game{id, turns}
    ).parse(inp)
}

fn parseNum(inp: &str) -> IResult<&str, i32> {
    map_res(
        delimited(
            multispace0,
            digit1,
            multispace0),
        |s| i32::from_str_radix(s, 10)
    ).parse(inp)
}

fn parsePick(inp: &str) -> IResult<&str, (i32, Color)> {
 tuple((parseNum, parseColor))(inp)
}

fn parseColor(inp: &str) -> IResult<&str, Color> {
        alt((
            tag("red"),
            tag("blue"),
            tag("green"))).map(|s| match s {
            "red" => Color::Red,
            "blue" => Color::Blue,
            "green" => Color::Green,
            _ => panic!()
        }).parse(inp)
}

fn parseTurn(inp: &str) -> IResult<&str, RGB> {
    let (inp, picks) = separated_list1(char(','), parsePick).parse(inp)?;
    let mut out = [0, 0, 0];

    for  p in picks {
        let (i, c) = p;
        out[c as usize] = i;
    }
    
    Ok((inp, out))
}

impl Solver for Day2 {
    fn part1(&self) -> Option<i32> {
        let base = [12, 13, 14];

        Some(self.inp.lines()
            .map(|s| {
                let g = parseGame(s).unwrap().1;
                let possible = g.maxColor()
                    .iter()
                    .zip(base)
                    .all(|(t,b)| *t <= b) ;

                if possible {
                    g.id
                } else {
                    0
                }
            }).sum())

    }

    fn part2(&self) -> Option<i32> {
        Some(self.inp.lines()
            .map(|s| {
                parseGame(s)
                    .unwrap().1
                    .maxColor()
                    .iter().product::<i32>()
            }).sum())
    }
}

pub fn main() {
    let inp = util::getin(2);
    //let inp = fs::read_to_string("./test").unwrap();
    let day = Day2{inp};
    println!("p1: {:?}", day.part1());
    println!("p2: {:?}", day.part2());
}
