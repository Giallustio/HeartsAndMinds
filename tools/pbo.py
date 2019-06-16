#! /usr/bin/env python3
'''
Copyright (C) 2019 D. Ottavio

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
'''
# pylint: disable=C

import io
import hashlib
import os
import pathlib


class PboWriter:
    '''
    A class for packing files into an Arma 3 pbo file.  This
    implementation is based on the pbo specifications found here:

    https://community.bistudio.com/wiki/PBO_File_Format
    '''

    def __init__(self, filepath):
        '''Create a new PboWriter.

        @param filepath - full path to the pbo output file

        '''

        self.filepath = filepath
        if self.filepath.endswith(".pbo") == False:
            self.filepath = filepath + ".pbo"

        self.ostream   = io.FileIO(self.filepath, mode="w")
        self.sha       = hashlib.sha1()
        self.nullBytes = bytearray(b'\x00\x00\x00\x00')

    def __enter__(self):
        return self

    def __exit__(self, exception_type, exception_value, traceback):
        self.close()

    def __write(self, data):
        '''Write raw data to the pbo data stream and update the SHA-1
        checksum

        @param data - bytes

        '''
        self.ostream.write(data)
        self.sha.update(data)

    def __writeNull(self):
        '''Write a null byte to the pbo data stream.'''
        self.__write(b'\x00')

    def __writeHeader(self, filepath, relativePath, packMethod=0):
        '''Write a head entry to the pbo data stream.

        @param filepath - full path to the file for this entry

        @param relativePath - the top level path relative to the root
        of the pbo directory

        '''
        size = 0
        if len(filepath) > 0:
            stat = os.stat(filepath)
            size = stat.st_size
            winPath = pathlib.PureWindowsPath(relativePath)
            self.__write(bytes(str(winPath), "ascii"))           # pathname

        self.__writeNull()                                       # null byte
        self.__write(packMethod.to_bytes(4, byteorder="little")) # pack method
        self.__write(self.nullBytes)                             # original size if compressed
        self.__write(self.nullBytes)                             # reserved
        self.__write(self.nullBytes)                             # timestamp
        self.__write(size.to_bytes(4, byteorder="little"))       # size of file

    def __writeNullHeader(self):
        '''Write an empty header to the pbo data stream.'''
        self.__writeHeader("", "")

    def __writeFile(self, filepath):
        '''Write a file to the pbo data stream.

        @param filepath - full path of the file to write
        '''
        maxBuffLen = 4096

        with io.FileIO(filepath, mode="r") as istream:
            while True:
                buff = istream.read(maxBuffLen)
                if len(buff) == 0:
                    return

                self.__write(buff)

    def close(self):
        self.ostream.write(b'\x00')
        self.ostream.write(self.sha.digest())
        self.ostream.close()


    def writeDir(self, directoryPath):
        '''Write the contents of a directory into a pbo file.

        @param directoryPath - full path of the directory to write
        into the pbo file

        '''

        # Walk the directory twice.  First pass write the header
        # entries, second write the data block.
        for root, _, files in os.walk(directoryPath, onerror=walkError):
            rootPath = pathlib.Path(root)
            for f in files:
                path = rootPath / f
                relativePath = path.relative_to(directoryPath)
                self.__writeHeader(filepath=str(path), relativePath=str(relativePath))

        self.__writeNullHeader()

        for root, _, files in os.walk(directoryPath, onerror=walkError):
            rootPath = pathlib.Path(root)
            for f in files:
                self.__writeFile(str(rootPath / f))

def walkError(error):
    raise error
