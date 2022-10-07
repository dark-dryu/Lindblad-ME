# Lindblad-ME

This simple matlab function allows you to compute the density matrix evolution under a Lindblad Master Equation
$ \frac{d \rho(t)}{dt} = -i [H,\rho(t)] + \sum_k \gamma_k L_k^\dagger \rho(t) L_k - \frac{1}{2} \{ L_k^\dagger L_k,\rho(t)\} $
 The function requires you to specify the Lindblad operators and their corresponding rates. 

# How it works

This function vectorizes the density matrix $|i\rangle \langle j| \to |i,j\rangle$. Then the function computes the linear map 


# Dependencies

Dr. Cubbit MATLAB suite found in: https://www.dr-qubit.org/matlab.html
