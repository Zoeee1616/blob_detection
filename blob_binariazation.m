function [ binary_image ] = blob_binarization( image, r,c,rad)
%%BLOB_BINARIZATION
%%  creates a binary image where white is the foreground and black
%%  is the background. The white foreground is generated by the circles
%% defined by the inputs.
%%
%%  image - the raw image
%%  r - the rows at which the blobs were detected
%%  c - the cols at which the blobs were detected
%%  rad - the radius of the blobs


height=size(image,1);
width=size(image,2);
binary_image=zeros(height,width);

for index=1:size(r,1)

    % iterate over square region where blob is detected
    for row_index=round(r(index)-rad(index)):round(r(index)+rad(index))
        for col_index=round(c(index)-rad(index)):round(c(index)+rad(index))
            y=(row_index-r(index))^2;
	    x=(col_index-c(index))^2;
	    s=sqrt(x+y);
	    
            % circle equation: (x-x_offset)^2 + (y-y_offset)^2 = r^2
            % based on top/left (1,1) origin
            % dont search for pixels outside the blob region
            if(s<=rad(index))
                if(and(row_index>=1,row_index<=height))
                   if(and(col_index>=1,col_index<=width))
                       binary_image(row_index,col_index)=1;
                   end
                end
            end
            
            
        end
    end
    
end


% end of function
end
