use napi_derive::napi;

pub use napi_lib::*;

#[napi]
pub fn main() {
    println!("Hello, world!");
}
