cat = imread('C:\Users\amaza\Pictures\Screenshots\Screenshot 2024-04-28 194450.png');
cat = im2double(cat);
sz = size(cat);
catM = zeros(sz);

rate = 100;

a = 1;
b = 1;

while b < sz(2)
    if a > ((sz(1)-1)/rate)-1
        b = b + 1;
        catM(a,b,:) = cat(a*rate,b,:);
        a = 1;
    else
        catM(a,b,:) = cat(a*rate,b,:); 
        a = a + 1;
    end
end

a = 1;
b = 1;

while b < sz(1)
    if a > ((sz(2)-1)/rate)-1
        b = b + 1;
        catM(b,a,:) = catM(b,a*rate,:);
        a = 1;
    else
        catM(b,a,:) = catM(b,a*rate,:); 
        a = a + 1;
    end
end

width = (sz(1)/rate);
height = (sz(2)/rate);
catM = imcrop(catM,[1 1 height width]);

imshow(catM)
