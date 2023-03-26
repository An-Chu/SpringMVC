/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function deleteProduct(endpoint, id) {
    let loader = document.getElementById(`loader-${id}`);
    let btnDelete = document.getElementById(`btn-delete-${id}`);
    
    loader.style.display = "block";
    btnDelete.style.display = "none";
    
    if (confirm("Xac nhan xoa?") === true) {
        fetch(endpoint, {
            method: "delete"
        })
                .then(res => {
                    console.log(res);
                    if (res.status === 204) {
                        location.reload();
                    }
                });
    }

}
