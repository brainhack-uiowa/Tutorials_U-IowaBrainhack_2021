%% Function to call for example
function mat = Make_Mat(nrows,ncols)
    mat = ones(nrows,ncols);
    for c = 1:ncols
        for r = 1:nrows
            if r == c
                mat(r,c) = 2;
            elseif abs(r-c) == 1
                mat(r,c) = -1;
            else
                mat(r,c) = 0;
            end

        end
    end
end
