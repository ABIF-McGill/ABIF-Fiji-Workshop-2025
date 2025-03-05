
// Macro to make composite images from 3 channel images
// 


Stack.setDisplayMode("composite");

Stack.setChannel(1);
run("Blue");
run("Enhance Contrast", "saturated=0.35");

Stack.setChannel(2);
run("Green");
run("Enhance Contrast", "saturated=0.35");

Stack.setChannel(3);
run("Magenta");
run("Enhance Contrast", "saturated=0.35");

run("RGB Color");

run("Scale Bar...", "width=10 height=10 thickness=12 font=20 bold");

