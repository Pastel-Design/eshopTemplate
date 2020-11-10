export function addToCart(productCode) {
    axios.get('/handle/addToCart/' + productCode, {
        params: {}
    })
        .then(function (response) {
            let data = response["data"];
            updateCartInfo(data["cartInfo"]);
        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {
            // always executed
        });
}

function updateCartInfo(cartInfo) {
    let amount = cartInfo[0];
    let price = new Intl.NumberFormat('cz-CZ').format(cartInfo[1]);
    document.getElementById("nav-cart-amount").innerText = amount + " Ks";
    document.getElementById("nav-cart-price").innerText = price + " Kč";
}

function incrementProductInCart(productCode) {
    let productRowCells = document.querySelectorAll("tr[data-product-code='" + productCode + "']")[0].children;
    let priceValue = parseInt(productRowCells[1].innerText);
    let amountValue = parseInt(productRowCells[2].innerText);
    let totalPriceValue = parseInt(productRowCells[3].innerText);
    productRowCells[2].innerText = amountValue + 1;
    productRowCells[3].innerText = totalPriceValue + priceValue;
}

export function cartIncrement(productCode) {
    axios.get('/handle/cartIncrement/' + productCode, {
        params: {}
    })
        .then(function (response) {
            let data = response["data"];
            updateCartInfo(data["cartInfo"]);
            incrementProductInCart(productCode);
        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {
            // always executed
        });
}

function decrementProductInCart(productCode) {
    let productRowCells = document.querySelectorAll("tr[data-product-code='" + productCode + "']")[0].children;
    let priceValue = parseInt(productRowCells[1].innerText);
    let amountValue = parseInt(productRowCells[2].innerText);
    let totalPriceValue = parseInt(productRowCells[3].innerText);
    productRowCells[2].innerText = amountValue - 1;
    productRowCells[3].innerText = totalPriceValue - priceValue;
}

export function cartDecrement(productCode) {
    axios.get('/handle/cartDecrement/' + productCode, {
        params: {}
    })
        .then(function (response) {
            let data = response["data"];
            if (data["code"] === 1) {
                updateCartInfo(data["cartInfo"]);
                removeProductFromCart(productCode);
            } else {
                updateCartInfo(data["cartInfo"]);
                decrementProductInCart(productCode);
            }
        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {
            // always executed
        });
}

function removeProductFromCart(productCode) {
    let productRow = document.querySelectorAll("tr[data-product-code='" + productCode + "']")[0];
    productRow.remove()
}

export function cartDelete(productCode) {
    axios.get('/handle/cartRemove/' + productCode, {
        params: {}
    })
        .then(function (response) {
            let data = response["data"];
            updateCartInfo(data["cartInfo"]);
            removeProductFromCart(productCode);
        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {
            // always executed
        });
}
