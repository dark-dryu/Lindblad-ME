function rho = LindbladME(rho0,H,L,gam,t)


    

    %Determine number of Lindblad operators
    N=length(gam);
    
    %Determine dimension of system
    D=length(L(:,1,1));
    
    T=zeros(D^2);
    % Compute dynamical map generator
    for i=1:D^2
        F_i=zeros(D);
        F_i(i)=1;
        for j=1:D^2
            F_j=zeros(D);
            F_j(j)=1;
            disipator=zeros(D);
            for k=1:N
                disipator=disipator+gam(k)*(L(:,:,k)*F_j*L(:,:,k)'-1/2*(L(:,:,k)'*L(:,:,k)*F_j+F_j*L(:,:,k)'*L(:,:,k)));
            end
            unitary=-1.i*(H*F_j-F_j*H);
            
            T(i,j)=trace(F_i'*(disipator+unitary));
        end
    end
         
    % Vectorize initial density matrix
    P0 =reshape(rho0,[ ],1);
    
    % Solve ODE
    t_span = t;
    sol = ode45(@(t,p) ME(p,T),t_span,P0);
    
    %Return to matrix form
    rho = reshape(deval(sol,t),D,D,[ ]);
    
    function dp = ME(p,L)
        dp = L*p;
    end

end