
# paths

export MITK_SRCDIR=REPLACEME_SV_TOP_SRC_DIR_MITK
export MITK_BINDIR=REPLACEME_SV_TOP_BIN_DIR_MITK
export MITK_BLDDIR=REPLACEME_SV_TOP_BLD_DIR_MITK

# build type not used on linux
export MITK_BLDTYPE=

# primary directories to install into

mkdir -p $MITK_BINDIR/bin
mkdir -p $MITK_BINDIR/bin/plugins
mkdir -p $MITK_BINDIR/lib
mkdir -p $MITK_BINDIR/include

mkdir -p $MITK_BINDIR/bin
mkdir -p $MITK_BINDIR/lib
mkdir -p $MITK_BINDIR/include

cp -Rfl $MITK_BLDDIR/MITK-build/bin $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/MITK-build/lib $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/bin $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/lib $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/include $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/share $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/plugins $MITK_BINDIR/plugins
cp -Rfl $MITK_BLDDIR/ep/src/CTK-build/CMakeExternals/Install/include $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/src/CTK-build/CMakeExternals/Install/lib $MITK_BINDIR
cp -Rfl $MITK_BLDDIR/ep/src/CTK-build/qRestAPI-build/*.REPLACEME_SV_SO_FILE_EXTENSION $MITK_BINDIR/lib
cp -Rfl $MITK_BLDDIR/ep/src/CTK-build/qRestAPI-build/*.h $MITK_BINDIR/include
cp -Rfl $MITK_BLDDIR/ep/src/CTK-build/CTK-build/bin/* $MITK_BINDIR/bin
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/CTK-build/bin/$MITK_BLDTYPE/*CTK*.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/lib
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/CTK-build/bin/$MITK_BLDTYPE/liborg*.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/lib/plugins


# copy qRestAPI from CTK-build

mkdir -p $MITK_BINDIR/include/qRestAPI
cp -fl $MITK_BLDDIR/ep/src/CTK-build/qRestAPI/*.h $MITK_BINDIR/include/qRestAPI
cp -fl $MITK_BLDDIR/ep/src/CTK-build/qRestAPI-build/$MITK_BLDTYPE/REPLACEME_SV_LIB_FILE_PREFIXqRestAPI.REPLACEME_SV_LIB_FILE_EXTENSION $MITK_BINDIR/lib
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/qRestAPI-build/$MITK_BLDTYPE/REPLACEME_SV_LIB_FILE_PREFIXqRestAPI.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/bin
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/qRestAPI-build/$MITK_BLDTYPE/REPLACEME_SV_LIB_FILE_PREFIXqRestAPI.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/lib

# copy PythonQt from CTK-build

mkdir -p $MITK_BINDIR/include/PythonQt
cp -fl $MITK_BLDDIR/ep/src/CTK-build/PythonQt/src/*.h $MITK_BINDIR/include/PythonQt
cp -fl $MITK_BLDDIR/ep/src/CTK-build/PythonQt/src/gui/*.h $MITK_BINDIR/include/PythonQt
cp -fl $MITK_BLDDIR/ep/src/CTK-build/PythonQt-build/$MITK_BLDTYPE/REPLACEME_SV_LIB_FILE_PREFIXPythonQt.REPLACEME_SV_LIB_FILE_EXTENSION $MITK_BINDIR/lib
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/PythonQt-build/$MITK_BLDTYPE/REPLACEME_SV_LIB_FILE_PREFIXPythonQt.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/bin
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/PythonQt-build/$MITK_BLDTYPE/REPLACEME_SV_LIB_FILE_PREFIXPythonQt.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/lib

# CTK

mkdir -p $MITK_BINDIR/include/ctk

cp -fl $MITK_BLDDIR/ep/src/CTK/Libs/Core/*.h $MITK_BINDIR/include/ctk
cp -fl $MITK_BLDDIR/ep/src/CTK/Libs/Core/*.tpp $MITK_BINDIR/include/ctk
cp -fl $MITK_BLDDIR/ep/src/CTK/Libs/Scripting/Python/Core/*.h $MITK_BINDIR/include/ctk
cp -fl $MITK_BLDDIR/ep/src/CTK/Libs/Scripting/Python/Widgets/*.h $MITK_BINDIR/include/ctk
cp -fl $MITK_BLDDIR/ep/src/CTK/Libs/Visualization/VTK/Core/*.h $MITK_BINDIR/include/ctk
cp -fl $MITK_BLDDIR/ep/src/CTK/Libs/Widgets/*.h $MITK_BINDIR/include/ctk

cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/CTK-build/bin/$MITK_BLDTYPE/*.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/bin
cp -fl -d $MITK_BLDDIR/ep/src/CTK-build/CTK-build/bin/$MITK_BLDTYPE/*.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/lib
cp -fl $MITK_BLDDIR/ep/src/CTK-build/CTK-build/bin/$MITK_BLDTYPE/*.REPLACEME_SV_LIB_FILE_EXTENSION $MITK_BINDIR/lib

# copying more than needed here, but not sure how many of the subdirectories are required.
cp -Rf  $MITK_BLDDIR/ep/src/CTK/Libs/PluginFramework $MITK_BINDIR/include/ctk

for i in $(find $MITK_BLDDIR/ep/src/CTK-build -name "*Export.h"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/include/ctk
done

cp -fl $MITK_BLDDIR/MITK-build/lib/plugins/$MITK_BLDTYPE/* $MITK_BINDIR/lib

# mitk files

#cp -fl -d $MITK_BLDDIR/MITK-build/bin/$MITK_BLDTYPE/*.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/bin
#cp -fl -d $MITK_BLDDIR/MITK-build/lib/$MITK_BLDTYPE/*.REPLACEME_SV_SO_FILE_EXTENSION* $MITK_BINDIR/lib
#cp -fl $MITK_BLDDIR/MITK-build/lib/$MITK_BLDTYPE/*.REPLACEME_SV_LIB_FILE_EXTENSION $MITK_BINDIR/lib

mkdir -p $MITK_BINDIR/include/mitk
mkdir -p $MITK_BINDIR/include/mitk/configs
mkdir -p $MITK_BINDIR/include/mitk/exports
mkdir -p $MITK_BINDIR/include/mitk/ui_files
mkdir -p $MITK_BINDIR/include/mitk/Modules

cp $MITK_BLDDIR/MITK-build/*.h $MITK_BINDIR/include/mitk

#
#  plugins
#

# currently require the following plugins:
#
# org.blueberry.core.runtime  (nested)
# org.blueberry.ui.qt (nested)
# org.mitk.core.services 
# org.mitk.gui.common
# org.mitk.gui.qt.common
# org.mitk.gui.qt.common.legacy
# org.mitk.gui.qt.datamanager

for i in $MITK_SRCDIR/Plugins/org.mitk.*/src; do
    mkdir -p $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $i))
    cp -R $i/*.h $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $i))
done

for i in $MITK_SRCDIR/Plugins/org.mitk.*/src/*; do
    if [ -d $i ];then \
      mkdir -p $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $(dirname $i)))/$(basename $i); \
      cp -R $i/*.h $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $(dirname $i)))/$(basename $i); \
    fi
done

for i in $MITK_SRCDIR/Plugins/org.blueberry.*/src; do
    mkdir -p $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $i))
    cp -R $i/*.h $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $i))
done

for i in $MITK_SRCDIR/Plugins/org.blueberry.*/src/*; do
    if [ -d $i ];then \
      mkdir -p $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $(dirname $i)))/$(basename $i); \
      cp -R $i/*.h $MITK_BINDIR/include/mitk/plugins/$(basename $(dirname $(dirname $i)))/$(basename $i); \
    fi
done

for i in $(find $MITK_BLDDIR/MITK-build/Plugins -name "*Export.h"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/include/mitk/exports
done

#
# everything else
#

for i in $(dirname $MITK_SRCDIR/Modules/*/include); do
    mkdir -p $MITK_BINDIR/include/mitk/$(basename $i)
    cp -R $i/include $MITK_BINDIR/include/mitk/$(basename $i)
done

for i in $(dirname $MITK_SRCDIR/Modules/*/include); do
    cp $MITK_BLDDIR/MITK-build/Modules/$(basename $i)/ui_*.h $MITK_BINDIR/include/mitk/$(basename $i)
done

for i in $(dirname $MITK_SRCDIR/Modules/*/*/include); do
    mkdir -p $MITK_BINDIR/include/mitk/$(basename $(dirname $i))/$(basename $i)
    cp -R $i/include $MITK_BINDIR/include/mitk/$(basename $(dirname $i))/$(basename $i)
done


for i in $(find $MITK_BLDDIR -name "*Exports.h"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/include/mitk/exports
done

for i in $(find $MITK_BLDDIR/MITK-build/Modules -name "*Export.h"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/include/mitk/exports
done

for i in $(find $MITK_BLDDIR/MITK-build/Modules -name "ui_*.h"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/include/mitk/ui_files
done

for i in $(find $MITK_BLDDIR/MITK-build -name "*Config.h"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/include/mitk/configs
done

           mkdir -p $MITK_BINDIR/include/mitk/Modules/ContourModel/DataManagement
           mkdir -p $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/module
           mkdir -p $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/service
           mkdir -p $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/util
           mkdir -p $MITK_BINDIR/include/mitk/Modules/ImageDenoising
           mkdir -p $MITK_BINDIR/include/mitk/Modules/LegacyGL
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Multilabel
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Overlays
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Segmentation/Algorithms
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Segmentation/Controllers
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Segmentation/Interactions
           mkdir -p $MITK_BINDIR/include/mitk/Modules/SegmentationUI/Qmitk
           mkdir -p $MITK_BINDIR/include/mitk/Modules/SurfaceInterpolation
	   
           mkdir -p $MITK_BINDIR/include/mitk/Modules/ContourModel
           mkdir -p $MITK_BINDIR/include/mitk/Modules/ImageDenoising
           mkdir -p $MITK_BINDIR/include/mitk/Modules/LegacyGL
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Multilabel
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Overlays
           mkdir -p $MITK_BINDIR/include/mitk/Modules/QtWidgets
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Segmentation
           mkdir -p $MITK_BINDIR/include/mitk/Modules/Segmentation/Interactions
           mkdir -p $MITK_BINDIR/include/mitk/Modules/SegmentationUI
           mkdir -p $MITK_BINDIR/include/mitk/Modules/SurfaceInterpolation
           mkdir -p $MITK_BINDIR/include/mitk/Utilities/mbilog

	   cp -fl $MITK_SRCDIR/Modules/ContourModel/DataManagement/*.h $MITK_BINDIR/include/mitk/Modules/ContourModel/DataManagement
           cp -fl $MITK_SRCDIR/Modules/CppMicroServices/core/src/module/*.h $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/module
           cp -fl $MITK_SRCDIR/Modules/CppMicroServices/core/src/service/*.h $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/service
           cp -fl $MITK_SRCDIR/Modules/CppMicroServices/core/src/util/*.h $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/util
	   cp -fl $MITK_SRCDIR/Modules/CppMicroServices/core/src/module/*.tpp $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/module
           cp -fl $MITK_SRCDIR/Modules/CppMicroServices/core/src/service/*.tpp $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/service
           cp -fl $MITK_SRCDIR/Modules/CppMicroServices/core/src/util/*.tpp $MITK_BINDIR/include/mitk/Modules/CppMicroServices/core/src/util
           cp -fl $MITK_SRCDIR/Modules/ImageDenoising/*.h $MITK_BINDIR/include/mitk/Modules/ImageDenoising
	   cp -fl $MITK_SRCDIR/Modules/ImageDenoising/*.txx $MITK_BINDIR/include/mitk/Modules/ImageDenoising
           cp -fl $MITK_SRCDIR/Modules/LegacyGL/*.h $MITK_BINDIR/include/mitk/Modules/LegacyGL
           cp -fl $MITK_SRCDIR/Modules/Multilabel/*.h $MITK_BINDIR/include/mitk/Modules/Multilabel
           cp -fl $MITK_SRCDIR/Modules/Overlays/*.h $MITK_BINDIR/include/mitk/Modules/Overlays
           cp -fl $MITK_SRCDIR/Modules/Segmentation/Algorithms/*.h $MITK_BINDIR/include/mitk/Modules/Segmentation/Algorithms
           cp -fl $MITK_SRCDIR/Modules/Segmentation/Controllers/*.h $MITK_BINDIR/include/mitk/Modules/Segmentation/Controllers
           cp -fl $MITK_SRCDIR/Modules/Segmentation/Interactions/*.h $MITK_BINDIR/include/mitk/Modules/Segmentation/Interactions
           cp -fl $MITK_SRCDIR/Modules/SegmentationUI/Qmitk/*.h $MITK_BINDIR/include/mitk/Modules/SegmentationUI/Qmitk
           cp -fl $MITK_SRCDIR/Modules/SurfaceInterpolation/*.h $MITK_BINDIR/include/mitk/Modules/SurfaceInterpolation
           cp -fl $MITK_SRCDIR/Utilities/mbilog/*.h $MITK_BINDIR/include/mitk/Utilities/mbilog
	   
           cp -fl $MITK_BLDDIR/MITK-build/Modules/ContourModel/*.h $MITK_BINDIR/include/mitk/Modules/ContourModel
           cp -fl $MITK_BLDDIR/MITK-build/Modules/ImageDenoising/*.h $MITK_BINDIR/include/mitk/Modules/ImageDenoising
           cp -fl $MITK_BLDDIR/MITK-build/Modules/LegacyGL/*.h $MITK_BINDIR/include/mitk/Modules/LegacyGL
           cp -fl $MITK_BLDDIR/MITK-build/Modules/Multilabel/*.h $MITK_BINDIR/include/mitk/Modules/Multilabel
           cp -fl $MITK_BLDDIR/MITK-build/Modules/Overlays/*.h $MITK_BINDIR/include/mitk/Modules/Overlays
           cp -fl $MITK_BLDDIR/MITK-build/Modules/QtWidgets/*.h $MITK_BINDIR/include/mitk/Modules/QtWidgets
           cp -fl $MITK_BLDDIR/MITK-build/Modules/Segmentation/*.h $MITK_BINDIR/include/mitk/Modules/Segmentation
           cp -fl $MITK_BLDDIR/MITK-build/Modules/Segmentation/Interactions/*.h $MITK_BINDIR/include/mitk/Modules/Segmentation/Interactions
           cp -fl $MITK_BLDDIR/MITK-build/Modules/SegmentationUI/*.h $MITK_BINDIR/include/mitk/Modules/SegmentationUI
           cp -fl $MITK_BLDDIR/MITK-build/Modules/SurfaceInterpolation/*.h $MITK_BINDIR/include/mitk/Modules/SurfaceInterpolation

# copy executable
cp -fl $MITK_BLDDIR/MITK-build/bin/MitkWorkbench* $MITK_BINDIR/bin
cp -fl $MITK_BLDDIR/MITK-build/bin/usResourceCompiler* $MITK_BINDIR/bin
cp -fl $MITK_BLDDIR/MITK-build/bin/MitkPluginGenerator* $MITK_BINDIR/bin

for i in $(find $MITK_BLDDIR/MITK-build/lib/plugins -name "*.REPLACEME_SV_SO_FILE_EXTENSION*"); do
    echo "$i  $(basename $i)"
    cp -fl $i $MITK_BINDIR/bin/plugins
done

# create a wrapper script for python executable

echo "#!/bin/sh -f" > REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "export LD_LIBRARY_PATH=REPLACEME_SV_TOP_BIN_DIR_MITK/lib:\$LD_LIBRARY_PATH" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "export LD_LIBRARY_PATH=REPLACEME_SV_TOP_BIN_DIR_MITK/bin:\$LD_LIBRARY_PATH" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "export PYTHONHOME=REPLACEME_SV_TOP_BIN_DIR_PYTHON" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "export PYTHONPATH=REPLACEME_SV_TOP_BIN_DIR_PYTHON/lib/python2.7/lib-dynload:REPLACEME_SV_TOP_BIN_DIR_PYTHON/lib:REPLACEME_SV_TOP_BIN_DIR_PYTHON/lib/python2.7:REPLACEME_SV_TOP_BIN_DIR_PYTHON/lib/python2.7/site-packages" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "if [ \"\$#\" -gt 0 ]" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "then" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "  REPLACEME_SV_TOP_BIN_DIR_MITK/bin/MitkWorkbench \"\$1\" \"\$2\" \"\$3\" \"\$4\" \"\$5\" " >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "else" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "  REPLACEME_SV_TOP_BIN_DIR_MITK/bin/MitkWorkbench" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
echo "fi" >> REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
chmod u+w,a+rx REPLACEME_SV_TOP_BIN_DIR_MITK/bin/workbench-wrapper
