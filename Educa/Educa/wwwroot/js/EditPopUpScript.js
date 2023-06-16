var span = document.getElementById("StatusEdit");
let nom = span.textContent;
if (nom === "Editado!") {
    console.log(span.textContent);
    showBanner('.banner.success');
}
if (nom === "No editado!") {
    console.log(span.textContent);
    showBanner('.banner.error');
}
if (nom === "Edita un campo") {
    console.log(span.textContent);
    showBanner('.banner.info');
}

function showBanner(selector) {
    //hideBanners();
    // Ensure animation plays even if the same alert type is triggered.
    requestAnimationFrame(() => {
        const banner = document.querySelector(selector);
        banner.classList.add("visible");
    });

};
const hideBanners = (e) => {
    console.log(span.textContent);
    document
        .querySelectorAll(".banner.visible")
        .forEach((b) => b.classList.remove("visible"));
};
function verificarPasswords() {
    $("#StatusEdit").hide();
    // Ontenemos los valores de los campos de contraseñas 
    pass = document.getElementById('pass');
    pass1 = document.getElementById('pass1');
    pass2 = document.getElementById('pass2');

    // Verificamos si las constraseñas no coinciden 
    if (pass.value == "" || pass1.value == "" || pass2.value == "") {
        document.getElementById("Suggest").classList.remove("mostrar");
        document.getElementById("Suggest").classList.add("ocultar");
        document.getElementById("errorVacio").classList.add("mostrar");

        return false;
    }
    if (pass1.value != pass2.value) {

        // Si las constraseñas no coinciden mostramos un mensaje 
        document.getElementById("Suggest").classList.remove("mostrar");
        document.getElementById("Suggest").classList.add("ocultar");
        document.getElementById("errorVacio").classList.remove("mostrar");
        document.getElementById("error").classList.add("mostrar");
        return false;
    }

    else {
        let link = `/home/ChangePassword?pass=${pass.value}&pass1=${pass1.value}&pass2=${pass2.value}`;
        // Si las contraseñas coinciden ocultamos el mensaje de error
        document.getElementById("Suggest").classList.remove("mostrar");
        document.getElementById("Suggest").classList.add("ocultar");
        document.getElementById("error").classList.remove("mostrar");
        document.getElementById("errorVacio").classList.remove("mostrar");
        // Mostramos un mensaje mencionando que las Contraseñas coinciden 
        document.getElementById("ok").classList.remove("ocultar");

        // Desabilitamos el botón de login 
        document.getElementById("login").disabled = true;

        // Refrescamos la página (Simulación de envío del formulario) 
        setTimeout(function () {
            window.location = link;
        }, 3000);

        return true;
    }

}

function myFunction() {
    $("#StatusEdit").hide();
    document.getElementById("Suggest").classList.remove("ocultar");
    document.getElementById("error").classList.remove("mostrar");
    document.getElementById("errorVacio").classList.remove("mostrar");
    document.getElementById("Suggest").classList.add("mostrar");
    console.log("Sientraperro");
    var mayus = new RegExp("^(?=.*[A-Z])");
    var special = new RegExp("^(?=.*[!@#$%&*.])");
    var numbers = new RegExp("^(?=.*[0-9])");
    var lower = new RegExp("^(?=.*[a-z])");
    var len = new RegExp("^(?=.{8,})");
    var regExp = [mayus, special, numbers, lower, len];
    var elementos = [$(".mayus"), $(".special"), $(".numbers"), $(".lower"), $(".len")];
    var passw = $("#pass1").val();
    var check = 0;
    for (var i = 0; i < 5; i++) {
        console.log("Sientraperro2");
        if (regExp[i].test(passw)) {
            console.log("Sientraperro3");
            elementos[i].hide();
            check++;
        } else {
            console.log("Sientraperro4");
            elementos[i].show();
        }
        if (check >= 0 && check <= 2) {
            $("#mensaje").text("Muy insegura").css("color", "red");
        } else if (check >= 3 && check <= 4) {
            $("#mensaje").text("Poco Segura").css("color", "orange");
            document.getElementById("Suggest").classList.remove("ocultar");
            document.getElementById("Suggest").classList.add("mostrar");
        } else if (check == 5) {
            $("#mensaje").text("Segura").css("color", "green");
            document.getElementById("Suggest").classList.remove("mostrar");
            document.getElementById("Suggest").classList.add("ocultar");
        }
    }
}