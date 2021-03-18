window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",function(){
    const inputValue = priceInput.value;
    const tax = 0.1
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * tax);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = inputValue - Math.floor(inputValue * tax);
  });
});

