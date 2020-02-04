function [ materialType, amount1, amount2 ] = barcodeDecoder( material, number )

    wg = "White Glass, Type 1: Large, Type 2: Small";
    rg = "Red Glass, Type 1: Large, Type 2: Small";
    bg = "Blue Glass, Type 1: Large, Type 2: Small";
    hd = "HDPE, Type 1: HDPE, Type 2: HDPE";
    
    switch material
     
        case 1
            materialType = wg;
        
        case 2 
            materialType = rg;
        
        case 3
            materialType = bg;
        
        case 4 
            materialType = hd;
        otherwise
            materialType = "error";
        
    end

    switch number
        
        case 1
            amount1 = 0;
            amount2 = 0;
            
        case 2
            amount1 = 1;
            amount2 = 0;
            
        case 3
            amount1 = 2;
            amount2 = 0;
            
        case 4
            amount1 = 3;
            amount2 = 0;
            
        case 5
            amount1 = 0;
            amount2 = 1;
            
        case 6
            amount1 = 1;
            amount2 = 1;
            
        case 7
            amount1 = 2;
            amount2 = 1;
            
        case 8
            amount1 = 3;
            amount2 = 1;
            
        case 9
            amount1 = 0;
            amount2 = 2;
            
        case 10
            amount1 = 1;
            amount2 = 2;
            
        case 11
            amount1 = 2;
            amount2 = 2;
            
        case 12
            amount1 = 3;
            amount2 = 2;
            
        case 13
            amount1 = 0;
            amount2 = 3;
            
        case 14
            amount1 = 1;
            amount2 = 3;
            
        case 15
            amount1 = 2;
            amount2 = 3;
            
        case 16
            amount1 = 3;
            amount2 = 3;
        otherwise
            amount1 = -1;
            amount2 = -1;
            
            
    end

end

