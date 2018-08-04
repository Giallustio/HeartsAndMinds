#!/usr/bin/python3

# This add header to Hearts and Minds mission (HaM)
from pathlib import Path

def btc_fnc_generate_header(file_name, folder_name):
    function_name = "btc_fnc_%s_%s" % (folder_name, file_name)
    header_for_HaM = '''
/* ----------------------------------------------------------------------------
Function: %s

Description: 
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call %s;
    (end)

Author: 
    Giallustio

---------------------------------------------------------------------------- */

''' % (function_name, function_name)
    return header_for_HaM

def btc_fnc_write_header(header, path, text_in_file):
    text_in_file_with_header = path.write_text(header + text_in_file)
    return text_in_file_with_header

def btc_fnc_get_file_folder_name(path):
    file_name = (path.name)[:-4:]
    folders_name = path.parts
    folder_name = folders_name[-2]
    return file_name, folder_name

folder_of_HaM = r"..\=BTC=co@30_Hearts_and_Minds.Altis\core\fnc"
# Scan folder and subfolder for .sqf files
pathlist = Path(folder_of_HaM).glob('**/*.sqf')
for path in pathlist:
    text_in_file = path.read_text()
    file_name, folder_name = btc_fnc_get_file_folder_name(path)
    # Add header to .sqf without header
    if (file_name != "compile" and text_in_file.find("/* ----------------------------------------------------------------------------") == -1):
        header = btc_fnc_generate_header(file_name, folder_name)
        btc_fnc_write_header(header, path, text_in_file)
