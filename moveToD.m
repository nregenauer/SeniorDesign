function moveToD(arduinoHandle)
    %handle serial communicatons with arduino
    %character 'd' transmitted to move to D string
    %actual motor control operations handled by arduino code
    fwrite(ardunioHandle,'d','char')
    
    %when arduino recieves an 'd', it should move to D string
    
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