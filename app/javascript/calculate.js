function calculate() {
  const price = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("keyup", () => {
    const tax = 0.10;
    const changedTaxPrice = parseInt(price.value * tax)
    taxPrice.innerHTML = changedTaxPrice;
    const changedProfit = price.value - changedTaxPrice;
    profit.innerHTML = changedProfit;
  });
}

window.addEventListener("load", calculate);