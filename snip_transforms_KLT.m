N=100; %number of vectors
K=4;   %vector dimension
line=1:N*K; %straight line
noisePower=2; %noise power in Watts
temp=transpose(reshape(line,K,N)); %block signal
x=temp + sqrt(noisePower) * randn(size(temp)); %add (AWGN) noise

media = mean(x);
x_centralizado = x - media; %subtrai a média dos dados

covariance = cov(x_centralizado); %calcula a matriz de covariância
[pc, lambdas] = eig(covariance); %obtém eigevectors e eigenvalues(matriz de variâncias)
lambdas = diag(lambdas); %extrai a matriz diagonal
[temp, indices] = sort(-1*lambdas); %ordem decrescente
lambdas = lambdas(indices); %reordena
A = pc(:,indices); %obtém os principais compotentes (colunas de A)
Ah=A'; %matriz da transformada direta (hermitiano de A)

x_klt = x_centralizado * A;
x_reconstruido =  x_klt * Ah + media;


z=transpose(x_reconstruido); plot(z(:)) %prepare for plot
