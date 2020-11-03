document.querySelectorAll('.btn-buy').forEach(item => {
    item.addEventListener('click', event => {
        addToCart(item.getAttribute("data-product-code"))
    })
})

async function addToCart(productCode) {
    try {
        const response = await axios.get('/handle/addToCart/' + productCode);
        console.log(response["data"]);
    } catch (error) {
        console.error(error);
    }
}