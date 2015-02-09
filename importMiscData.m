%%% Author: William Michael Mortl
%%% Feel free to use this code for educational purposes, any other use
%%%     requires citations to: NHanes study, William Michael Mortl,
%%%     Sriram Sankaranaraynan, and Fraser Cameron

BMX = {'BMX', 'BMX_B', 'BMX_C', 'BMX_D', 'BMX_E', 'BMX_F'}; 
for itr = 1:6
    filein = [BMX{itr} '.XPT'];
    fileout = [BMX{itr} '.mat'];
    fprintf('\nImporting %s...\n', filein);
    dataBMX = xptread(filein);
    dataBMX = double(dataBMX);
    fprintf('Exporting %s...\n', fileout);
    save(fileout, 'dataBMX');
end

BMX = {'DEMO', 'DEMO_B', 'DEMO_C', 'DEMO_D', 'DEMO_E', 'DEMO_F'}; 
for itr = 1:6
    filein = [BMX{itr} '.XPT'];
    fileout = [BMX{itr} '.mat'];
    fprintf('\nImporting %s...\n', filein);
    dataDemo = xptread(filein);
    dataDemo = double(dataDemo);
    fprintf('Exporting %s...\n', fileout);
    save(fileout, 'dataDemo');
end