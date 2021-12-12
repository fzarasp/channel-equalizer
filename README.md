# Channel Equalizer
MATLAB design of an equalizer system for a given channel system function
‘a.mat’ and ‘b.mat’ files are the denominator and numerator coefficient of the estimated system function of the channel

## Channel
![image](https://user-images.githubusercontent.com/47606879/145712751-2a1f6b8e-8d04-452b-b0ba-ed7b65472cb2.png)

![image](https://user-images.githubusercontent.com/47606879/145712784-44931ecb-a06a-4e97-8aa3-448a83ab18f5.png)

 
 I loaded the "sampleaudio.wav" audio file to examine the output of the channel.
 
 ### Input Audio
 ![image](https://user-images.githubusercontent.com/47606879/145712851-29e751ec-0fb5-4eb8-a31b-5221df715026.png)
 
 ### Output Audio
 ![image](https://user-images.githubusercontent.com/47606879/145712869-31e00c9c-6000-4bc3-a76b-6742cf0766c0.png)
 
 You can see the effect of the channel
 
 ## Equalizer Design
 
 ### Minimum phase inverse
 
 This the minimum phase inverse of the channel
 
 ![image](https://user-images.githubusercontent.com/47606879/145712922-071b7290-4498-4407-a8f7-4647226adc20.png)
 
 ![image](https://user-images.githubusercontent.com/47606879/145712937-56e1b91a-f525-44d2-827f-6ab1e7357c38.png)

### Overall System

Channel + Equalizer

![image](https://user-images.githubusercontent.com/47606879/145712987-fd679d2d-2567-41fe-ad67-772f8de64e7d.png)


## The effect of quantization of the coefficients of digital filters and the effect of the implementation methods

Here, I examined the effect of quantization for Direct and Casecade methods

### Direct 4, 8, 16, 32 bits
![image](https://user-images.githubusercontent.com/47606879/145713079-0de50b68-b775-4689-a74c-32546eff8967.png)

### Casecade 4, 8, 16, 32 bits
![image](https://user-images.githubusercontent.com/47606879/145713139-be308c26-77c2-4711-a606-216ea21e2a49.png)


#### Output of Casecade 32 bit

![image](https://user-images.githubusercontent.com/47606879/145713202-3a0b9ccd-4cd9-460d-b2bd-4e0eb3d8ea64.png)


The audio file of this output is saved as "FinalAudio.wav" which has the sufficient quality


#### You can access to the report and the plot using "REPORT.pdf"




