window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  const taxDom = document.getElementById("add-tax-price");
  const resultDom = document.getElementById("profit");
  // 税率
  const tax = 10;
  price.addEventListener("input", () => {
    // 数値化
    const inputPrice = price.value;
    // 抜かれる金額を計算
    const taxResult = Math.round((inputPrice * tax) / 100);
    // 数値として代入
    taxDom.innerHTML = taxResult;
    // 税を抜かれた後を計算
    const priceResult = inputPrice - taxResult;
    // 数値を代入
    resultDom.innerHTML = priceResult;
  })
});