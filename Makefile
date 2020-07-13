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

SUBDIRS = src 
SERVER=`yq r ./config.yaml server`
INSTALL_PATH=`yq r ./config.yaml install_path`
STAGING_PATH=`yq r ./config.yaml staging_path`
LOCAL_PATH=`yq r ./config.yaml local_path`
FILE = resume

all: $(SUBDIRS)

dist: all
	mkdir -p $(LOCAL_PATH)
	cp ./src/$(FILE).pdf $(LOCAL_PATH)
	cp ./src/$(FILE).min.html $(LOCAL_PATH)/$(FILE).html

publish: dist
	ssh $(SERVER) mkdir -p $(STAGING_PATH)
	scp $(LOCAL_PATH)/* $(SERVER):$(STAGING_PATH)/
	ssh $(SERVER) install -b $(STAGING_PATH)/* $(INSTALL_PATH)/
	 
distclean: 
	for subdir in $(SUBDIRS); do \
		target=`echo $@ | sed s/-recursive//`; \
		(cd $$subdir && $(MAKE) $(MAKEDEFS) distclean) || exit 1;\
	done
	rm -f *.pdf 
	rm -rf $(LOCAL_PATH)

clean:
	for subdir in $(SUBDIRS); do \
		target=`echo $@ | sed s/-recursive//`; \
		(cd $$subdir && $(MAKE) $(MAKEDEFS) clean) || exit 1;\
	done

$(SUBDIRS): 
	cd $@ && $(MAKE) 
	

.PHONY: clean distclean all publish subdirs $(SUBDIRS)

