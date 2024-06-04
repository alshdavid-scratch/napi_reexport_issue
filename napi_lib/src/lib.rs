use napi_derive::napi;

#[napi]
pub fn external() {
  println!("hello from external")
}
