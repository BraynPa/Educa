document.getElementById("content").style.visibility = 'hidden';
document.getElementById("end").style.visibility = 'hidden';
document.getElementById("success-box").style.visibility = 'visible';

let startAudio = new Audio('/sounds/Leccion7/Pag5/Leccion7Pag5Intro.wav');

function Inicio(){
    document.getElementById("content").style.visibility = 'visible';
    document.getElementById("end").style.visibility = 'visible';
    document.getElementById("success-box").style.visibility = 'hidden';
    startAudio.play();
}
function Next(){
    window.location = "/paginas/Leccion7Ej1"
    /*/auth/login*/
}