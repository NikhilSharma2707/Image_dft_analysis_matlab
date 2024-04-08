
image = imread("C:\Impathon\Peacock.jpg"); 
image_gray = rgb2gray(image);

dft_image = fft2(double(image_gray));


magnitude_spectrum = abs(fftshift(dft_image));
figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');
subplot(1, 2, 2);
imshow(log(1 + magnitude_spectrum), []);
title('Magnitude Spectrum (log scale)');


dft_rows = fft(image_gray, [], 2); 
dft_cols = fft(dft_rows, [], 1); 

separability_error = max(max(abs(dft_image - dft_cols)));

if separability_error < 1e-10
    disp('The 2D DFT is separable.');
else
    disp('The 2D DFT is not separable.');
end


periodicity_error = max(max(abs(dft_image - dft_image(1, 1)))); 

if periodicity_error < 1e-10
    disp('The 2D DFT is periodic.');
else
    disp('The 2D DFT is not periodic.');
end
