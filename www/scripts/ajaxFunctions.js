export function addToCart(productCode) {
    axios.get('/handle/addToCart/' + productCode, {
        params: {}
    })
        .then(function (response) {
            let data = response["data"];
            if(data["code"]===0){
                writeProduct(data["cartMessage"]);
            }
            console.log(data);
        })
        .catch(function (error) {
            console.log(error);
        })
        .then(function () {
            // always executed
        });
}

function writeProduct(product){

}