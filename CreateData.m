
%Folder where we have the data
rutas.datos = 'Data/training2017/training2017/';

%Read the name of the files in the file and save the .mat ones
ext = '.mat'; 
IDs = ls(rutas.datos);
names = split(IDs);
mat_names = []
for i = 1:(size(names,1)-1)
    name = split(names(i),'.');
    exten = name(2);
    tr = strcmp(exten,"mat");
    if tr == 1
        %signal = ['Data/training2017/training2017/' names(i)]
        str = append(rutas.datos,names(i))
        mat_names = [mat_names; str];
    end
end
B = sort(mat_names)

%Load the signals with the indicated names
signals = []
for j = 1:size(B)
    cn = B{j}
    rawstructure = load(cn);
    signals = [signals; rawstructure]
end

%Write the signals in a csv file
%csvwrite('Signals.csv', signals)
myTable = struct2table(signals);
writetable(myTable,'Signals.csv','delimiter',',');
