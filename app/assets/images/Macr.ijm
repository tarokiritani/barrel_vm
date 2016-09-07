open("\\\\svfas5.epfl.ch\\Users_SV\\kiritani\\My Documents\\TK478\\slide1_slice5_10x.lsm");
selectWindow("slide1_slice5_10x.lsm");
run("Z Project...", "projection=[Max Intensity]");
run("Rotate... ", "angle=130 grid=1 interpolation=Bilinear enlarge stack");
makeRectangle(1100, 608, 892, 1596);
run("Crop");
run("Split Channels");
selectWindow("C3-MAX_slide1_slice5_10x.lsm");
run("Red");
setTool("text");
run("Size...", "width=230 height=411 constrain average interpolation=Bilinear");
setFont("SansSerif", 70, "plain");
setColor("white");

Overlay.drawString("PV", 100, 380, 0.0);
Overlay.show();
saveAs("PNG", "C:\\Users\\kiritani\\Documents\\data\\Github\\barrel_vm\\app\\assets\\images\\PV.png");

open("\\\\svfas5.epfl.ch\\Users_SV\\kiritani\\My Documents\\TK471\\slice1\\stack.lsm");
selectWindow("stack.lsm");
run("Z Project...", "projection=[Max Intensity]");
run("Rotate... ", "angle=160 grid=1 interpolation=Bilinear enlarge stack");
makeRectangle(484, 280, 460, 882);
run("Crop");
run("Split Channels");
selectWindow("C3-MAX_stack.lsm");
run("Red");
setTool("text");
run("Size...", "width=230 height=411 constrain average interpolation=Bilinear");
setFont("SansSerif", 70, "plain");
setColor("white");

Overlay.drawString("VIP", 100, 380, 0.0);
Overlay.show();
saveAs("PNG", "C:\\Users\\kiritani\\Documents\\data\\Github\\barrel_vm\\app\\assets\\images\\VIP.png");