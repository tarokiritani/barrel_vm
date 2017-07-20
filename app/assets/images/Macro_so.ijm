makeRectangle(400, 1, 960, 1600);
run("Crop");

setTool("text");

setFont("SansSerif", 70, "antialiased");
setColor("white");

Overlay.drawString("Sst", 110, 400, 0.0);
run("Size...", "width=240 height=400 constrain average interpolation=Bilinear");
Overlay.show();