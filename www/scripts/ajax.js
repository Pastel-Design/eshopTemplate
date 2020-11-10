import * as ajaxFunctions from "./ajaxFunctions.js";

document.querySelectorAll('.btn-buy').forEach(item => {
    item.addEventListener('click', event => {
        ajaxFunctions.addToCart(item.getAttribute("data-product-code"))
    })
})
document.querySelectorAll('.cart-add').forEach(item => {
    item.addEventListener('click', event => {
        ajaxFunctions.cartIncrement(item.getAttribute("data-product-code"))
    })
})
document.querySelectorAll('.cart-remove').forEach(item => {
    item.addEventListener('click', event => {
        ajaxFunctions.cartDecrement(item.getAttribute("data-product-code"))
    })
})
document.querySelectorAll('.cart-delete').forEach(item => {
    item.addEventListener('click', event => {
        ajaxFunctions.cartDelete(item.getAttribute("data-product-code"))
    })
})