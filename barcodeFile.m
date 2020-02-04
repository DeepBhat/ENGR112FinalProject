function [materialCode,materialString,type1,type2] = barcodeFile(n)
%Reads from barcode text files created by ;abview

if n==1
    file = fopen('barcode_text_test.txt','r+');
elseif n==2
    file = fopen('barcode_text_test_2.txt','r+');
else
    error('n is either 1 or 2');
end

if ~file
    error('File does not exist');
end

stringCode = fscanf(file,'%s');
for i=1:8
    intCode(i) = str2double(stringCode(i));
end

materialCode = intCode(1:3);
typeCode = intCode(4:8);

materialCode = fliplr(materialCode);
typeCode = fliplr(typeCode);

materialCode = binaryVectorToDecimal(materialCode);
typeCode = binaryVectorToDecimal(typeCode);

[materialString,type1,type2] = barcodeDecoder(materialCode,typeCode);

fprintf('%s\nNumber of pellets of type 1: %d\nNumber of pellets of type 2: %d',materialString,type1,type2);
fprintf('\n\n\n');

fclose(file);
end
