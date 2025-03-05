// Generate masks by thresholding DAPI image (channel 1), 
// then measuring intensity in actin image (channel 2)
// 

raw_image = getImageID();
run("Enhance Contrast", "saturated=0.35");

Stack.setChannel(1);
roiManager("reset");
run("Clear Results");



run("Duplicate...", " ");
run("Median...", "radius=1");

setAutoThreshold("Otsu dark 16-bit no-reset");
setOption("BlackBackground", false);
run("Convert to Mask");

run("Fill Holes");
run("Analyze Particles...", "size=400-Infinity pixel add");

selectImage(raw_image);




numROI = roiManager("count");

for (i = 0; i < numROI; i++) {

	roiManager("Select", i);
	Stack.setChannel(2);
	run("Measure");

}

