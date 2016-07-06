if exist(fullFileName, 'file')
  % File exists.  Do stuff....
else
  % File does not exist.
  warningMessage = sprintf('Warning: file does not exist:\n%s', fullFileName);
  uiwait(msgbox(warningMessage));
end