// window.addEventListener('load', () => {
//   console.log("OK");
// });
feeRate = 0.1

window.onload = function(){const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const price = priceInput.value
    const fee = Math.floor(price * feeRate)
    const profit = Math.floor(price - fee)

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = fee
    
    const saleProfit = document.getElementById("profit")
    saleProfit.innerHTML = profit
  })
};
