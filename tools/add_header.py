#!/usr/bin/python3

# This add header to Hearts and Minds mission (HaM)
from pathlib import Path
import re

def btc_fnc_generate_header(file_name, folder_name, parameters_array):
    function_name = "btc_fnc_%s_%s" % (folder_name, file_name)
    parameters_string = ''
    for param in parameters_array:
        parameters_string = parameters_string + ('''    %s - <>\n''' % (param))

    header_for_HaM = '''
/* ----------------------------------------------------------------------------
Function: %s

Description: 
    Fill me when you edit me !

Parameters:
%s
Returns:

Examples:
    (begin example)
        _result = [] call %s;
    (end)

Author: 
    Giallustio

---------------------------------------------------------------------------- */

''' % (function_name, parameters_string, function_name)
    return header_for_HaM

def btc_fnc_write_header(header, path, text_in_file):
    text_in_file_with_header = path.write_text(header + text_in_file)
    return text_in_file_with_header

def btc_fnc_get_file_folder_name(path):
    file_name = (path.name)[:-4:]
    folders_name = path.parts
    folder_name = folders_name[-2]
    return file_name, folder_name

def btc_fnc_get_param(text):
    re2='((?:[a-z][a-z0-9_]*))'   # Double Quote String 1

    rg = re.compile(re2,re.IGNORECASE|re.DOTALL)
    m = rg.search(text)
    if m:
        string1=m.group(1)
        return '_' + string1
    return ""

def btc_fnc_get_params(text):
    re2='("_.*?")|'   # Double Quote String 1
    re3='(\\["_.*?")'

    pattern = re.compile(re2+re3,re.IGNORECASE|re.DOTALL)
    parameters_array = []
    for param in re.findall(pattern, text):
        first, second = param
        if first != '':
            parameters_array.append(btc_fnc_get_param(first))
        if second != '':
            parameters_array.append(btc_fnc_get_param(second))
    return parameters_array

def btc_fnc_detect_params(txt):
    re1='(params \\[.*?\\]\\;)'  # Word 1
    rg = re.compile(re1,re.IGNORECASE|re.DOTALL)
    m = rg.search(txt)
    if m:
        parameters = m.group(1)
        return parameters
    return ""

folder_of_HaM = r"..\=BTC=co@30_Hearts_and_Minds.Altis\core\fnc"
# Scan folder and subfolder for .sqf files
pathlist = Path(folder_of_HaM).glob('**/*.sqf')
for path in pathlist:
    text_in_file = path.read_text()
    file_name, folder_name = btc_fnc_get_file_folder_name(path)
    # Add header to .sqf without header
    if (file_name != "compile" and text_in_file.find("/* ----------------------------------------------------------------------------") == -1):
        parameters = btc_fnc_detect_params(text_in_file)
        parameters_array = []
        if parameters != "":
            parameters_array = btc_fnc_get_params(parameters)
        header = btc_fnc_generate_header(file_name, folder_name, parameters_array)
        btc_fnc_write_header(header, path, text_in_file)
