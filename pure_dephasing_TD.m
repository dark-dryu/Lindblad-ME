%define pauli matrices
sx=[[0 1];[1 0]];
sy=[[0 -1.i];[1.i 0]];
sz=[[1 0];[0 -1]];
I2=[[1 0];[0 1]];

%time parameter
t=0:0.1:10;
D=2;
%Hamiltonian parameters
H=zeros(D,D,length(t));
omega = 2;
lambd_shift=omega/5*sin(omega/2*t); %make up example
for i=1:length(t)
    H(:,:,i)=(omega+lambd_shift(i))/2*sz;
end

%Lindblad operators and rates
delta=1;
lambda=0.2;
gamma=exp(-lambda*t).*(cos(delta*t)+lambda/delta*sin(delta*t)); %invented example
L(:,:,1)=sz;

%Initial states
rho0=ones(2)/2;



%Solving ME
rho=LindbladME_TD(rho0,H,L,gamma,t);

%Plotting solution
Wre=abs(squeeze(rho(1,2,:)));
% Wim=imag(squeeze(rho(1,2,:)));
plot(t,Wre,'LineWidth',2)
hold on
% plot(t,Wim,'LineWidth',2)
xl=xlabel('$t$','Interpreter','latex');
yl=ylabel('$|\rho_{+-}(t)|$','Interpreter','latex');
title('Pure dephasing of a qubit','Interpreter','latex');
% lgd=legend('$\mathcal{R}[\rho_{+-}(t)]$','$\mathcal{I}[\rho_{+-}(t)]$','Interpreter','latex' ,'NumColumns',1);
% lgd.FontSize=20;
% lgd.Location='northeast';
tcks=gca;
tcks.TickLabelInterpreter = 'latex';
tcks.FontSize=28;
xl.FontSize=28;
yl.FontSize=28;
ti.FontSize=18;
grid on
box on
% xlim([0 4])
ylim([0 1])
tcks.LineWidth=1.5;


