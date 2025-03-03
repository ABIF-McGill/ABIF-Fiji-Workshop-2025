
// Use this script if you have a set of labeled masks, where each mask has a unique pixel value
// e.g. masks generated in cellpose, stardist, etc. 

roiManager("reset");

getStatistics(area, mean, min, max, std, histogram);
roiManager("reset");

for (i = 1; i < max+1; i++) {
	setThreshold(i, i);
	run("Create Selection");
	if (selectionType() > -1) {

	roiManager("Add");
	run("Select None");
}
}




