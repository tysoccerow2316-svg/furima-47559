window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  const calculate = () => {
    const price = parseFloat(priceInput.value);

    const tax = Math.floor(price * 0.1);
    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = price - tax;
  };

  priceInput.addEventListener("input", calculate);
  calculate();
});