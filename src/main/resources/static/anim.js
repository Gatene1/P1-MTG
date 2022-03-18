let canvas;
let ctx;
let setX = 78;
let setY = 78;
let rawSetX = -150; // 23
let rawSetY = 67;
let logSetX = -150; // 23
let logSetY = 107;
let imgSpeedX = 15;
let imgSpeedY = 7;
let mouseX, mouseY
let imageClicked = false;
let animFinished = false;
let flyIn = false;
let showingSettings = true;
let reverse = false;
let imgLeft = setX - 0;
let imgRight = setX + 44;
let imgTop = setY - 0;
let imgBottom = setY + 44;
let rawImgLeft = rawSetX;
let rawImgRight = rawSetX + 150;
let rawImgTop = rawSetY;
let rawImgBottom = rawSetY + 37;
let logImgLeft = logSetX;
let logImgRight = logSetX + 150;
let logImgTop = logSetY;
let logImgBottom = logSetY + 37;

let yBox = document.getElementById('yBox');
let cBox = document.getElementById('cBox');

const canvasWidth = 200;
const canvasHeight = 200;
const img = document.getElementById("settingsImage");
const rawImg = document.getElementById('rawDataImage');
const logImg = document.getElementById('loggingImage');

function refreshVars() {
    imgLeft = setX - 0;
    imgRight = setX + 44;
    imgTop = setY - 0;
    imgBottom = setY + 44;
    rawImgLeft = rawSetX;
    rawImgRight = rawSetX + 150;
    rawImgTop = rawSetY;
    rawImgBottom = rawSetY + 37;
    logImgLeft = logSetX;
    logImgRight = logSetX + 150;
    logImgTop = logSetY;
    logImgBottom = logSetY + 37;
}

function updateMousePos(evt) {
    var rect = canvas.getBoundingClientRect(); // position of mouse on page
    var root = document.documentElement;

    refreshVars();

    mouseX = evt.clientX - rect.left - root.scrollLeft;
    mouseY = evt.clientY - rect.top - root.scrollTop;

    if ((mouseX >= imgLeft && mouseX <= imgRight) && (mouseY >= imgTop && mouseY <= imgBottom) && !imageClicked && !animFinished)
        document.body.style.cursor = "pointer"; // if mouse is hovering over the Settings icon.
    else if (!imageClicked && animFinished && (mouseX >= rawImgLeft && mouseX <= rawImgRight) && (mouseY >= rawImgTop && mouseY <= rawImgBottom))
        document.body.style.cursor = "pointer"; // if mouse is hovering over the Raw Images icon.
    else if (!imageClicked && animFinished && (mouseX >= logImgLeft && mouseX <= logImgRight) && (mouseY >= logImgTop && mouseY <= logImgBottom))
        document.body.style.cursor = "pointer"; // if mouse is hovering over the Logging icon.
    else
        document.body.style.cursor = "default";

    yBox.value="RIL = " + rawImgLeft + ", RIR = " + rawImgRight + ", RIT = " + rawImgTop + ", RIB = " + rawImgBottom;
    cBox.value="x = " + mouseX + ", y = " + mouseY;
}

function mouseClick(evt) {
    refreshVars();
    if ((mouseX >= imgLeft && mouseX <= imgRight) && (mouseY >= imgTop && mouseY <= imgBottom))
        imageClicked = true;
    else if (!imageClicked && animFinished && (mouseX >= rawImgLeft && mouseX <= rawImgRight) && (mouseY >= rawImgTop && mouseY <= rawImgBottom))
        document.location.href="/cards"
    else if (!imageClicked && animFinished && (mouseX >= logImgLeft && mouseX <= logImgRight) && (mouseY >= logImgTop && mouseY <= logImgBottom))
        document.body.style.cursor = "pointer"; // if mouse is hovering over the Logging icon.
}

window.onload = function() {
    canvas = document.getElementById('adminButtons');
    ctx = canvas.getContext("2d");

    let img2 = document.getElementById("settingsImage");

    let fps = 30;
    setInterval(imageReset, 1000/fps);

    canvas.addEventListener('mousemove', updateMousePos);
    canvas.addEventListener('mousedown', mouseClick);
}

function imageReset() {
    if (!reverse) {
        if (imageClicked) {
            if (setX <= -44) {
                imageClicked = false;
                animFinished = true;
            }
        }
    }
    DrawAll();
}

 function ColorRect (leftX, topY, boxWidth, boxHeight, fillColor) {
    if (fillColor != "Clear") {
        ctx.fillStyle = fillColor;
        ctx.fillRect(leftX, topY, boxWidth, boxHeight);
    } else
        ctx.reset();
 }

 function DrawTheImage (imgElem, imgX, imgY) {
    if (!imageClicked)
        ctx.drawImage(imgElem, imgX, imgY);
    else
        ctx.drawImage(imgElem, imgX += imgSpeedX, imgY);

    // if the flyout animation is finished, make the buttons fly in
     flyIn = animFinished;
     if (flyIn) showingSettings = false;

    if (!flyIn || rawSetX >= 23) {   // If the settings button isn't flying out or if it did and the buttons are where they are supposed to be.
        ctx.drawImage(rawImg, rawSetX, rawSetY);
        ctx.drawImage(logImg, logSetX, logSetY);

    } else {
            ctx.drawImage(rawImg, rawSetX += imgSpeedX, rawSetY);
            ctx.drawImage(logImg, logSetX += imgSpeedX, logSetY);

    }
 }

 function DrawAll (){
    ColorRect(0, 0, canvasWidth, canvasHeight, "Clear");

    if (!reverse) {
        if ((!imageClicked && !animFinished) || (!imageClicked && animFinished))
            DrawTheImage(img, setX, setY);
        else {
            DrawTheImage(img, setX -= imgSpeedX, setY);
        }
    } else
        reverseFly();

 }

 function CheckMenuStatus() {
    if (!showingSettings) {
        imageClicked = false;
        animFinished = false;
        flyIn = false;
        showingSettings = true;
        reverse = true;
    }
 }

 function reverseFly() {
    let setInPlace = false;
    let rawInPlace = false;
    let logInPlace = false;
    if (setX <= 63) {
        setX += 15;
    } else {
        setInPlace = true;
    }
    if (rawSetX > -150) {
        rawSetX -= 15;
    } else {
        rawInPlace = true;
    }
    if (logSetX > -150) {
        logSetX -= 15;
    } else {
        logInPlace = true;
    }

    if (setInPlace && rawInPlace && logInPlace) {
        reverse = false;
        showingSettings = true;
    }
 }