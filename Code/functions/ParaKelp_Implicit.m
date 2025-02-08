function kelp = ParaKelp_Implicit(tmax)

% Description:
% sets para values for kelp portion of the model
% relevant to PredUrchinKelp_ImplicitCC.m


% Recruitment
    % yearly incomming settlers per kg adult standing kelp
    % (zoospore production and successful fertilization and settlement of spore)
    % mean value
    kelp.RK = 7*10^4; % 4*10^4; % 

    % temporal stdev (noise)
    % normalised
    kelp.RKstdv = 0.389;%  0; % 

    % strength of denisity dependence (shading by local adults)
    % smaller = weaker effect = higher numbers
    % set so that kg.60m^2 is within the range of Channel Islands (~ 700-800kg.60m2)
    kelp.mu = 0.0000035; % 0.00035; %   

        % spatial variance in kelp densitites 
        % (for use in scale transition to landscape)
        % value from PISCO_kelp-urchin-sheephead_data.Rmd
        kelp.muvar = 189090;

    % Recruitment timing
    % vector that decitates if, and how much, reproduction occurs in that time step
    % [winter, spring, summer, autumn]
    % summer & autum peaks, no adult standing on winter
    % kelp.RTk = repmat([0.25 0.25 0.25 0.25],1,tmax/4); 
    kelp.RTk = repmat([0 0.6 0.4 0],1,tmax/4);
       
   
% Growth/Maturation    
    % growth rate season to season
    kelp.g = 10.825; % 6.825; % 


% Mortality/survival
    % change in standing kelp biomass 
    % can including seasonal variation here [winter, spring, summer, autumn]
    kelp.lambda = repmat([0 1 0.8 0.6],1,tmax/4);
    % kelp.lambda = repmat([0 1 0.9 0.8],1,tmax/4);
    % kelp.lambda = repmat([0 1 1 1],1,tmax/4);

    % standing (juvenile + adult) kelp retension
    kelp.rS = 0.5688; % 0.83; %        

    % drift production [0,1]
    % (standing kelp mortality)
    % low = more kelp, high = more drift
    kelp.c = 0.9; % 

    % drift retention [0,1]
    % low = less retained, high = more retained
    kelp.rD = 0.8; % 0.7; %  0.1; % 

    % decomposition [0,1]
    % low = slower decomp, high = fast decomp
    kelp.d = 0.1; % 0.9;% 


% Grazing
    % attack rates (of urchin stage j on kelp stage i)
    % (p.c. grazing mortality in absence of conspecifics)
    kelp.aij = [ 0  0.5;
                 0  0.5;
                 1  0 ];

    % max prey consumed (1/handling time) 
    % (of urchin stage j on kelp stage i)    
    kelp.bhij = [ 0  2.985;  
                  0  2.985;
                  2.985  0 ];

    % not seasonal
    % kelp.hij = repmat(hij.*reshape([1 1 1 1],1,1,4),1,1,1,tmax/4);

    % including seasonal variation
    % [winter spring summer autum]
    kelp.hij = repmat(kelp.bhij.*reshape([1 0.9 1.15 1.2],1,1,4),1,1,1,tmax/4);
    % kelp.hij = repmat(kelp.bhij.*reshape([0.2 0.7 1.1 1.1],1,1,4),1,1,1,tmax/4);
    %% ask about this one 
 


end