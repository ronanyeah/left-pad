module left_pad::left_pad;

use std::{ascii::{Self, Char}, string::{Self, String}};

public fun left_pad(val: String, len: u32, char: Option<Char>): String {
    if (len as u64 <= val.length()) {
        return val
    };

    let pad_char = char.get_with_default(ascii::char(32));

    let pad_count = (len as u64 - val.length()) as u64;

    let mut pad_bytes = vector::empty<u8>();

    let mut i = 0;
    while (i < pad_count) {
        pad_bytes.push_back(pad_char.byte());
        i = i + 1;
    };

    let mut result = string::from_ascii(ascii::string(pad_bytes));

    result.append(val);

    result
}
