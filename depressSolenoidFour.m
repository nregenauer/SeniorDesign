function depressSolenoidFour(arduinoHandle)
    %handle serial communicatons with arduino
    %character 't' transmitted to depress fourth solenoid
    fwrite(ardunioHandle,'t','char')
    
    %when arduino recieves a 't', it should depress fourth solenoid 
    
    confirm = fread(arduinoHandle, 1)
    %for now, just saying we have 1 character that lets us know what
    %happened during motor control operation
    %make sure everything went well -> just return a
    %if not, return an error! -> return z
    if confirm == 'a'
        %no errors occured
        disp('All solenoids raised!')
    end
    if confirm == 'z'
        disp('Error!')
    end