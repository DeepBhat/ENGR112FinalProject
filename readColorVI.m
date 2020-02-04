function [color] = readColorVI()
%Calls the VI for reading color in RGB mode, and returns the array
%containing values R,G,B respectively

e=actxserver('LabVIEW.Application');
vipath='c:\Documents\1st Year\General Engineering\ENGR112\MATLAB\Project\test.vi';
vi=invoke(e,'GetVIReference',vipath);
%vi.SetControlValue('in',4)
vi.Run
color = vi.GetControlValue('out');

end