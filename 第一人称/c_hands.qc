// by Starfelll、糯米饭团

$DefineVariable custom_model "smd/主手臂.smd"
$DefineVariable custom_model_name "XXX"

$modelname "weapons\arms\$custom_model_name$_arms.mdl"

$BodyGroup "arms" {
    studio $custom_model$
    //blank
}

$bodygroup "其它附件"
{
	studio "smd/其它附件.smd"
    blank
}


$include "materials.qci"

$surfaceprop "default"
$contents "solid"
$illumposition 0 0 -31
$MostlyOpaque //$Opaque // 
$AmbientBoost
$cbox 0 0 0 0 0 0
$bbox -6.244 -19.783 0 15.463 19.803 59.379

$include "qci/bone.qci"

$Sequence "idle" $custom_model$ Pick "BindPose" frame 0 0
// $sequence "idle" {
// 	"anims\idle.smd"
// 	fadein 0.2
// 	fadeout 0.2
// 	fps 30
// }

$include "flexbone.qci"

$proceduralbones "c_hands.vrd"

$includemodel "weapons/c_arms_animations.mdl"