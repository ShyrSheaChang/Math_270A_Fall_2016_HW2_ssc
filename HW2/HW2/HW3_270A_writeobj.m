function HW3_270A_writeobj

A = csvread('xn.txt');
num_file = size(A,1);
N = size(A,2);

orig_side = 0.2;
orig_spacing = mean(A(1,2:N) - A(1,1:(N-1)));

for i_file = 1:num_file
    xn = A(i_file,:).';
    spacing = zeros(N,1);
    spacing(2:(N-1)) = (xn(3:N)-xn(1:(N-2)))/2;
    spacing(1) = xn(2)-xn(1);
    spacing(N) = xn(N)-xn(N-1);
    side = sqrt(orig_side^2*orig_spacing./spacing);
    if i_file < 10
        file = fopen(['file00' num2str(i_file) '.obj'],'w');
    elseif i_file < 100
        file = fopen(['file0' num2str(i_file) '.obj'],'w');
    else
        file = fopen(['file' num2str(i_file) '.obj'],'w');
    end
    xn_x = square_rep_vec(4*ones(1,N),xn.').';
    xn_y = zeros(4*N,1);
    xn_y(1:4:4*N-3) = side;
    xn_y(2:4:4*N-2) = side;
    xn_y(3:4:4*N-1) = -side;
    xn_y(4:4:4*N) = -side;
    xn_z = zeros(4*N,1);
    xn_z(1:4:4*N-3) = side;
    xn_z(2:4:4*N-2) = -side;
    xn_z(3:4:4*N-1) = -side;
    xn_z(4:4:4*N) = side;
    xn_obj = [xn_x xn_y xn_z];
    fprintf(file,'v %f %f %f\n',xn_obj.');
    fprintf(file,'\n');
    fprintf(file,'f %d %d %d\n',[1 2 3]);
    fprintf(file,'f %d %d %d\n',[1 3 4]);
    tri_vertices = [[1:4:(4*N-7);5:4:(4*N-3);6:4:(4*N-2)],[1:4:(4*N-7);2:4:(4*N-6);6:4:(4*N-2)] ...
        ,[6:4:(4*N-2);7:4:(4*N-1);3:4:(4*N-5)],[6:4:(4*N-2);2:4:(4*N-6);3:4:(4*N-5)]...
        ,[3:4:(4*N-5);8:4:(4*N);7:4:(4*N-1)],[3:4:(4*N-5);8:4:(4*N);4:4:(4*N-4)]...
        ,[8:4:(4*N);1:4:(4*N-7);4:4:(4*N-4)],[8:4:(4*N);1:4:(4*N-7);5:4:(4*N-3)]];
    fprintf(file,'f %d %d %d\n',tri_vertices);
    fprintf(file,'f %d %d %d\n',[4*N-3 4*N-1 4*N]);
    fprintf(file,'f %d %d %d\n',[4*N-3 4*N-1 4*N-2]);
    
    
    
    fclose(file);
end
     



end

