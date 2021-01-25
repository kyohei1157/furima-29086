window.addEventListener('load', () => {
  console.log("OK");
  cconst priceInput = document.getElementById("金額を入力する場所のid");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  })
});