# Lindblad-ME

This simple matlab function allows you to compute the density matrix evolution under a Lindblad Master Equation
$$\dot{\rho}(t) =  \mathcal{L}[\rho] = -i [H,\rho(t)] + \sum_k \gamma_k\left( L_k^\dagger \rho (t) L_k -{1\over 2} \{ L_k^\dagger L_k,\rho(t)\}\right)$$

The function requires you to specify the Hamiltonia $H$, Lindblad operators $L_k$  and their corresponding rates $\gamma_k$. 

# How it works

This function vectorizes the density matrix $|i\rangle \langle j| \to |i,j\rangle$. Then the function computes the linear map $T_{ij} = Tr(F_i^\dagger \mathcal{L} [F_j])$. This procedure allows to simply write a differential equation $|\dot{\rho(t)}\rangle = T |\rho(t)\rangle$, which is a system of ODE which is solved with the ODE45 function included in MATLAB.


# Dependencies

Dr. Cubbit MATLAB suite found in: https://www.dr-qubit.org/matlab.html
