document.getElementById("container").style.visibility = 'hidden';
document.getElementById("end").style.visibility = 'hidden';
document.getElementById("success-box").style.visibility = 'visible';

let startAudio = new Audio('/sounds/Leccion7/Pag4/Leccion7Pag4Intro.wav');

function Inicio(){
    document.getElementById("container").style.visibility = 'visible';
    document.getElementById("end").style.visibility = 'visible';
    document.getElementById("success-box").style.visibility = 'hidden';
    startAudio.play();
}
function Next(){
    window.location = "/paginas/Leccion7Pag5"
    /*/auth/login*/
}