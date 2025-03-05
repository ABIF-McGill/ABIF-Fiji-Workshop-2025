
// Batch process folder of images:
// Generate masks by thresholding DAPI image (channel 1), 
// then measuring intensity in actin image (channel 2)
// save individual results table for each image


// select the folder where the images are stored
input = getDirectory("Choose a folder with images in it!");

//select a folder to save images, ideally not in the input folder

output = getDirectory("Choose a folder to save results");

list_of_images = getFileList(input);
number_of_images = list_of_images.length;

for (k = 0; k < number_of_images; k++) {

open(input + list_of_images[k]);

raw_image = getImageID();

run("Enhance Contrast", "saturated=0.35");

Stack.setChannel(1);
roiManager("reset");
run("Clear Results");

filename = getTitle();


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

run("Close All");

saveAs("Results", output + "results_" + filename + ".csv");

}

