function rho = LindbladME_TD(rho0,H,L,gam,t)

    %t especifies the time domain of the evolution
    %rho is of dimension D x D
    %L has dimensions of D x D x (number of channels)
    %Time dependent parameters have to be especified at the times t
    %gamma has dimensions of (number of channels) x time
    %H has dimensions of D x D x time

    %Determine number of Lindblad operators
    N=length(gam(:,1));
    
    %Determine dimension of system
    D=length(L(:,1,1));
    
    T=zeros(D^2,D^2,length(t));
    % Compute dynamical map generator for each time
    for h=1:length(t)
        for i=1:D^2
            F_i=zeros(D);
            F_i(i)=1;
            for j=1:D^2
                F_j=zeros(D);
                F_j(j)=1;
                disipator=zeros(D);
                for k=1:N
                    disipator=disipator+gam(k,h)*(L(:,:,k)*F_j*L(:,:,k)'-1/2*(L(:,:,k)'*L(:,:,k)*F_j+F_j*L(:,:,k)'*L(:,:,k)));
                end
                unitary=-1.i*(H(:,:,h)*F_j-F_j*H(:,:,h));

                T(i,j,h)=trace(F_i'*(disipator+unitary));
            end
        end
    end
         
    % Vectorize initial density matrix
    P0 =reshape(rho0,[ ],1);
    
    % Solve ODE
    sol = ode45(@(x,p) ME_TD(x,p,T,t),t,P0);
    
    %Return to matrix form
    rho = reshape(deval(sol,t),D,D,[ ]);
    
    function dp = ME_TD(x,p,T,t)
        Tperm = permute(T,[3 1 2]);
        Tint=squeeze(interp1(t,Tperm,x))
        
        dp = Tint*p;
    end

end