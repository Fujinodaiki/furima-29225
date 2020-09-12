

  window.addEventListener('load', function(){
  
    const priceForm = document.getElementById("item-price")
    const taxPrice  = document.getElementById("add-tax-price")
    const payment  = document.getElementById("profit")


    priceForm.addEventListener('keyup', function(){
      price  = priceForm.value ;
      tax    = Math.round(price * 0.1) ;
      profit = Math.round(price * 0.9) ;
      taxPrice.innerHTML = tax ;
      payment.innerHTML = profit ;

    })
 })
