makeRectangle(500, 10, 960, 1600);
run("Crop");

setTool("text");

setFont("SansSerif", 70, "antialiased");
setColor("white");

Overlay.drawString("SOM", 70, 400, 0.0);
run("Size...", "width=240 height=400 constrain average interpolation=Bilinear");
Overlay.show();