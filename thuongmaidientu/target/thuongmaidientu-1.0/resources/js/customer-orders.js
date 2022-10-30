function loadAdminProduct(endpoint) {
    fetch(endpoint).then(function(res) {
        return res.json();
    }).then(function(data) {
        console.info(data);
        let msg = "";
        for (let i = 0; i < data.length; i++)
            msg += `
                <tr id="row${data[i].id}">
                    <td></td>
                    <td>${data[i].idOrders}</td>
                    <td>${data[i].totalMoney} VND</td>
                    <td>
                        <div class="spinner-border text-success" style="display:none" id="load${data[i].idShopStore}"></div>
                        <button class="btn btn-danger"">Xoa</button>
                    </td>
                </tr>
        `

        let d = document.getElementById("mainId");
        d.innerHTML = msg;

        let d2 = document.getElementById("myLoading")
        d2.style.display = "none"
    })
}