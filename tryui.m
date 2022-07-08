clc
clear
% create figure and panel on it
f = figure(1);
p = uipanel ("title", "Please Choose file first before modifying", "position", [.0 .0 .90 .90]);
% add two buttons to the panel
% [kesamping posisi tinggi posisi panjangnya tingginya]
b1 = uicontrol ("parent", p, "string", "Choose File", "position",[18 10 150 36], "callback", "dirask()");
b2 = uicontrol ("parent", p, "string", "Croping with gray filter", "position",[18 60 350 36], "callback", "crop()");
b3 = uicontrol ("parent", p, "string", "Clear Recent Action","position",[0 250 350 50], "callback", "clract()");
b4 = uicontrol ("parent", p, "string", "Mirror Image","position",[0 300 350 50], "callback", "mir()");
b5 = uicontrol ("parent", p, "string", "gray img","position",[0 100 350 50], "callback", "gryaja()");
b6 = uicontrol ("parent", p, "string", "Rescale","position",[0 150 350 50], "callback", "scl()");
b7 = uicontrol ("parent", p, "string", "Rescale","position",[0 200 350 50], "style", "slider");
function clract
  clear;
endfunction
global result;
global file = [];
global ori = [];
function dirask
  clear
  global file;
  global ori;
  global result;
  h = helpdlg ("On this Program you will be asked the directory of image first, then you will be asked your image file\nClick 'OK' if you understood")
  dirname = uigetdir("", "Your Directory First")
  dirname = strcat(dirname, "/");
  filename = uigetfile(dirname, "Pick Your File")
  file = strcat(dirname, "/", filename);
  ori=imread(file);
  figure(2)
  imshow(ori)
  result = [];
endfunction
function gryaja()
  global ori;
  global result;
  if isequal(result, [])
    %ex1.m  % Load the image file and store it as the variable I. 
    siap = ori;
  else
    %ori = result;
    siap = result;
  endif
  %Membaca Image Citra
  % Membuat Image Citra Menjadi Grayscale
  gry = rgb2gray(siap);
  result = gry;
  figure(3);
  imshow(gry); 
  title('Grayscale');
endfunction
function crop()
  global file;
  global result;
  if isequal(result, [])
    %ex1.m 
    I=imread(file); % Load the image file and store it as the variable I. 
  else
    I = result;
  endif
  
  % Type "whos" in order to find out the size and class of all stored variables. 
  save I 
  % Save the variable I. 
  ls 
  % List the files in your directory. 
  % There should now be a file named "I.mat" in you directory % containing your variable I.
  %ex2.m 
  clear 
  % Clear Matlab's memory. 
  load I 
  % Load the variable I that we saved above. 
  % Check that it was indeed loaded. 
  % Display the image 
  
  I=im2double(I); 
  % Convert the variable into double. 
  [r c dim]=size(I); 
  resoaja = inputdlg("How many pixel do want to crop");
  resoku = str2num(resoaja{1});
  % Check that the variable indeed was converted into double % The next procedure cuts out the upper left corner of the image % and stores the reduced image as Ired. 
  for i=resoku+1:c
  for j=resoku+1:r
  temppict(i-resoku,j-resoku)=I(i,j);
  end
  end 
  result = temppict;
  % Check what variables you now have stored. 
  figure(3) 
  warning("off", "print.m: fig2dev binary is not available")
  imshow(result) 
  % Display the reduced image.
endfunction
function mir()
  global file;
  global result;
  if isequal(result, [])
    %ex1.m 
    img=imread(file); % Load the image file and store it as the variable I. 
  else
    img = result;
  endif
    
  % Reverse the element in each row
  result = flip(img, 2);
    
  % Display the mirror image
  figure(3)
  imshow(result); 
  title('Mirror image');
endfunction
function scl()
  
  global file;
  global result;
  global inpreso;
  resoaja = [];
  pkg load image;
  if isequal(result, [])
    %ex1.m 
    img=imread(file); % Load the image file and store it as the variable I. 
  else
    img = result;
  endif
  resoaja = inputdlg("input ur reso");
  resoku = str2num(resoaja{1});
  J=imresize(img,[resoku resoku]);
  result = J;
  figure(3)
  imshow(J);
endfunction

