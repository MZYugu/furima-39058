window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const valueInput = priceInput.value;
    const priceTax = document.getElementById("add-tax-price");
    const calcTax = Math.floor(valueInput * 0.1);
    priceTax.innerHTML = calcTax;
    const profit = document.getElementById("profit");
    profit.innerHTML = valueInput - calcTax
  })
})