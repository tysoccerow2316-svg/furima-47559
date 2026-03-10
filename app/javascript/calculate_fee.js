window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const price = parseFloat(inputValue);
  const tax = Math.floor(price * 0.1);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML =Math.floor(price * 0.1);
  const profitInput = document.getElementById("profit");
  profitInput.innerHTML= price - tax;
   console.log(inputValue);})
});