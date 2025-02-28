# ABIF-Fiji-Workshop-2025

Welcome to the ABIF Fiji Workshop, given on March 4-6 2025! The goal of this workshop is to help you familiarize yourself several functions in Fiji / ImageJ in order to help with preparing figures for publication as well as performing quantitative image analysis on your microscopy images.

On Tuesday March 4th, we'll largely cover how to handle images in Fiji and prepare them for visualization, largely in the context of preparing figures. Along the way, we'll talk about scripting, which involves writing macros in Fiji to streamline the execution of image processing steps, in order to reduce the burden on us humans.

On Wednesday, we'll look more closely at how we try to extract quantitative data from our images, what are the main steps and challenges.

On Thursday, we'll answer further questions, and the instructors will circulate through the room to help you one-on-one with specific challenges that you have with your image analysis, so make sure to come with data and lots of questions. 

### Things to keep in mind

Fiji is a powerful image processing and analysis software - it is open source, and widely used by scientists in bio-medical research. These advantages make it a great starting point for your image analysis needs - you can run Fiji free of charge, free of licenses on almost any computer. Plus there are so many people using Fiji, it is easy to connect with colleagues, imaging scientists, data scientists, and other benevolent nerdy folks to get guidance and help with your specific image analysis challenges.

It's important to note that while Fiji is really good, it doesn't do _everything_ perfectly. For example, it doesn't do 3D visualization and analysis particularly well - it's ok, but not great. Being somewhat limited computationally, it doesn't work seamlessly with state of the art deep-learning object identification algorithms - these typically run in Python, or on other platforms. While these limitations are being addressed by a world wide community of imaging folks, there remains a reasonable chance that you might need to use and integrate different software for your visualization and analysis needs. 

Finally, we ask that you keep an open mind as we go through the example data sets, which will likely not be perfectly representative of everyone's images. Everyone works on different model organisms, with different structures of interest, and different research questions. Kinda amazingly, a lot of the main principles and functions for processing and analysis are commonly for a wide variety of images. Most of the examples given in this workshop with be based on DAPI-labeled nuclei of cultured cells, but the functions we'll look at apply to imaging all kinds of different cell types, tissues, and organisms - though things get more challenging the in latter. 


## Tuesday March 4th

First, we'll open a 3-channel image, acquired on a Zeiss widefield microscope. We'll discuss image properties, metadata, how to adjust contrast, and LUTs
