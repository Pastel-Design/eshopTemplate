import * as ajaxFunctions from "./ajaxFunctions.js";

document.querySelectorAll('.btn-buy').forEach(item => {
    item.addEventListener('click', event => {
        ajaxFunctions.addToCart(item.getAttribute("data-product-code"))
    })
})
