#!/bin/sh
#    YAR Writer, Resume Generator 
#    Copyright(C)2020 John Hart <john@hackade.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#	Author: John Hart <john@hackade.com>
GIT=/usr/bin/git
CUT=/usr/bin/cut
TR=/usr/bin/tr

VERSION=`$GIT rev-parse HEAD|$CUT -c32-40`

files=$(git status --porcelain)
if [[ $? != 0 ]]; then
   DIRT="ERROR" 
elif [[ $files ]]; then
   DIRT="-Dev"  
else
   DIRT="" 
fi

OUT="$VERSION$DIRT"
echo $OUT
