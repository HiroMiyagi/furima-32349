function item_price() {
  const price_input = document.querySelector(".price-input");
  price_input.addEventListener("input",function(){
    console.log("Input action");
  });
}
window.addEventListener("", item_price);