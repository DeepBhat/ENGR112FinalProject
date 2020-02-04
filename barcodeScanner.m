function [] = barcodeScanner()
file = fopen('Barcode_Scanner.txt','wt+'); %This will write data as string on the text file
file2 = fopen('Barcode_Pellet_Identifier.txt','wt+'); %This will write only integer data on text file, to make it readable for Pellet Identifier

for i=1:2
    
    [materialCode,materialString,type1,type2] = barcodeScan();
    %Material code: decimal, Material string: string, t1,t2 : number of
    %types of each marble

    materialWrite = [materialCode,materialString,type1,type2]; %Creates an array with string and integer data, for writing data as string in text file
    materialWriteNumber = [materialCode,type1,type2]; %Creates an array with just integer data, for writing data that can be read by pellet feeder

    fprintf(file,'%s\t%s\t%s\t%s\r\n',materialWrite); %Enter data as string on text file
    fprintf(file2,'%d %d %d\r\n',materialWriteNumber); %Enter data as decimal on text file
    
end

type('Barcode_Scanner.txt')
fclose(file);
fclose(file2);
return