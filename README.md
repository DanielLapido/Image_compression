# IMAGE COMPRESSION ON JPG FORMAT

This function reads an image on jpg format and performs a singular value decomposition on it.
It displays on screen the compressed image and it returns the matrices U sigma and V in the most reduced format for its posterior
manipulation.

This image is a photograph of the 1927 Solvay International Conference where the world's most notable physicists met to discuss the newly formulated quantum theory. 
The dimensions of this photo are 3000x2171 pixels and so the rank of the matrix is 2171.

![](https://github.com/DanielLapido/Image_compression/blob/main/Images/2171.jpg)

This is the rank-300 approximation, whose compression rate is 23,82% (only contains the 23,82% of the original image information), calculated as: 300*(3000+1+2171)/(3000*2171)
![](https://github.com/DanielLapido/Image_compression/blob/main/Images/300.jpg)

This is the rank-100 approximation, with compression rate of 7,94%:
![](https://github.com/DanielLapido/Image_compression/blob/main/Images/100.jpg)

Finally this is the rank-50 approximation, where although only the 3,97% original information remains, we can still distinguish the faces due to the high resolution of our original picture.
![](https://github.com/DanielLapido/Image_compression/blob/main/Images/50.jpg)
