#[test_only]
module left_pad::left_pad_tests;

use left_pad::left_pad::left_pad;
use std::{ascii::{Self, Char}, string::{Self, String}};

#[test]
fun test_left_pad_with_default_space() {
    let input: String = string::utf8(b"test");
    let expected: String = string::utf8(b"   test");
    let pad_char: Option<Char> = option::none();
    let result = left_pad(input, 7, pad_char);

    assert!(result.length() == 7);
    assert!(result == expected);
}

#[test]
fun test_left_pad_with_char() {
    let input: String = string::utf8(b"hello");
    let expected: String = string::utf8(b"***hello");
    let pad_char: Option<Char> = option::some(ascii::char(42)); // ASCII '*' = 42
    let result = left_pad(input, 8, pad_char);

    assert!(result.length() == 8);
    assert!(result == expected);
}

#[test]
fun test_left_pad_empty_string() {
    let input: String = string::utf8(b"");
    let expected: String = string::utf8(b"#####");
    let pad_char: Option<Char> = option::some(ascii::char(35)); // ASCII '#' = 35
    let result = left_pad(input, 5, pad_char);

    assert!(result.length() == 5);
    assert!(result == expected);
}

#[test]
fun test_left_pad_no_padding_needed() {
    // Equal length
    let input: String = string::utf8(b"hello");
    let pad_char: Option<Char> = option::some(ascii::char(42)); // ASCII '*' = 42
    let result = left_pad(input, 5, pad_char);

    assert!(result.length() == 5);
    assert!(result == string::utf8(b"hello"));

    // Shorter length
    let result_short = left_pad(input, 3, pad_char);
    assert!(result_short.length() == 5);
    assert!(result_short == string::utf8(b"hello"));
}
