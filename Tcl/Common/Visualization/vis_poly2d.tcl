# Copyright (c) Stanford University, The Regents of the University of
#               California, and others.
#
# All Rights Reserved.
#
# See Copyright-SimVascular.txt for additional details.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# ------------
# vis_pRepos2D
# ------------

proc vis_pRepos2D {ren objName} {

    if {![repos_exists -obj $objName]} {
	return -code error "$objName not in repository"
    }

    if {[repos_type -obj $objName] != "PolyData"} {
	return -code error "$objName not of type PolyData"
    }

    set tag [format "%s_%s" $ren $objName]

    set map  vis_p2d_map_$tag
    set act  vis_p2d_act_$tag
    set prop vis_p2d_prp_$tag

    # default behavior is to remove and replace the actor
    # if it already exists
    if {[cmdExists $map] || [cmdExists $act]} {
       vis_pRm2D $ren $objName
    }

    set vtkName [repos_exportToVtk -src $objName]

    # create a 2d mapper
    vtkPolyDataMapper2D $map
    $map SetInputDataObject $vtkName
    $map ScalarVisibilityOff

    # create a 2D property
    vtkProperty2D $prop
    $prop SetColor 1 0 0
    $prop SetLineWidth 1
    $prop SetOpacity 0.5

    # create a 2D actor
    vtkActor2D $act
    $act SetMapper $map
    $act SetProperty $prop

    # add the actor to the imager
    $ren AddActor2D $act

    # update the render window
    vis_render $ren

    # return the name of the actor
    return $act

}


# --------------
# vis_pGetName2D
# --------------

proc vis_pGetName2D {ren act} {
    set rlen [string length $ren]
    set startIx [expr 12 + $rlen + 1]
    return [string range $act $startIx end]
}


# ---------------
# vis_pGetActor2D
# ---------------

proc vis_pGetActor2D {ren objName} {
    set tag [format "%s_%s" $ren $objName]
    set act vis_p2d_act_$tag
    if {[cmdExists $act]} {
	return $act
    }
    return ""
}


# -------------------------
# vis_pGetDisplayedActors2D
# -------------------------
# Returns object names corresponding to all objects currently
# displayed in the given renderer which were posted via the "vis_p*"
# set of functions.

proc vis_pGetDisplayedActors2D {ren} {
    set num [[$ren GetActors2D] GetNumberOfItems]
    set prefix [format "vis_p2d_act_%s_" $ren]
    set ix [string length $prefix]
    set objs {}
    for {set i 0} {$i < $num} {incr i} {
	set a [[$ren GetActors2D] GetItemAsObject $i]
	if {[string first $prefix $a] == 0} {
	    set obj [string range $a $ix end]
	    set objs [lappend objs $obj]
	}
    }
    return $objs
}


# ---------
# vis_pRm2D
# ---------

proc vis_pRm2D {ren objName} {

    set tag [format "%s_%s" $ren $objName]
    set ppd vis_p2d_ppd_$tag

    set cmds [info commands vis_p2d_*_$tag]
    foreach c $cmds {
        # before sure to delete actor if its picked
        global PickedAssembly
        if {$c == $PickedAssembly} {
           DeselectPickedActor
	}
	if {[[$ren GetActors2D] IsItemPresent $c] > 0} {
	    $ren RemoveActor2D $c
	}
	$c Delete
    }
    vis_render $ren
}


# ------------
# vis_pRmAll2D
# ------------

proc vis_pRmAll2D {ren} {

    set glob_pat [format "vis_p2d_ppd_%s_*" $ren]
    set cmds [info commands $glob_pat]
    foreach c $cmds {
        global PickedAssembly
        if {$c == $PickedAssembly} {
          DeselectPickedActor
	}
    }

    set glob_pat [format "vis_p2d_???_%s_*" $ren]
    set cmds [info commands $glob_pat]
    foreach c $cmds {
	if {[[$ren GetActors] IsItemPresent $c] > 0} {
	    $ren RemoveActor2D $c
	}
	$c Delete
    }
    vis_render $ren
}
