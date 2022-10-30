function addToCart(id, name, price) {
    event.preventDefault()
    fetch("/thuongmaidientu/api/cart",
        {
            method: 'post',
            body: JSON.stringify(
                {
                    "idProduct":id,
                    "nameProduct":name,
                    "unitPrice":price,
                    "amount":1
                }
            ),headers: {"Conten-Type": "application/json"}
        }
    ).then(function(res){
        return res.json()
    }).then(function (data){
        let counter = document.getElementById("cartCounter")
        counter.innerText = data
    })
}

$('ul.nav li.dropdown').hover(function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
}, function() {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
});