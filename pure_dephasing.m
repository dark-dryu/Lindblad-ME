%define pauli matrices
sx=[[0 1];[1 0]];
sy=[[0 -1.i];[1.i 0]];
sz=[[1 0];[0 -1]];
I2=[[1 0];[0 1]];

%Hamiltonian parameters
omega = 2;
H=omega/2*sz;

%Lindblad operators and rates
gamma=0.2;
L(:,:,1)=sz;

%Initial states
rho0=ones(2)/2;

%Simulation time
t=0:0.1:15;

%Solving ME
rho=LindbladME(rho0,H,L,gamma,t);

%Plotting solution
Wre=real(squeeze(rho(1,2,:)));
Wim=imag(squeeze(rho(1,2,:)));
plot(t,Wre,'LineWidth',2)
hold on
plot(t,Wim,'LineWidth',2)
xl=xlabel('$t$','Interpreter','latex');
yl=ylabel('$\rho_{+-}(t)$','Interpreter','latex');
title('Pure dephasing of a qubit','Interpreter','latex');
lgd=legend('$\mathcal{R}[\rho_{+-}(t)]$','$\mathcal{I}[\rho_{+-}(t)]$','Interpreter','latex' ,'NumColumns',1);
lgd.FontSize=20;
lgd.Location='northeast';
tcks=gca;
tcks.TickLabelInterpreter = 'latex';
tcks.FontSize=28;
xl.FontSize=28;
yl.FontSize=28;
ti.FontSize=18;
grid on
box on
% xlim([0 4])
ylim([-0.5 0.5])
tcks.LineWidth=1.5;


