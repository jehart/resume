dnl    YAR Writer, Resume Generator 
dnl    Copyright(C)2020 John Hart <john@hackade.com>
dnl
dnl    This program is free software: you can redistribute it and/or modify
dnl    it under the terms of the GNU General Public License as published by
dnl    the Free Software Foundation, either version 3 of the License, or
dnl    (at your option) any later version.
dnl
dnl    This program is distributed in the hope that it will be useful,
dnl    but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl    GNU General Public License for more details.
dnl
dnl    You should have received a copy of the GNU General Public License
dnl    along with this program.  If not, see <https://www.gnu.org/licenses/>.
dnl
dnl
dnl    Author John Hart <john@hackade.com>
dnl
define(`__VERSION',esyscmd(/bin/sh ./conf/version.sh |tr -d '\n'))dnl
define(`__LONGVERSION',esyscmd(git rev-parse HEAD| cut -c25-40 |tr -d '\n'))dnl
define(`xetexheader',`special{pdf: docinfo << 
/Creator (https://github/jehart/resume) 
/Producer (YAR v1.0)
>>}')dnl
dnl
