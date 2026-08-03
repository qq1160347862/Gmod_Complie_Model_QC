// by Starfelll、糯米饭团

$modelname "yulily/dropProps.mdl"

$bodygroup "dropProps"
{
	studio "SMD/dropProps.smd"

}

$cdmaterials "XXX"

// $include "dropProps_lod.qci"

$surfaceprop "plastic"
$contents "solid"
$illumposition -0.593 -1.381 -0.378
$forcephonemecrossfade
$ambientboost
$mostlyopaque

// $texturegroup "skinfamilies"
// {
// 	{ 
// 		"OH_Outline_Material"
// 	}
// 	{ 	
// 		"OH_Outline_Material_None"
// 	}
// }

$definebone "static_prop" "" 0 0 0 0 0 0 0 0 0 0 0 0
$cbox 0 0 0 0 0 0
$bbox -2.041 -3.974 -8.771 4.802 2.788 8.022

$sequence "idle" {
	"anims\idle.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "SMD/dropProps.smd"
{
	$mass 10
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}