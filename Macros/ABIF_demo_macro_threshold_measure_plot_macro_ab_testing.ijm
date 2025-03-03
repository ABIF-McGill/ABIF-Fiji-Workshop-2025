
// demo script, run on antibody testing images
// go through thresholding of DAPI channel, generate ROIs, threshold green WT channel
// measure intensities in antibody channel, determine whether cell in positive or negative for green (thus wt or ko)

run("Clear Results");
roiManager("reset");


mean_array = newArray();
category_array = newArray();

roiManager("reset");

setBatchMode(true);
	

raw_image = getImageID();

Stack.setChannel(1);
run("Duplicate...", " ");
run("Out [-]");

run("Median...", "radius=1");
run("Gaussian Blur...", "sigma=2.5");

setAutoThreshold("Mean dark 16-bit no-reset");
//run("Threshold...");
setAutoThreshold("Otsu dark 16-bit no-reset");
run("Convert to Mask");
run("Fill Holes");
run("Watershed");



run("Analyze Particles...", "size=375-Infinity show=Nothing add");
roiManager("Show All without labels");
	if (k == 0){ 
		waitForUser("organize windows as needed...");
    }


dapi_masks = getImageID();


selectImage(raw_image);
Stack.setChannel(2);
run("Duplicate...", " ");
run("Out [-]");
setAutoThreshold("Mean dark 16-bit no-reset");
run("Convert to Mask");
thresh_green_raw = getImageID();
run("Analyze Particles...", "size=400-Infinity show=Masks");
thresh_green = getImageID();
selectImage(thresh_green_raw);
close();

	if (k == 0){ 
		waitForUser("organize windows as needed...");
    }

selectImage(raw_image);
Stack.setChannel(3);
run("Duplicate...", " ");
run("Out [-]");
ab_image = getImageID();

	if (k == 0){ 
		waitForUser("organize windows as needed...");
    }


numROI = roiManager("count");


for (i = 0; i < numROI; i++) {
	selectImage(raw_image);
	roiManager("Show None");
	roiManager("select", i);
	
	selectImage(dapi_masks);
	roiManager("Show None");
	roiManager("select", i);
	
	
	selectImage(thresh_green);
	roiManager("Show None");
	//Stack.setChannel(1);
	roiManager("select", i);
	wait(50);
	//run("Measure");
	mean_green = getValue("Mean");
	
	if (mean_green > 200) {
	y= 0.1*random - 0.05;
	celltype = "wt";
	} else {
		y = 0.1*random + 0.95;
		celltype = "ko";
	}
	selectImage(ab_image);
	roiManager("Show None");
	roiManager("select", i);
	wait(50);
	run("Measure");
	mean = getValue("Mean");
	setResult("Celltype", nResults-1, celltype);
	
	
	mean_array = Array.concat(mean_array,mean);
	category_array = Array.concat(category_array, y);
            //Plot.create("Animated Plot", "X", "Y", category_array, mean_array);

            //Plot.update();
          
            Plot.create("Scatter Plot", "{WT,KO}", "Antibody Intensity");
        	Plot.setLimits(-0.5, 1.5, 0, 8000);
        	Plot.setColor("#00aaff", "#00aaff");
        	Plot.add("circle", category_array, mean_array);
        	
        	Plot.update();
        	updateResults();
	if (k == 0 && i == 0){ 
		waitForUser("organize windows as needed...");
    }
}





