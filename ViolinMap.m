%ViolinMap.m 
%Author: Nicole Regenauer
%works in conjunction with midiInfo.m, readmidi.m, and makeViolinNeck.m
%parses MIDI array, creates an array with only relevant data
%also simulates finger positions on violin neck

%storing the first set of MIDI positions for each note
MIDI = {'55','56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83'};
%creating a variable to store length of MIDI note list -> used later
len = length(MIDI);
%storing "default" positions for each note
pos = {[0,0],[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[1,0],[1,1],[1,2],[1,3],[1,4],[1,5],[1,6],[2,0],[2,1],[2,2],[2,3],[2,4],[2,5],[2,6],[3,0],[3,1],[3,2],[3,3],[3,4],[3,5],[3,6],[3,7]};
%mapping MIDI positions to appropriate MIDI character
MIDImap = containers.Map(MIDI,pos);
%disp(MIDImap); -> error checking
%storing the second set of MIDI positions for each note
%MIDI = {55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83};
%map2=  {[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,7],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[1,7],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[2,7],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]};
%MIDImap2 = containers.Map(MIDI,map2);
%in myfile.txt, first argument is track-> we don't care
%second argument is channel -> we don't care
%third argument is MIDI note number -> MOST IMPORTANT
%fourth argument is velocity -> for now, we don't care
%fifth argument is start time -> we care
%sixth argument is end time -> we care
%7th and 8th arguments are messages -> we don't care

%opening up the file we created for reading
fileID = fopen('myFile.txt','r');
%creating file to store parsed data
file = fopen('output.dat','w');
%reading one line at a time into intro
intro = textscan(fileID,'%s',8,'Delimiter',',');    
%creating an array to store all valid note outputs
array = [];
while(~feof(fileID))
        %returning MIDI number
        MIDI_num = intro{1}{3};
        %disp(MIDI_num); -> displaying values for error checking purposes
        m = -1;
        for i=1:len
            %going through our MIDI list to see if the current note is
            %playable on a violin
            y=MIDI{i}
            %if we find the note, store it in the playback array
            if strcmp(y,MIDI_num)==1
                m = double(MIDImap(MIDI_num));
                array=[array {m}];
                start_time=intro{1}{5};
                end_time=intro{1}{6};
                %this is not working yet, figure out why
                %line = [m, start_time, end_time]
                %dlmwrite('output.dat',line)
            end
            %if we don't find it, print an error
            %depending on how things go later, may want to change this
            %might break execution of program rather than just raising an
            %error
            if (m == -1)
                if (i==len)
            %if we haven't found the note and we are at the end of the file 
                    disp('ERROR: Invalid MIDI note found in file');
                end
            end;
            
        end;
        %returning start time of note, end time of note
        %we will use this when we start integrating this code with the
        %motors
        %disp(intro{1}{4});
        %start_time=intro{1}{5};
        %disp(start_time); -> printing for error checking purposes
        %end_time=intro{1}{6};
        %disp(end_time); -> printing for error checking purposes
        
        %moving foward to scan the next line of the file
        intro = textscan(fileID,'%s',8,'Delimiter',',');    
    end;    
    
    len = length(array)
    makeViolinNeck
    %printing each note in file on simulated violin neck in order
    for i=1:len
        r=single(array{i})
        x(i)=plot(r(1),r(2),'x','markersize',20)
        %prompt={'Press any key for next note, enter "END" to quit'}
        prompt=sprintf('Press continue for next note, break to quit')
        title='Continue or break'
        button = questdlg(prompt, title, 'Continue', 'Break','Continue');
        if strcmpi(button,'break')
            close all
            break
        end
        delete(x(i))
       
    end
    


    
    
    
  
    
